var ConduceyGana = [
    1000, 2500, 1200, 1800, 2900, 1700,
    2200, 1900, 2300, 2600, 3200, 1800,
    2500, 2800, 2100, 3000, 3100, 2000,
    2600, 2900, 2400, 3200, 3300, 2100,
    2700, 3100, 2500, 3300, 3400, 2200
];

var BorregoValiente = [
    800, 1200, 1000, 1500, 1700, 1600,
    900, 1100, 1300, 1400, 1600, 1500,
    850, 1250, 1100, 1600, 1800, 1700,
    950, 1150, 1350, 1450, 1650, 1550,
    950, 1300, 1200, 1550, 1750, 1650
];

var Plinko = [
    1200, 1300, 1200, 1300, 1300, 1100,
    1250, 1350, 1150, 1400, 1350, 1200,
    1300, 1400, 1250, 1450, 1400, 1150,
    1350, 1450, 1300, 1500, 1450, 1200,
    1400, 1500, 1350, 1550, 1500, 1250
];


// Calcula los ingresos totales sumando los datos de los otros tres conjuntos
var ingresosTotales = ConduceyGana.map((value, index) => value + BorregoValiente[index] + Plinko[index]);

// Crea el objeto de datos con los datos actualizados
var datos = {
    labels: ['L', 'M', 'M', 'J', 'V', 'S', 'D'].concat(Array.from({ length: 3 }, () => ['L', 'M', 'M', 'J', 'V', 'S', 'D']).flat()),
    datasets: [{
        label: 'Conduce y Gana',
        data: ConduceyGana,
        backgroundColor: 'rgba(255, 99, 132, 0.2)', // Color de fondo
        borderColor: 'rgba(255, 99, 132, 1)', // Color de la línea
        borderWidth: 4,
        fill: false, // Indica que no queremos rellenar el área bajo la línea
        tension: 0.3 // Configura la tensión para suavizar las curvas
    },
    {
        label: 'Borrego Valiente',
        data: BorregoValiente,
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 4,
        fill: false,
        tension: 0.3 // Configura la tensión para suavizar las curvas
    },
    {
        label: 'Plinko',
        data: Plinko,
        backgroundColor: 'rgba(255, 206, 86, 0.2)',
        borderColor: 'rgba(255, 206, 86, 1)',
        borderWidth: 4,
        fill: false,
        tension: 0.3 // Configura la tensión para suavizar las curvas
    },
    {
        label: 'Ingresos Totales',
        data: ingresosTotales,
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
        borderColor: 'rgba(75, 192, 192, 1)',
        borderWidth: 4,
        fill: true,
        tension: 0.3 // Configura la tensión para suavizar las curvas
    }]
};

// Opciones de la gráfica
var opciones = {
    scales: {
        x: {
            grid: {
                display: false // Oculta las líneas verticales de fondo
            }
        },
        y: {
            ticks: {
                beginAtZero: true
            }
        }
    }
};


// Dibuja la gráfica en el elemento con id "grafica-ingresos"
var ctx = document.getElementById('grafica-ingresos').getContext('2d');
var grafica = new Chart(ctx, {
    type: 'line', // Tipo de gráfica (barra)
    data: datos,
    options: opciones
});
