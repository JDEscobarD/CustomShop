<div class="modal fade" id="{{ $id }}" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><strong>{{ $title }}</strong></h5>
            </div>
            <div class="modal-body">
                {{ $slot }}
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary px-5" data-bs-dismiss="modal" aria-label="Close">Aceptar</button>
            </div>
        </div>
    </div>
</div>