<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Models\Product;
use App\Models\Category;
use App\Models\CompositionType;
use App\Models\Format;

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

        $validationRules = [
            'nombre' => 'required|string|max:255',
            'descripcion' => 'nullable|string',
            'precio_regular' => 'required|numeric|min:0',
            'precio_oferta' => 'nullable|numeric|min:0',
            'composition_option_id' => 'required|exists:composition_types,id',
            'format_id' => 'required|exists:formats,id',
            'category_id' => 'required|exists:categories,id',
            'unidades_disponibles' => 'nullable|integer|min:0',
            'url' => 'nullable|url',
            'imagen_portada' => 'nullable|image|max:3000',
            'gallery.*' => 'nullable|image|max:5000',
            'attributes.*.nombre' => 'nullable|string',
            'attributes.*.descripcion' => 'nullable|string',
            'envio_gratis' => 'nullable|boolean',
            'costo_envio' => 'nullable|numeric|min:0'
        ];
    
        if ($request->composition_option_id != 2) {
            $validationRules['compositions.*.nombre_campo'] = 'nullable|string';
            $validationRules['compositions.*.category_id'] = 'nullable|exists:categories,id';
            $validationRules['compositions.*.articulo_id'] = 'nullable|exists:articulos,id';
            $validationRules['compositions.*.precio_adicional'] = 'nullable|numeric|min:0';
        }

        $validated = $request->validate($validationRules);

        try {
            DB::beginTransaction();

            $product = Product::create($validated);

            $this->handleAttributes($product, $request);
            $this->handleCompositions($product, $request);
            $this->handleShipping($product, $request);
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
        if ($request->composition_option_id != 2 && $request->has('compositions')) { 
            foreach ($request->input('compositions') as $composition) {
                $product->compositions()->create([
                    'nombre_campo' => $composition['nombre_campo'],
                    'category_id' => $composition['category_id'],
                    'articulo_id' => $composition['articulo_id'],
                    'precio_adicional' => $composition['precio_adicional']
                ]);
            }
        }
    }

    private function handleShipping(Product $product, Request $request)
    {
        $product->shipping()->create([
            'envio_gratis' => $request->input('envio_gratis', false),
            'costo_envio' => $request->input('costo_envio', 0)
        ]);
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
}
