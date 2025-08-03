document.addEventListener('DOMContentLoaded', function () {
    let compositionIndex = 0;

    function initializeCompositionBlock(block) {
        const categorySelect = block.querySelector('.composition-category');
        const productSelect = block.querySelector('.composition-product');

        categorySelect.addEventListener('change', function () {
            const categoryId = this.value;
            productSelect.innerHTML = '<option value="">Cargando...</option>';

            if (!categoryId) {
                productSelect.innerHTML = '<option value="">Seleccione una categoría primero...</option>';
                return;
            }

            fetch(`/api/categories/${categoryId}/products`)
                .then(response => response.json())
                .then(data => {
                    productSelect.innerHTML = '<option value="">Seleccione un artículo...</option>';
                    data.forEach(product => {
                        const option = document.createElement('option');
                        option.value = product.id;
                        option.textContent = product.nombre;
                        productSelect.appendChild(option);
                    });
                })
                .catch(error => {
                    console.error('Error fetching products:', error);
                    productSelect.innerHTML = '<option value="">Error al cargar productos</option>';
                });
        });
    }

    function addCompositionField(container, compositionIndex) {
        const newFieldIndex = container.querySelectorAll('.composition-field').length;
        const originalField = container.querySelector('.composition-field');
        const clone = originalField.cloneNode(true);

        clone.querySelectorAll('input, select').forEach(field => {
            // Actualiza tanto el índice de la composición como el del campo para asegurar la unicidad.
            field.name = field.name.replace(/compositions\[\d+\]\[fields\]\[\d+\]/, `compositions[${compositionIndex}][fields][${newFieldIndex}]`);
            if (field.tagName === 'INPUT') {
                field.value = '';
            } else if (field.tagName === 'SELECT') {
                if (!field.classList.contains('composition-category')) {
                    field.innerHTML = '<option value="">Seleccione una categoría primero...</option>';
                }
                field.selectedIndex = 0;
            }
        });

        const removeButton = clone.querySelector('.remove-field');
        removeButton.style.display = 'block';
        removeButton.addEventListener('click', function() {
            clone.remove();
        });

        container.appendChild(clone);
        initializeCompositionBlock(clone);

        // Re-initialize price formatter for the new field
        if (typeof PriceFormatter !== 'undefined') {
            const newPriceInput = clone.querySelector('.price-input');
            new PriceFormatter(newPriceInput);
        }
    }

    document.getElementById('add-composition-item').addEventListener('click', function (e) {
        e.preventDefault();
        compositionIndex++;

        const original = document.querySelector('.composition-item');
        const clone = original.cloneNode(true);

        // Limpiar valores y actualizar nombres
        clone.querySelectorAll('input, select').forEach(field => {
            field.name = field.name.replace(/compositions\[\d+\]/, `compositions[${compositionIndex}]`);
            if (field.tagName === 'INPUT') {
                field.value = '';
            } else if (field.tagName === 'SELECT') {
                field.selectedIndex = 0;
            }
        });

        // Limpiar campos de producto clonados y reiniciar el primero
        const fieldsContainer = clone.querySelector('.composition-fields-container');
        while (fieldsContainer.children.length > 1) {
            fieldsContainer.removeChild(fieldsContainer.lastChild);
        }
        const firstField = fieldsContainer.querySelector('.composition-field');
        firstField.querySelectorAll('input, select').forEach(field => {
             if (field.tagName === 'INPUT') {
                field.value = '';
            } else if (field.tagName === 'SELECT') {
                if (!field.classList.contains('composition-category')) {
                    field.innerHTML = '<option value="">Seleccione una categoría primero...</option>';
                }
                field.selectedIndex = 0;
            }
        });

        
        // Añadir botón de eliminar
        const removeButton = document.createElement('button');
        removeButton.textContent = 'Eliminar Campo';
        removeButton.classList.add('btn', 'btn-danger', 'mt-2', 'remove-composition-item');
        removeButton.addEventListener('click', function() {
            clone.remove();
        });

        clone.querySelector('.card-component-body').appendChild(removeButton);

        document.getElementById('compositions-container').appendChild(clone);
        initializeCompositionBlock(clone.querySelector('.composition-field'));

        clone.querySelector('.add-composition-field').addEventListener('click', function(e) {
            e.preventDefault();
            addCompositionField(clone.querySelector('.composition-fields-container'), compositionIndex);
        });
    });

    document.querySelectorAll('.add-composition-field').forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault();
            const container = this.closest('.composition-item').querySelector('.composition-fields-container');
            const currentCompositionIndex = parseInt(this.closest('.composition-item').querySelector('[name*="compositions"]').name.match(/compositions\[(\d+)\]/)[1]);
            addCompositionField(container, currentCompositionIndex);
        });
    });

    // Inicializar el primer bloque
    document.querySelectorAll('.composition-item').forEach(item => {
        initializeCompositionBlock(item);
    });

    // Inicializar el primer bloque
    initializeCompositionBlock(document.querySelector('.composition-item'));
});