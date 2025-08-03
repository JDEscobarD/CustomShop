<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Models\Product;
use App\Models\Category;
use App\Models\CompositionType;
use App\Models\Format;
use Illuminate\Support\Str;

class ProductsController extends Controller
{
    public function index()
    {
        $products = Product::with('category')->paginate(10);
        $listCategories = \App\Models\Category::all();
        return view('dashboard.products', compact('products', 'listCategories'));
    }

    public function create()
    {
        $categories = Category::orderBy('nombre')->get();
        $listOptions = CompositionType::orderBy('opcion')->get();
        $formats = Format::orderBy('formato')->get();
        $listCategories = Category::orderBy('nombre')->get();
        
        return view('dashboard.new-product', compact(
            'categories', 
            'listOptions',
            'formats',
            'listCategories'
        ));
    }

    public function store(Request $request)
    {
        // dd($request->all()); // PARA DEPURAR POR SI HAY ALGÚN ERROR

        // Limpiar campos de precio antes de la validación
        $input = $request->all();
        $priceFields = ['precio_regular', 'precio_oferta', 'costo_envio'];
        foreach ($priceFields as $field) {
            if (isset($input[$field]) && is_string($input[$field])) {
                // Elimina todos los caracteres que no sean dígitos.
                $input[$field] = preg_replace('/[^\d]/', '', $input[$field]);
            }
        }
        if (isset($input['compositions']) && is_array($input['compositions'])) {
            foreach ($input['compositions'] as $compKey => $composition) {
                if (isset($composition['fields']) && is_array($composition['fields'])) {
                    foreach ($composition['fields'] as $fieldKey => $field) {
                        if (isset($field['precio_adicional']) && is_string($field['precio_adicional'])) {
                            $input['compositions'][$compKey]['fields'][$fieldKey]['precio_adicional'] = preg_replace('/[^\d]/', '', $field['precio_adicional']);
                        }
                    }
                }
            }
        }
        $request->replace($input);

        $validationRules = [
            'nombre' => 'required|string|max:255',
            'descripcion' => 'nullable|string',
            'precio_regular' => 'required|string',
            'precio_oferta' => 'nullable|string',
            'composition_option_id' => 'required|exists:composition_types,id',
            'format_id' => 'required|exists:formats,id',
            'category_id' => 'required|exists:categories,id',
            'unidades_disponibles' => 'nullable|integer|min:0',
            'url' => 'nullable|string',
            'imagen_portada' => 'nullable|image|max:3000',
            'gallery.*' => 'nullable|image|max:5000',
            'attributes.*.nombre' => 'nullable|string',
            'attributes.*.descripcion' => 'nullable|string',
            'envio_gratis' => 'nullable|boolean',
            'costo_envio' => 'nullable|string'
        ];
    
        if ($request->composition_option_id == 1) { // Si es un producto compuesto
            $validationRules['compositions.*.nombre_campo'] = 'required|string';
            $validationRules['compositions.*.fields.*.articulo_id'] = 'required|exists:products,id';
            $validationRules['compositions.*.fields.*.precio_adicional'] = 'nullable|string';
        }

        $validated = $request->validate($validationRules);

        // Si el checkbox no está marcado, no se envía. Lo seteamos a 0.
        $validated['envio_gratis'] = $request->has('envio_gratis') ? 1 : 0;

        try {
            DB::beginTransaction();

            $product = Product::create(\Illuminate\Support\Arr::except($validated, ['attributes', 'compositions', 'gallery']));

            // Generar el slug y asegurarse de que sea único
            $slug = Str::slug($request->nombre);
            $count = Product::where('url', 'LIKE', "$slug%")->count();
            if ($count > 0) {
                $slug = $slug . '-' . ($count + 1);
            }
            $product->url = $slug;
            $product->save();

            $this->handleAttributes($product, $request);
            $this->handleCompositions($product, $request);
            $this->handleGallery($product, $request);

            DB::commit();

            return redirect()->route('new-product')->with('success', '¡Producto creado exitosamente!');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', 'Error: ' . $e->getMessage())->withInput();
        }
    }

    private function handleAttributes(Product $product, Request $request)
    {
        if ($request->has('attributes')) {
            foreach ($request->input('attributes') as $attribute) {
                $product->attributes()->create([
                    'nombre' => $attribute['nombre'],
                    'descripcion' => $attribute['descripcion']
                ]);
            }
        }
    }

    private function handleCompositions(Product $product, Request $request)
    {
        if ($request->composition_option_id == 1 && $request->has('compositions')) {
            foreach ($request->input('compositions') as $compositionData) {
                // Create the main composition group
                $productComposition = $product->compositions()->create([
                    'nombre_campo' => $compositionData['nombre_campo'],
                ]);

                if (isset($compositionData['fields']) && is_array($compositionData['fields'])) {
                    foreach ($compositionData['fields'] as $fieldData) {
                        // Create the options for that group
                        $productComposition->options()->create([
                            'option_product_id' => $fieldData['articulo_id'],
                            'precio_adicional' => $fieldData['precio_adicional'] ?? 0,
                        ]);
                    }
                }
            }
        }
    }



    private function handleGallery(Product $product, Request $request)
    {
        Log::info('Storage public path: ' . storage_path('app/public'));
        if ($request->hasFile('imagen_portada')) {
            $file = $request->file('imagen_portada');
            Log::info('imagen_portada exists.');
            Log::info('Is valid: ' . ($file->isValid() ? 'true' : 'false'));
            Log::info('Client original name: ' . $file->getClientOriginalName());
            Log::info('Client MIME type: ' . $file->getClientMimeType());
            Log::info('Client size: ' . $file->getSize());
            Log::info('Real path: ' . $file->getRealPath());
            Log::info('Error: ' . $file->getError());
            Log::info('Error message: ' . $file->getErrorMessage());

            if ($file->isValid()) {                
                $realPath = $file->getRealPath(); 
                Log::info('Real path after isValid(): ' . $realPath);
                if (empty($realPath)) {
                    Log::error('Real path is empty, cannot store file. Check PHP upload_tmp_dir configuration and permissions. Also check if the file was actually moved to tmp by PHP.');
                } else {
                    $path = $file->store('products', 'public');
                    $product->update(['imagen_portada' => $path]);
                }
            } else {
                Log::error('Uploaded file is not valid. Error: ' . $file->getErrorMessage());
            }
        }

        if ($request->hasFile('gallery')) {
            foreach ($request->file('gallery') as $image) {
                $path = $image->store('products/gallery', 'public');
                $product->gallery()->create([
                    'imagen_url' => $path,
                    'orden' => 0
                ]);
            }
        }
    }

    public function getProductsByCategory(Category $category)
    {
        $products = Product::where('category_id', $category->id)
                            ->where('composition_option_id', '!=', 1) // Asumiendo que 1 = 'Sí' es para productos compuestos
                            ->get();
        return response()->json($products);
    }
}
