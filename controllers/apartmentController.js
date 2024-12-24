const db = require('../config/db');

exports.getAllApartments = (req, res) => {
  db.query('SELECT * FROM apartments', (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).send('Ошибка базы данных');
    }
    res.render('apartments', { apartments: results.rows, userId: req.cookies.userId });
  });
};

exports.getApartmentDetail = (req, res) => {
  const apartmentId = req.params.id;
  db.query('SELECT * FROM apartments WHERE apartments_id = $1', [apartmentId], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send('Ошибка базы данных');
    }
    if (result.length === 0) {
      return res.status(404).send('Апартамент не найден');
    }
    res.render('apartmentDetail', { apartment: result.rows[0], userId: req.cookies.userId });
  });
};
