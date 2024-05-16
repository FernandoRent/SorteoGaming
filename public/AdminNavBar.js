// Función para mostrar el contenedor deseado y ocultar los demás
function mostrarContenedor(id) {
    // Ocultar el titulo de bienvenido
    document.getElementById('Bienvenido').style.display = 'none';
    // Ocultar todos los contenedores
    document.getElementById('contenedor1').style.display = 'none';
    document.getElementById('contenedor2').style.display = 'none';
    document.getElementById('contenedor3').style.display = 'none';
    document.getElementById('contenedor4').style.display = 'none';
    // Mostrar el contenedor deseado
    document.getElementById(id).style.display = 'block';
    
    // Quitar la clase 'selected' de todos los enlaces
    var enlaces = document.getElementsByTagName('a');
    for (var i = 0; i < enlaces.length; i++) {
        enlaces[i].classList.remove('selected');
    }
    // Agregar la clase 'selected' al enlace seleccionado
    document.getElementById('opcion' + id.substr(-1)).classList.add('selected');
}
