const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const path = require('path');

const app = express();
const port = 3000;

app.use(cors());

// Configuración de conexión MySQL
const conexion = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'isak' // Reemplaza esto
});

conexion.connect(err => {
  if (err) {
    console.error('Error de conexión a MySQL:', err);
    return;
  }
  console.log('Conexión a MySQL exitosa');
});

// Ruta para obtener datos
// Ruta para obtener datos con filtrado
app.get('/api/datos', (req, res) => {
  const { nombre, descripcion } = req.query;
  let sql = 'SELECT * FROM Item';
  let params = [];
  if (nombre || descripcion) {
    sql += ' WHERE 1=1';
    if (nombre) {
      sql += ' AND item_Name LIKE ?';
      params.push(`%${nombre}%`);
    }
    if (descripcion) {
      sql += ' AND descriptionShown LIKE ?';
      params.push(`%${descripcion}%`);
    }
  }
  conexion.query(sql, params, (err, resultados) => {
    if (err) {
      console.error(err);
      res.status(500).send('Error al consultar la base de datos');
      return;
    }
    res.json(resultados);
  });
});

// Ruta para servir el index.html
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '..', 'frontend', 'index.html'));
});

app.listen(port, () => {
  console.log(`Servidor Express en http://localhost:${port}`);
});
