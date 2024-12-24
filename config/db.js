const { Client } = require('pg');

const client = new Client({
  host: 'localhost',
  user: 'postgres',
  password: 'root', 
  database: 'hotel',
  port: 5432,
});

client.connect((err) => {
  if (err) {
    console.error('Ошибка подключения к базе данных PostgreSQL:', err.stack);
  } else {
    console.log('Подключено к PostgreSQL базе данных.');
  }
});

module.exports = client;
