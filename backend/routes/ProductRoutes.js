const express = require('express');

const router = express.Router();
const ProductController = require('../controllers/ProductController');

router.get('/',ProductController.getProducts);
router.get('/searchName/:name',ProductController.searchProduct);
router.post('/',ProductController.createProduct);

module.exports = router;