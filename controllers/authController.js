const db = require('../config/db');

exports.register = (req, res) => {
  const { surname, name, patronymic, telephone, email, login, password } = req.body;

  const query = `
    INSERT INTO "user" (surname, name, patronymic, telephone, email, login, password, role) 
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
  `;
  const values = [surname, name, patronymic, telephone, email, login, password, 'user'];

  db.query(query, values, (err, result) => {
    if (err) {
      console.error('Ошибка базы данных:', err);
      return res.status(500).send('Ошибка базы данных');
    }
    res.redirect('/auth/login');
  });
};

exports.login = (req, res) => {
  const { login, password } = req.body;

  const query = 'SELECT * FROM "user" WHERE login = $1';
  db.query(query, [login], (err, results) => {
    if (err) {
      console.error('Ошибка базы данных:', err);
      return res.status(500).send('Ошибка базы данных');
    }
    if (results.rows.length === 0) {
      return res.status(401).send('Неверный логин или пароль');
    }

    const user = results.rows[0];
    if (password === user.password) {
      res.cookie('userId', user.user_id, { httpOnly: true });
      res.redirect('/');
    } else {
      res.status(401).send('Неверный логин или пароль');
    }
  });
};

exports.logout = (req, res) => {
  res.clearCookie('userId');
  const returnUrl = req.get('Referer') || '/';
  res.redirect(returnUrl);
};
