const express = require('express');
const router = express.Router();
const apartmentController = require('../controllers/apartmentController');
const authController = require('../controllers/authController');
const requestController = require('../controllers/requestController');
const profileController = require('../controllers/profileController');

router.post('/auth/register', authController.register);
router.post('/auth/login', authController.login);

router.get('/', (req, res) => {
  res.render('index', {
    userId: req.cookies.userId
  });
});

router.get('/apartments', (req, res) => {
  apartmentController.getAllApartments(req, res);
});

router.get('/apartments/:id', (req, res) => {
  apartmentController.getApartmentDetail(req, res);
});

router.get('/auth/login', (req, res) => {
  if (!req.cookies.userId) {
    res.render('login');
  } else {
    const returnUrl = req.get('Referer') || '/';
    res.redirect(returnUrl);
  }
});

router.get('/auth/register', (req, res) => {
  if (!req.cookies.userId) {
    res.render('register');
  } else {
    const returnUrl = req.get('Referer') || '/';
    res.redirect(returnUrl);
  }
});

router.get('/auth/logout', (req, res) => {
  authController.logout(req, res);
});

router.get('/profile', (req, res) => {
  if (req.cookies.userId) {
    profileController.getProfile(req, res);
  } else {
    res.redirect('/');
  }
});

router.get('/requests', (req, res) => {
  if (req.cookies.userId) {
    requestController.getRequests(req, res);
  } else {
    const returnUrl = req.get('Referer') || '/';
    res.redirect(returnUrl);
  }
});

router.get('/requests/create', (req, res) => {
  if (req.cookies.userId) {
    requestController.createRequest(req, res);
  } else {
    const returnUrl = req.get('Referer') || '/';
    res.redirect(returnUrl);
  }
});

module.exports = router;
