<!-- Sección de Precio -->
<div id="price" class="tabcontent">
    <div class="row flex-column">
        <div class="col-lg-6 mb-4">
            <label class="form-label">Precio del producto: <span class="text-danger">*</span></label>
            <input type="text" class="form-control price-input w-100 @error('precio_regular') is-invalid @enderror" name="precio_regular" placeholder="$ 0" required>
            @error('precio_regular')
            <span class="invalid-feedback">{{ $message }}</span>
            @enderror
        </div>
        <div class="col-lg-6 mb-4">
            <label class="form-label">Precio en oferta:</label>
            <input type="text" class="form-control price-input w-100 @error('precio_oferta') is-invalid @enderror" name="precio_oferta" placeholder="$ 0">
            @error('precio_oferta')
            <span class="invalid-feedback">{{ $message }}</span>
            @enderror
        </div>
    </div>
</div>