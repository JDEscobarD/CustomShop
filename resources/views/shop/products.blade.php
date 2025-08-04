@extends('store.app')

@section('content_web')
<div class="container product-detail-container my-5">
    <div class="row">
        {{-- Columna Izquierda: Detalles y Personalización --}}
        <div class="col-lg-6">
            <h1 class="product-title">{{ $product->nombre }}</h1>
            <p class="text-muted">{{ $product->descripcion }}</p>

            <h2 class="customization-title mt-5">¡Personaliza tu bici!</h2>
            
            <div class="customization-options">
                @foreach($product->compositions as $composition)
                    <div class="form-group mb-3">
                        <label for="composition-{{ $composition->id }}">{{ $composition->nombre_campo }}</label>
                        <select class="form-control custom-select" id="composition-{{ $composition->id }}">
                            @foreach($composition->options as $option)
                                <option value="{{ $option->id }}">
                                    {{ $option->optionProduct->nombre }} 
                                    @if($option->precio_adicional > 0)
                                        (+{{ number_format($option->precio_adicional, 0, ',', '.') }})
                                    @endif
                                </option>
                            @endforeach
                        </select>
                    </div>
                @endforeach
            </div>
        </div>

        {{-- Columna Derecha: Imagen y Atributos --}}
        <div class="col-lg-6">
            <div class="main-image-container mb-3">
                <img src="{{ $product->imagen_portada ? asset('storage/' . $product->imagen_portada) : 'https://via.placeholder.com/600x400.png/000000/FFFFFF?text=Product+Image' }}" class="img-fluid main-image" alt="{{ $product->nombre }}">
            </div>
            <div class="thumbnail-gallery d-flex justify-content-center mb-4">
                @if($product->imagen_portada)
                <img src="{{ asset('storage/' . $product->imagen_portada) }}" class="img-thumbnail active-thumb mx-1" alt="thumbnail">
                @endif
                @foreach($product->gallery as $image)
                <img src="{{ asset('storage/' . $image->imagen_url) }}" class="img-thumbnail mx-1" alt="thumbnail">
                @endforeach
            </div>

            <div class="product-attributes mb-4">
                @foreach($product->attributes as $attribute)
                <div class="d-flex justify-content-between">
                    <strong>{{ $attribute->nombre }}:</strong>
                    <span>{{ $attribute->descripcion }}</span>
                </div>
                @endforeach
            </div>

            <div class="quantity-selector d-flex align-items-center justify-content-center">
                <button class="btn btn-outline-secondary btn-sm">-</button>
                <span class="mx-3">Und 1</span>
                <button class="btn btn-outline-secondary btn-sm">+</button>
            </div>
        </div>
    </div>

    {{-- Sección de Precio y Compra --}}
    <div class="row purchase-section-row mt-5">
        <div class="col-12">
            <div class="purchase-section d-flex justify-content-between align-items-center p-4">
                <div>
                    <div class="price-display">$ {{ number_format($product->precio_regular, 0, ',', '.') }}</div>
                    <small class="text-muted d-block"><i class="bi bi-info-circle"></i> El valor no incluye el envío y está sujeto variaciones dependiendo de la ciudad de destino.</small>
                </div>
                <div class="purchase-buttons">
                    <button class="btn btn-primary btn-buy">Comprar</button>
                    <button class="btn btn-outline-secondary btn-add-cart">Añadir al carrito</button>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection