const cancelButton = document.querySelector('#clearFields');

cancelButton.addEventListener('click', function () {
    //restablecer todos los campos del formulario
    document.querySelector('form').reset();
    //ocultar todas las secciones de contenido
    document.querySelectorAll('.content').forEach(function (content) {
        content.style.display = 'none';
    });
    alert('Cambios cancelados. El formulario se ha restablecido.');
});