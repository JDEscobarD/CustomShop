@extends('layouts.store')

@section('content_web')
<div class="container">
    <div class="row py-5">
        @foreach ($products as $product)
        <div class="col-md-2 mb-4">
            <div class="card" style="width: 100%;">                
                <a href="{{ route('shop.product.show', $product) }}">
                    <img src="{{ $product->imagen_portada ? asset('storage/' . $product->imagen_portada) : asset('media/images/images_web/imagen1.jpg') }}" class="card-img-top" alt="{{ $product->nombre }}">
                </a>
                <div class="card-body">
                    <h5 class="card-title">{{ $product->nombre }}</h5>
                    <p class="card-text">${{ number_format($product->precio_regular, 0, ',', '.') }}</p>
                    <a href="{{ route('shop.product.show', $product) }}" class="btn btn-primary">Ver producto</a>
                </div>
            </div>
        </div>
        @endforeach
    </div>
</div>
@endsection