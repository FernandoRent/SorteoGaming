(function() {
// -------------------------------------------------------------------------------------------------------------------------
// SHOW ADDITIONAL DATA
// -------------------------------------------------------------------------------------------------------------------------
var tiempoSesion = 27.3 + ' Mins';
var tasaRetencion = 67.88 + '%';
// Actualiza el contenido valor de la variable
document.getElementById("tiempoSesion").innerHTML = tiempoSesion;
document.getElementById("tasaRetencion").innerHTML = tasaRetencion;

// -------------------------------------------------------------------------------------------------------------------------
// DATA FOR EACH GAME 
// -------------------------------------------------------------------------------------------------------------------------

var ConduceyGana = [
    2200, 3200, 2400, 1800, 3900, 2700,
    3300, 2900, 3700, 4800, 3600, 2200,
    2500, 2800, 3100, 2900, 4500, 2600,
    3700, 4100, 4400, 3800, 4900, 3900,
    4000, 4200, 3500, 3300, 4200, 4600
];

var BorregoValiente = [
    800, 1600, 1200, 2000, 3000, 1800,
    2000, 2300, 2700, 3100, 2500, 2400,
    2000, 2200, 2700, 2400, 2800, 2200,
    2500, 2300, 2000, 2200, 3100, 2600,
    2200, 2400, 2800, 2900, 3200, 3300
];

var Plinko = [
    1200, 2100, 1500, 1800, 2300, 1900,
    2100, 2200, 2000, 2400, 2100, 2500,
    2200, 2300, 2400, 2600, 2300, 2500,
    2700, 2500, 2300, 2700, 2400, 2800,
    2600, 2800, 2900, 2800, 3000, 3100
];

// Calcula los ingresos totales sumando los datos de los otros tres conjuntos
var usuariosTotales = ConduceyGana.map((value, index) => value + BorregoValiente[index] + Plinko[index]);

// -------------------------------------------------------------------------------------------------------------------------
// CREATE A GRAPH WITH THE DATA 
// -------------------------------------------------------------------------------------------------------------------------

// Obtener fechas de los últimos 30 días con formato MM-DD
var fechas = [];
var hoy = new Date();
for (var i = 0; i < 30; i++) {
    var fecha = new Date(hoy);
    fecha.setDate(hoy.getDate() - i);
    var mes = fecha.getMonth() + 1; // Se agrega 1 porque los meses comienzan desde 0
    var dia = fecha.getDate();
    var fechaFormateada = (mes < 10 ? '0' : '') + mes + '-' + (dia < 10 ? '0' : '') + dia;
    fechas.unshift(fechaFormateada); // Inserta la fecha formateada al principio del arreglo
}

// Crea el objeto de datos con los datos actualizados
var datos = {
    labels: fechas,
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
        label: 'Usuarios Activos Totales',
        data: usuariosTotales,
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
    },
    plugins: {
        title: {
            display: true,
            text: 'Usuarios Activos en los últimos 30 días',
            font: {
                size: 25 // Tamaño de la fuente del título
            }
        }
    }
};


// Dibuja la gráfica en el elemento con id "grafica-ingresos"
var ctx = document.getElementById('grafica-usuarios').getContext('2d');
var grafica = new Chart(ctx, {
    type: 'line', // Tipo de gráfica (barra)
    data: datos,
    options: opciones
});

// -------------------------------------------------------------------------------------------------------------------------
// EXPORT EXCEL FILE FOR 'Rendimientos'
// -------------------------------------------------------------------------------------------------------------------------

// Obtener fechas de los últimos 30 días en orden ascendente
fechas = [];
var hoy = new Date();
for (var i = 0; i < 30; i++) {
    var fecha = new Date(hoy);
    fecha.setDate(hoy.getDate() - i);
    fechas.unshift(fecha.toISOString().split('T')[0]); // Insertar la fecha al principio del arreglo
}


// Datos
var data = [
    ['Tiempo Sesion promedio', tiempoSesion, '','Tasa Retencion Usuario', tasaRetencion],
    [''],
    ['Fecha', 'Usuarios Activos Conduce y Gana', 'Usuarios Activos Borrego Valiente', 'Usuarios Activos Plinko', 'Usuarios Activos Totales']
];

// Añadir datos de cada juego para cada fecha
for (var i = 0; i < 30; i++) {
    var fecha = fechas[i];
    var fila = [fecha];
    fila.push(ConduceyGana[i], BorregoValiente[i], Plinko[i], usuariosTotales[i]);
    data.push(fila);
}

// Función para exportar a Excel
function exportarExcelEngagement() {
    // Crea un nuevo libro de trabajo
    var workbook = XLSX.utils.book_new();
    // Convierte los datos a una hoja de cálculo
    var worksheet = XLSX.utils.aoa_to_sheet(data);
    // Agrega la hoja de cálculo al libro de trabajo
    XLSX.utils.book_append_sheet(workbook, worksheet, "Datos");

    // Convierte el libro de trabajo a un archivo binario
    var archivoBinario = XLSX.write(workbook, { bookType: 'xlsx', type: 'binary' });
    // Crea un blob a partir del archivo binario
    var blob = new Blob([s2ab(archivoBinario)], { type: "application/octet-stream" });
    // Genera una URL para el blob
    var url = window.URL.createObjectURL(blob);
    // Crea un enlace para descargar el archivo
    var a = document.createElement("a");
    a.href = url;
    a.download = "Reporte_Engagement.xlsx";
    // Simula un clic en el enlace para iniciar la descarga
    a.click();
}

// Función para convertir un array buffer a un array binario
function s2ab(s) {
    var buf = new ArrayBuffer(s.length);
    var view = new Uint8Array(buf);
    for (var i = 0; i != s.length; ++i) view[i] = s.charCodeAt(i) & 0xFF;
    return buf;
}

var exportEngagement = document.getElementById('downloadEngagement')
exportEngagement.addEventListener('click', exportarExcelEngagement);

// -------------------------------------------------------------------------------------------------------------------------
// SHOW DIFFERENT LINES ON THE GRAPH FOR EACH CHECKBOX
// -------------------------------------------------------------------------------------------------------------------------

// Obtener las casillas de verificación
var TotalCheckbox = document.getElementById('engagementTotalCheckbox');
var ConduceyGanaCheckbox = document.getElementById('engagementConduceyGanaCheckbox');
var BorregoValienteCheckbox = document.getElementById('engagementBorregoValienteCheckbox');
var PlinkoCheckbox = document.getElementById('engagementPlinkoCheckbox');

// Función para actualizar la gráfica según las selecciones del usuario
function actualizarGrafica() {
    // Actualizar datos según las selecciones de las casillas de verificación
    var datasets = [];
    if (ConduceyGanaCheckbox.checked) {
        datasets.push({
            label: 'Conduce y Gana',
            data: ConduceyGana,
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderColor: 'rgba(255, 99, 132, 1)',
            borderWidth: 4,
            fill: false,
            tension: 0.3
        });
    }
    if (BorregoValienteCheckbox.checked) {
        datasets.push({
            label: 'Borrego Valiente',
            data: BorregoValiente,
            backgroundColor: 'rgba(54, 162, 235, 0.2)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 4,
            fill: false,
            tension: 0.3
        });
    }
    if (PlinkoCheckbox.checked) {
        datasets.push({
            label: 'Plinko',
            data: Plinko,
            backgroundColor: 'rgba(255, 206, 86, 0.2)',
            borderColor: 'rgba(255, 206, 86, 1)',
            borderWidth: 4,
            fill: false,
            tension: 0.3
        });
    }

    if (TotalCheckbox.checked) {
        datasets.push({
            label: 'Usuarios Activos Totales',
            data: usuariosTotales,
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 4,
            fill: true,
            tension: 0.3 // Configura la tensión para suavizar las curvas
        });
    }

    // Actualizar los datos de la gráfica
    grafica.data.datasets = datasets;
    grafica.update();
}

// Agregar eventos de cambio a las casillas de verificación
ConduceyGanaCheckbox.addEventListener('change', actualizarGrafica);
BorregoValienteCheckbox.addEventListener('change', actualizarGrafica);
PlinkoCheckbox.addEventListener('change', actualizarGrafica);
TotalCheckbox.addEventListener('change', actualizarGrafica);
})();