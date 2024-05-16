// Lista de mensajes a mostrar
var messages = [
    "¡Vive sin preocupaciones! Compra tu boleto y gana $34,000,000 o $188,888 mensuales durante 15 años.",     
    "Más efectivo, más especial 🍀 por solo $150 podrías ganar hasta $780,000", 
    "Prueba tu suerte 🍀 por solo $75 podrías ganar hasta $100,000"
];

var currentIndex = 0; // Índice del mensaje actual

// Función para cambiar el mensaje
function changeMessage() {
    // Actualiza el contenido del div con el mensaje actual
    document.getElementById("messageContainer").innerHTML = messages[currentIndex];

    // Incrementa el índice para el siguiente mensaje
    currentIndex = (currentIndex + 1) % messages.length;
}

// Cambia el mensaje cada 3 segundos
setInterval(changeMessage, 3000);
