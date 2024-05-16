const express = require('express');
const mysql = require('mysql');
const path = require('path');

const app = express();
const PORT = 8000;
const cors = require('cors');

// Configuring MySQL connection
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'xxxxxxxxX1€',
  database: 'reto'
});

// Connect to the MySQL database
connection.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }
  console.log('Connected to the database.');
});

app.use(cors());
// Serve the HTML file
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

// Endpoint to handle custom action (inserting data into the database)
app.get('/custom-action', (req, res) => {
  // Sample data to insert
  const sampleUserData = {
    user_password: 'samplepassword',
    nombre_usuario: 'samplgggeuser',
    user_email: 'sampggle@example.com',
    nombre: 'John',
    apellido_paterno: 'Doe',
    apellido_materno: 'Smith',
    telefono_movil: '1234567890',
    fecha_de_registro: '2022-04-05',
    ultima_conexion: '2022-04-05',
    fecha_nacimiento: '1990-01-01',
    ciudad: 'Sample City',
    estado: 'Sample State',
    pais: 'Sample Country',
    rol: 'user'
  };

  // Insert sample data into the database
  connection.query('INSERT INTO usuario SET ?', sampleUserData, (error, results, fields) => {
    if (error) {
      console.error('Error inserting data into the database:', error);
      res.status(500).send('Error inserting data into the database');
      return;
    }
    console.log('Data inserted into the database successfully');
    res.send('Data inserted into the database successfully');
  });
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
