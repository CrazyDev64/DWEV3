let datosGlobal = [];
async function cargarDatos() {
	try {
		const res = await fetch('/api/datos');
		datosGlobal = await res.json();
		mostrarDatos(datosGlobal);
	} catch (error) {
		console.error('Error al cargar los datos:', error);
	}
}

function mostrarDatos(datos) {
	const contenedor = document.getElementById('cardsContainer');
	contenedor.innerHTML = '';
	datos.forEach(item => {
		const card = document.createElement('div');
		card.className = 'card col-md-4 mb-3';
		const imgUrl = `https://picsum.photos/200?random=${item.item_ID}`;
		card.innerHTML = `
			<img src="${imgUrl}" alt="${item.item_Name}" class="card-img-top p-2" style="max-height:120px;object-fit:contain;">
			<div class="card-body">
				<h5 class="card-title">${item.item_Name}</h5>
				<h6 class="card-subtitle mb-2 text-muted">ID: ${item.item_ID}</h6>
				<p class="card-text">${item.descriptionShown}</p>
			</div>
		`;
		contenedor.appendChild(card);
	});
}

document.addEventListener('DOMContentLoaded', () => {
	cargarDatos();
	const filtro = document.getElementById('filtroNombre');
	filtro.addEventListener('input', e => {
		const valor = e.target.value.toLowerCase();
		const filtrados = datosGlobal.filter(item => item.item_Name.toLowerCase().includes(valor));
		mostrarDatos(filtrados);
	});
});
