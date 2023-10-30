
const express = require('express');
const mongoose = require('mongoose');
const productRouter = express.Router();
const sort = require('lodash');
const Product = require('../models/product');


//to get perticular product
productRouter.get('/api/product/:id', async (req, res) => {
    const productId = req.params.id;
    const product = await Product.findOne({
        _id:productId
    });
    if (product == null)
        return res.status(400).json({ msg: 'product not found' });

    return res.status(200).json({product });
});


//to find similiar products
productRouter.post("/api/product/similar-products", async (req, res) => {
    const productType = req.body.productType;
    const productList = [];

    if (productType != null) {
        const promises = productType.map(async (element) => {
        const products = await Product.find({ productType: { $in: [element] } });
        products.forEach((product) => {  productList.push(product); });
        });
        Promise.all(promises)
            .then(() => {
                // to get unique elements
                const products = sort.uniqWith(productList, sort.isEqual);
                return res.json({ products });
        })
        .catch((err) => {
            console.log('Error occurred:', err);
            return res.status(400).json({ msg: err });
        });
    }
    else
        return res.status(400).json({ msg: 'Error occurred! Something went wrong?' });
});
//get products on search
productRouter.get('/api/search/:query', async (req, res) => {
    
    const query = req.params.query;
    const words = query.split(' ');
    const List = [];
    const productList = [];
    for (const word of words) {
        List.push(word);
    }
    const promises = List.map(async (element) => {
        const products= await Product.find({
            $or: [
                { productType: { $in: [element] } },
                { name: element }
            ]
        })
        products.forEach((product) => {
           productList.push(product);
        });
    });
    Promise.all(promises).then(() => {
        const products = sort.uniqWith(productList, sort.isEqual);
            return res.json({ products });
    }).catch((err) => {
        console.log('Error occurred:', err);
        return res.json({ msg: 'Error occurred! Something went wrong?' });
    });

});

module.exports = productRouter;