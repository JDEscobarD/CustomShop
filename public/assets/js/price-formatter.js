class PriceFormatter {
    constructor(inputElement) {
        this.input = inputElement;
        this.formatPrice = this.formatPrice.bind(this);
        this.input.addEventListener('input', this.formatPrice);
        this.formatPrice(); // Formatear al inicializar
    }

    formatPrice() {
        let value = this.input.value.replace(/[^\d]/g, '');
        if (value) {
            const number = parseInt(value, 10);
            const formatted = new Intl.NumberFormat('es-CO', {
                style: 'currency',
                currency: 'COP',
                minimumFractionDigits: 0,
                maximumFractionDigits: 0
            }).format(number);
            this.input.value = formatted;
        } else {
            this.input.value = ''; // Limpiar si no hay valor
        }
    }
}

document.addEventListener('DOMContentLoaded', function () {
    const priceInputs = document.querySelectorAll('.price-input');
    priceInputs.forEach(input => {
        new PriceFormatter(input);
    });
});