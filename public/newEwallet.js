document.addEventListener('DOMContentLoaded', () => {
    const saldoContainer = document.getElementById('EwalletSaldo');
    const livesContainer = document.getElementById('EwalletLives');
    const nombreContainer = document.getElementById('nombreUsuario');
    const tarjetasDropdown = document.getElementById('tarjetasDropdown');
    const tarjetasDropdown2 = document.getElementById('tarjetasDropdown2');
    const btnConfirmarBorrado = document.getElementById('btnConfirmarBorrado');
    const formVidas = document.querySelector('.comprarVid');

    function updatewallet(){
        fetch('http://localhost:3000/walletransactions')
        .catch(error => console.error('Error fetching data:', error));
    }

    async function getSaldo() {
        try {
            const response = await fetch('http://localhost:3000/saldo');
            if (!response.ok) {
                throw new Error('Failed to fetch saldo data');
            }
            const data = await response.json();
            console.log(data.saldo); // Optional: for debugging
            return data.saldo; // This will return the saldo value to where getSaldo() is called
        } catch (error) {
            console.error('Error fetching saldo data:', error);
            return null; // You might want to handle errors differently
        }
    }
    

    function fetchDatos(){
        return fetch('walletransaction.json')
        .then(response => {
            if (!response.ok) {
               throw new Error('Failed to fetch saldo data');
            }
            return response.json();
        })
        .catch(error => {
            console.log('error fetching transactions:', error);
        });
    }

    function displayName(){

        fetch('login_response.json')
        .then(response => {
          if (!response.ok) {
            throw new Error('Failed to fetch login data');
          }
          return response.json();
        })
        .then(data => {
            const userNombre = data.userName;
            nombreContainer.innerHTML = `Hola, ${userNombre}`;
        })
        .catch(error => {
            console.error('Error fetching login data:', error);
            nombreContainer.innerHTML = `<p>Error fetching login data</p>`;
            });
    }
    function displayhistorial(data){
        const historialMovimientos = data.combinedResults.transaccion.slice(-10);
        const listaMovimientos = document.getElementById('containerHistorialMovimientos');
        historialMovimientos.forEach(movimiento => {
             const p = document.createElement('p');
             const fecha = movimiento.fecha_transaccion.slice(0, 10);
             const monto = movimiento.importe;
             const tipo = movimiento.tipo_transaccion;
             p.textContent = `• ${fecha} • ${monto} • ${tipo}`;
             listaMovimientos.appendChild(p);
        });
    }
    
    function displayTarjetas(data){
        const tarjetasRegistradas = data.combinedResults.tarjetasPago;
         const listaTarjetas = document.getElementById('containerTarjetasRegistradas');
         tarjetasRegistradas.forEach(tarjeta => {
             const p = document.createElement('p');
             const lastFourDigits = tarjeta.numero_tarjeta.slice(-4);
             const expiryDate = tarjeta.fecha_expiracion;
             p.textContent = `• ${lastFourDigits} • ${expiryDate}`;
             listaTarjetas.appendChild(p);
         })
    }
    
    function updateSaldo(){
        fetch('http://localhost:3000/saldo')
            .then(response => {
                    if (!response.ok) {
                        throw new Error('Failed to fetch saldo data');
                    }
                    return response.json();
                })
                .then(data => {
                    const walletSaldo = data.saldo;
                    saldoContainer.innerHTML = `$${walletSaldo}`;
                })
                .catch(error => {
                    console.error('Error fetching saldo data:', error);
                    saldoContainer.innerHTML = `<p>Error fetching saldo data</p>`;
                });
    }

    function updateVidas(){
        fetch('http://localhost:3000/vidas')
        .then(response=> { 
            if (!response.ok){
                throw new Error('Failed to fetch saldo data')
            }
            return response.json();
        })
        .then(data =>{
            const userVidas = data.vidas;
            livesContainer.innerHTML = `${userVidas}`;
        })
        .catch(error =>{
            console.error('error fecthing vidas:',error);
            livesContainer.innerHTML='<p>Error fetching vidas<p>'
        });
    
    }

    function fillTarjetasDropdown(data) {

        const tarjetasRegistradas = data.combinedResults.tarjetasPago;

        tarjetasRegistradas.forEach(tarjeta => {

        const option1 = document.createElement('option');
        const lastFourDigits = tarjeta.numero_tarjeta.slice(-4);
        const expiryDate = tarjeta.fecha_expiracion;
        option1.value = tarjeta.tarjeta_id;
        option1.textContent = `• ${lastFourDigits} • ${expiryDate}`;
        tarjetasDropdown.appendChild(option1);

        const option2 = document.createElement('option');
        option2.value = tarjeta.tarjeta_id;
        option2.textContent = `• ${lastFourDigits} • ${expiryDate}`;
        tarjetasDropdown2.appendChild(option2);
        });
    }
    
    function borrartarjeta(tarjetaId){
        fetch('http://localhost:3000/borrartarjeta', {
                method: 'POST',
                body: JSON.stringify({ idTarjeta: tarjetaId }),

                headers: {
                    'Content-Type': 'application/json'
                },
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Failed to delete tarjeta');
                }
            })
            .then(() => {
                alert('Tarjeta borrada exitosamente');
            })
            .catch(error => {
                console.error('Error deleting tarjeta:', error);
            });
    }

    function procesoCompraVidas(vidasA) {
        return fetch('http://localhost:3000/anadirVidas', {
            method: 'POST',
            body: JSON.stringify({ vidasAmount: vidasA }),
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Failed to purchase lives');
            }
        })
        .catch(error => {
            console.error('Error purchasing lives:', error);
        });
    }
    
   
    fetchDatos().then(walletInfo => {
        console.log(walletInfo);
        fillTarjetasDropdown(walletInfo);
        displayhistorial(walletInfo);
        displayTarjetas(walletInfo);
    });
    
    displayName();

    updateSaldo();

    updateVidas();

    updatewallet()

    btnConfirmarBorrado.addEventListener('click', () => {
        const selected = document.querySelector('#tarjetasDropdown2');
        const tarjetaId = selected.value; // Get the value of the selected option
        console.log(tarjetaId);
    
        if (!tarjetaId) {
            alert('Please select a tarjeta to delete.');
            return;
        }

        borrartarjeta(tarjetaId)
    });

   
    formVidas.addEventListener('submit', async function (e) {
    e.preventDefault();
    const vidasAmount = parseInt(document.querySelector('[name="vidasAmount"]').value);
    const userBalance = await getSaldo(); // Wait for the saldo to be fetched

    if (userBalance === null) {
        alert('No se pudo obtener Balance del usuario. Por favor, intente nuevamente.');
        return; 
    }
    console.log(vidasAmount);
    if (vidasAmount <= 0 || isNaN(vidasAmount) || vidasAmount === null) {
        alert('Por favor, ingrese un número válido de vidas a comprar.');
        return;
    }

    if ((vidasAmount * 10) > userBalance) {
        alert('No hay saldo suficiente para comprar' + vidasAmount + ' vidas. Por favor, recargue su saldo.');
    } else {
        await procesoCompraVidas(vidasAmount);
        alert('Disfruta tus nuevas vidas!');
        location.reload();
        
    }
});


});

function togglePopup() {
    var popup = document.getElementById("popup-form");
     // Toggle the 'active' class
    popup.style.display = (popup.style.display === "none") ? "block" : "none";
    document.body.style.overflow = (popup.style.display === "block") ? "hidden" : "auto";
}

function togglePopup2() {
    var popup = document.getElementById("popup-form2");
     // Toggle the 'active' class
    popup.style.display = (popup.style.display === "none") ? "block" : "none";
    document.body.style.overflow = (popup.style.display === "block") ? "hidden" : "auto";
}

function togglePopup3() {
    var popup = document.getElementById("popup-form3");
     // Toggle the 'active' class
    popup.style.display = (popup.style.display === "none") ? "block" : "none";
    document.body.style.overflow = (popup.style.display === "block") ? "hidden" : "auto";
}
