<!-- Sección de Composición -->
<div id="composed" class="tabcontent d-none">
    <div id="compositions-container">
        @if(isset($product) && $product->compositions && $product->compositions->count() > 0)
            @foreach($product->compositions as $compIndex => $composition)
            <div class="composition-item card-component mb-3">
                <div class="card-component-body">
                    <div class="row mb-2">
                        <div class="col-12">
                            <label class="form-label">Nombre del campo:</label>
                            <input type="text" class="form-control w-100 mb-2" name="compositions[{{ $compIndex }}][nombre_campo]" placeholder="Ej: Elige tu llanta" value="{{ $composition->nombre_campo }}">
                        </div>
                    </div>
                    <div class="composition-fields-container">
                        @foreach($composition->options as $optIndex => $option)
                        <div class="row mb-2 composition-field">
                            <div class="col-md-4">
                                <label class="form-label">Categoría</label>
                                <select class="form-select composition-category" name="compositions[{{ $compIndex }}][fields][{{ $optIndex }}][category_id]">
                                    <option value="">Seleccione...</option>
                                    @foreach ($listCategories as $category)
                                    <option value="{{$category->id}}" {{ $option->product->category_id == $category->id ? 'selected' : '' }}>{{$category->nombre}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Artículo</label>
                                <select class="form-select composition-product" name="compositions[{{ $compIndex }}][fields][{{ $optIndex }}][articulo_id]">
                                    <option value="{{ $option->option_product_id }}" selected>{{ $option->product->nombre }}</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">Precio adicional</label>
                                <div class="input-group">
                                    <input type="text" class="form-control price-input" name="compositions[{{ $compIndex }}][fields][{{ $optIndex }}][precio_adicional]" placeholder="$ 0" value="{{ $option->precio_adicional }}">
                                </div>
                            </div>
                            <div class="col-md-1 d-flex align-items-end">
                                <button type="button" class="btn btn-danger remove-field" @if($optIndex == 0) style="display:none;" @endif>-</button>
                            </div>
                        </div>
                        @endforeach
                    </div>
                    <div class="text-start">
                        <a href="#" class="btn btn-link text-start add-composition-field">+ Agregar más productos</a>
                    </div>
                </div>
            </div>
            @endforeach
        @else
        <div class="composition-item card-component mb-3">
            <div class="card-component-body">
                <div class="row mb-2">
                    <div class="col-12">
                        <label class="form-label">Nombre del campo:</label>
                        <input type="text" class="form-control w-100 mb-2" name="compositions[0][nombre_campo]" placeholder="Ej: Elige tu llanta">
                    </div>
                </div>
                <div class="composition-fields-container">
                    <div class="row mb-2 composition-field">
                        <div class="col-md-4">
                            <label class="form-label">Categoría</label>
                            <select class="form-select composition-category" name="compositions[0][fields][0][category_id]">
                                <option value="">Seleccione...</option>
                                @foreach ($listCategories as $category)
                                <option value="{{$category->id}}">{{$category->nombre}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Artículo</label>
                            <select class="form-select composition-product" name="compositions[0][fields][0][articulo_id]">
                                <option value="">Seleccione una categoría primero...</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Precio adicional</label>
                            <div class="input-group">
                                <input type="text" class="form-control price-input" name="compositions[0][fields][0][precio_adicional]" placeholder="$ 0">
                            </div>
                        </div>
                        <div class="col-md-1 d-flex align-items-end">
                            <button type="button" class="btn btn-danger remove-field" style="display:none;">-</button>
                        </div>
                    </div>
                </div>
                <div class="text-start">
                    <a href="#" class="btn btn-link text-start add-composition-field">+ Agregar más productos</a>
                </div>
            </div>
        </div>
        @endif
    </div>
    <div class="text-start">
        <a href="#" id="add-composition-item" class="btn btn-link text-start">+ Agregar otro campo</a>
    </div>
</div>