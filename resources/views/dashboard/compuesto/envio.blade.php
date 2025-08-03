<div id="shipping" class="tabcontent d-none">
    <div class="form-check mb-4">
        <input class="form-check-input" type="checkbox" name="envio_gratis" id="envioGratis" value="1">
        <label class="form-check-label" for="envioGratis">Envío gratis</label>
    </div>
    <div class="row">
        <div class="col-lg-6">
            <div class="mb-4">
                <label class="form-label">Costo de envío</label>
                <input type="text" class="form-control @error('costo_envio') is-invalid @enderror" name="costo_envio" id="costoEnvio" placeholder="$ 0">
                @error('costo_envio')
                <span class="invalid-feedback">{{ $message }}</span>
                @enderror
            </div>
        </div>
    </div>
</div>