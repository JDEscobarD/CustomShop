document.getElementById('togglePassword').addEventListener('click', function () {    
    const passwordField = document.getElementById('passInput');
    const toggleText = document.getElementById('togglePassword');

    //Alternar entre el tipo 'password' y 'text' para el input
    if (passwordField.type === 'password') {
        passwordField.type = 'text';
        toggleText.textContent = 'Ocultar';  //Cambiar el texto a "Ocultar"
    } else {
        passwordField.type = 'password';
        toggleText.textContent = 'Mostrar';  //Cambiar el texto a "Mostrar"
    }
});