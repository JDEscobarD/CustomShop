@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="header-body-content pb-3 mb-4">
        <div class="row align-item-center">
            <div class="col-xl-9 mb-3">
                <h1 class="text-left fw-bold">Productos</h1>
            </div>
            <div class="col-xl-3 mb-3">
                <div class="box-button d-flex align-items-center justify-content-end">
                    <form class="d-flex search-controller w-100" role="search" action="" method="GET">
                        <input class="form-control" type="search" name="query" placeholder="Buscar" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit" aria-label="Buscar"></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="filter-section">
        <div class="row align-items-end">
            <div class="col-xl-2 col-lg-4 mb-3">
                <label for="categories" class="form-label">Acción por lotes</label>
                <select class="form-select" name="categories" aria-label="Default select example">
                    <option selected disabled>Seleccione</option>
                    <option value="2">Borrar</option>
                </select>
            </div>
            <div class="col-xl-2 col-lg-4 mb-3">
                <label for="categories" class="form-label">Filtrar</label>
                <select class="form-select" name="categories" aria-label="Default select example">
                    <option selected disabled>Categoria</option>
                    @foreach ($listCategories as $category )
                        <option value="{{$category->id}}">{{$category->nombre}}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-xl-2 col-lg-4 mb-3">
                <select class="form-select" aria-label="Default select example">
                    <option selected disabled>Fecha</option>
                    <option value="1">Agregado recientemente</option>
                    <option value="2">Últimos 3 meses</option>
                    <option value="3">últimos 6 meses</option>
                </select>
            </div>
            <div class="col-xl-2 col-lg-4 mb-3">
                <label for="orderFilter" class="form-label">Ordenar por:</label>
                <select class="form-select" id="orderFilter">
                    <option selected disabled value="1">Seleccione</option>
                    <option value="2">A-Z</option>
                    <option value="3">Z-A</option>
                    <option value="4">Mayor precio a menor</option>
                    <option value="5">Menor precio a mayor</option>
                </select>
            </div>
            <div class="col-xl-2 col-lg-4 mb-3">
                <button type="submit" id="applyFilter" class="btn btn-outline-primary px-5 w-100">Aplicar</button>
            </div>
            <div class="col-xl-2 col-lg-4 mb-3">
                <button type="button" id="resetFilter" class="btn btn-link red">Borrar filtros</button>
            </div>
        </div>
    </div>
    <form action="#" method="GET">
        <div class="table-responsive mt-4">
            <table class="table table-striped" id="productTable">
                <thead>
                    <tr>
                        <th scope="col">
                            <div class="form-check">
                                <input class="form-check-input row-checkbox" type="checkbox" value="" id="selectAll">
                            </div>
                        </th>
                        <th>ID</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Inventario</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Categoría</th>
                        <th scope="col">Fecha</th>
                        <th scope="col">Ver en tienda</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                    @forelse ($products as $product)
                    <tr>
                        <th scope="row">
                            <div class="form-check">                                
                                <input class="form-check-input row-checkbox" type="checkbox" value="{{ $product->id }}" id="product_checkbox_{{ $product->id }}">
                            </div>
                        </th>
                        <td><strong>{{ $product->id }}</strong></td>
                        <td class="name-item">{{ $product->nombre }}</td>
                        <td>{{ $product->unidades_disponibles }} Unidades</td>
                        <td class="price-item">{{ '$ ' . number_format($product->precio_regular, 0, ',', '.') }}</td>
                        <td>{{ $product->category->nombre ?? 'Sin Categoría' }}</td>
                        <td>{{ $product->created_at ? $product->created_at->format('d/m/Y') : 'N/A' }}</td>
                        <td>
                            <a href="{{ route('shop.product.show', $product) }}" class="btn btn-info me-2" target="_blank">Ver</a>
                        </td>
                        <td>
                            <a href="{{ url('dashboard/products/' . $product->id . '/edit') }}" class="btn btn-primary me-2">Editar</a>
                            <form action="{{ url('dashboard/products/' . $product->id) }}" method="POST" style="display: inline-block;" onsubmit="return confirm('¿Estás seguro de que quieres eliminar este producto?');">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-outline-danger">Eliminar</button>
                            </form>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="8" class="text-center">No hay productos para mostrar.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </form>
    <div class="pagination">
        <div class="row w-100 align-items-center"> {{-- Corrected typo: aling-items-center to align-items-center --}}
            <div class="col-lg-6">
                @if ($products->total() > 0)
                <p id="item-count" class="mt-4 mb-0">
                    Mostrando {{ $products->firstItem() }} - {{ $products->lastItem() }} de {{ $products->total() }} resultados
                </p>
                @else
                <p id="item-count" class="mt-4 mb-0">Mostrando 0 resultados</p>
                @endif
            </div>
            <div class="col-lg-6 d-flex justify-content-end">
                @if ($products->hasPages())
                <nav class="mt-4">
                    {{ $products->links() }} {{-- This will render Laravel's default pagination links --}}
                </nav>
                @endif
            </div>
        </div>
    </div>
</div>

@endsection