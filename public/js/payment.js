document.addEventListener('DOMContentLoaded', function () {
    const radios = document.querySelectorAll('input[type="radio"][name="flexRadioDefault"]');
    const cancelButton = document.querySelector('.btn-link');
    const saveButton = document.querySelector('.btn-primary');

    radios.forEach(radio => {
        radio.addEventListener('change', function () {
            if (this.checked) {
                showContent(this.id.replace('flexRadioDefault', 'content'));
            }
        });
    });

    function showContent(contentId) {
        //ocultar todos los contenidos
        document.querySelectorAll('.content').forEach(function (content) {
            content.style.display = 'none';
        });
        //mostrar el contenido seleccionado
        document.getElementById(contentId).style.display = 'block';
    }

    cancelButton.addEventListener('click', function () {
        //restablecer todos los campos del formulario
        document.querySelector('form').reset();
        //ocultar todas las secciones de contenido
        document.querySelectorAll('.content').forEach(function (content) {
            content.style.display = 'none';
        });
        alert('Cambios cancelados. El formulario se ha restablecido.');
    });
    
});
