document.addEventListener('DOMContentLoaded', function () {
    const envioGratisCheckbox = document.getElementById('envioGratis');
    const costoEnvioInput = document.getElementById('costoEnvio');

    if (envioGratisCheckbox && costoEnvioInput) {
        envioGratisCheckbox.addEventListener('change', function () {
            if (this.checked) {
                costoEnvioInput.disabled = true;
                costoEnvioInput.value = ''; // Opcional: limpiar el valor
            } else {
                costoEnvioInput.disabled = false;
            }
        });

        costoEnvioInput.addEventListener('input', function () {
            if (this.value.trim() !== '') {
                envioGratisCheckbox.checked = false;
                costoEnvioInput.disabled = false; // Asegurarse de que no esté deshabilitado
            }
        });

        // Estado inicial al cargar la página
        if (envioGratisCheckbox.checked) {
            costoEnvioInput.disabled = true;
        }
    }
});