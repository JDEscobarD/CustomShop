const btnCerrar = document.querySelector("#btnCerrar")
const card = document.querySelector("#welcome")


// esta función crea una cookie que vence en X días
function setCookie(nombre, valor, dias) {
    const fecha = new Date()
    fecha.setTime(fecha.getTime() + dias * 24 * 60 * 60 * 1000)
    const expires = "expires=" + fecha.toUTCString()
    document.cookie = `${nombre}=${valor}; ${expires}; path=/`
}


//esta función verifica si existe una cookie
function cookieExists(nombre) {
    const cookies = document.cookie.split("; ")
    return cookies.some(cookie => cookie.startsWith(`${nombre}=`))
}


btnCerrar.addEventListener('click', () => {
    if (!cookieExists("miCookie")) {
        setCookie("Cookie Bienvenida", 15)
        card.classList.add("hidden")
    }
})


document.addEventListener('DOMContentLoaded', () => {
    if (!cookieExists("miCookie")) {
        card.classList.remove("hidden")
    }
})