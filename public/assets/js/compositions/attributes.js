document.addEventListener('DOMContentLoaded', function () {
    let attributeIndex = document.querySelectorAll('.card-attribute').length;

    document.getElementById('add-attribute').addEventListener('click', function (e) {
        e.preventDefault();

        const attributesContainer = document.getElementById('attributes');
        const newCard = document.createElement('div');
        newCard.className = 'card-attribute mb-3';
        newCard.innerHTML = `
            <div class="row mb-2">
                <div class="col-12 text-end">
                    <a href="#" class="btn btn-link text-danger delete-attribute"></a>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Nombre del atributo <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" name="attributes[${attributeIndex}][nombre]" placeholder="Nombre" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Descripción <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" name="attributes[${attributeIndex}][descripcion]" placeholder="Descripción" required>
                </div>
            </div>`;

        attributesContainer.appendChild(newCard);
        attributeIndex++;

        newCard.querySelector('.delete-attribute').addEventListener('click', function (e) {
            e.preventDefault();
            newCard.remove();
        });
    });

    document.querySelectorAll('.delete-attribute').forEach(button => {
        button.addEventListener('click', function (e) {
            e.preventDefault();
            this.closest('.card-attribute').remove();
        });
    });
});