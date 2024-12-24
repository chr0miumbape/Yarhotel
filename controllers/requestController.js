const db = require('../config/db');

exports.getRequests = (req, res) => {
  const query = `
    SELECT 
      "user".surname, 
      "user".name, 
      apartments.name AS apartmentName, 
      "order".status 
    FROM 
      "order"
    INNER JOIN apartments ON "order".apartments_id = apartments.apartments_id
    INNER JOIN "user" ON "order".user_id = "user".user_id
  `;

  db.query(query, (err, results) => {
    if (err) {
      console.error('Ошибка базы данных:', err);
      return res.status(500).send('Ошибка базы данных');
    }
    res.render('requests', { requests: results.rows, userId: req.cookies.userId });
  });
};

exports.createRequest = (req, res) => {
  const apartmentId = req.query.apartments_id;
  const query = `
    INSERT INTO "order" (apartments_id, user_id, status) 
    VALUES ($1, $2, $3)
  `;
  const values = [apartmentId, req.cookies.userId, 'Новый'];

  db.query(query, values, (err, result) => {
    if (err) {
      console.error('Ошибка базы данных:', err);
      return res.status(500).send('Ошибка базы данных');
    }
    res.redirect('/requests');
  });
};
