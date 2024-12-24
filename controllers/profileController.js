const db = require('../config/db');

exports.getProfile = (req, res) => {
  const userId = req.cookies.userId;
  db.query('SELECT * FROM "user" WHERE user_id = $1', [userId], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).send('Ошибка базы данных');
    }
    res.render('profile', { user: result.rows[0], userId: req.cookies.userId });
  });
};
