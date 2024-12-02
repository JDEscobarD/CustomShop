document.addEventListener("DOMContentLoaded", function () {
    const tabs = document.querySelectorAll(".nav-link");
    const tabContents = document.querySelectorAll(".tabcontent");

    tabs.forEach(tab => {
        tab.addEventListener("click", function (event) {
            event.preventDefault();

            // Eliminar la clase 'active' de todas las pestañas y ocultar todos los contenidos
            tabs.forEach(t => t.classList.remove("active"));
            tabContents.forEach(content => content.classList.add("d-none"));

            // Añadir la clase 'active' a la pestaña seleccionada
            tab.classList.add("active");

            // Mostrar el contenido correspondiente a la pestaña seleccionada
            const tabId = tab.getAttribute("data-tab");
            const activeContent = document.getElementById(tabId);
            activeContent.classList.remove("d-none");
        });
    });

    // Mostrar el contenido de la primera pestaña por defecto
    document.querySelector(".nav-link.active").click();
});
