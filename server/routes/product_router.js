
const express = require('express');
const mongoose = require('mongoose');
const productRouter = express.Router();
const Product = require('../models/product');



productRouter.get('/api/product/:name', async (req, res) => {
    const productId = req.body._id;
    const product = await Product.findOne({
        _id:productId
    });
    if (product == null)
        return res.status(400).json({ msg: 'product not found' });

    return res.status(200).json({product });
});


module.exports = productRouter;