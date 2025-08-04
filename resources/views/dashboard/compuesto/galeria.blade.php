<!-- Sección de Galería -->
<div id="galery" class="tabcontent d-none">
    <div id="dropzone" class="dropzone border p-4 text-center" style="cursor: pointer; border: 2px dashed #aaa;">
        <p>Subir imágenes<span class="text-danger">*</span></p>
        <p class="text-muted">Solo se aceptan formatos JPG, JPEG y PNG. Máximo 3MB.</p>
        <input type="file" id="fileInput" name="gallery[]" multiple accept=".jpg, .jpeg, .png" required>
        @error('gallery')
        <span class="invalid-feedback d-block">{{ $message }}</span>
        @enderror
    </div>
    <div id="preview" class="mt-3 d-flex flex-wrap">
        @if(isset($product) && $product->gallery && $product->gallery->count() > 0)
            @foreach($product->gallery as $image)
                <div class="position-relative me-2 mb-2" id="image-{{ $image->id }}">
                    <img src="{{ asset('storage/' . $image->imagen_url) }}" alt="Product Image" class="img-thumbnail" width="100">
                    <button type="button" class="btn btn-danger btn-sm position-absolute top-0 end-0" onclick="deleteImage({{ $image->id }})">&times;</button>
                </div>
            @endforeach
        @endif
    </div>
</div>