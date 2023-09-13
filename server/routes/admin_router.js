const express = require('express');
const mongoose = require('mongoose');
const adminRouter = express.Router();
const Product = require('../models/product');
const userModel = require('../models/user');

// admin
adminRouter.delete('/api/admin/delete/product', async (req, res) => {
    const productId = req.body._id;
    const type = req.body.type;
    if (type == null || productId == null)
        return res.status(400).json({ msg: 'invalid attempt!!!' });
    if (type != 'admin')
        return res.status(400).json({ msg: "you are not admin!!?" });
    const result=await Product.findOneAndDelete({
        _id:productId
    });
    if (result == null)
        return res.status(400).json({ msg: 'product not found' });

    return res.status(200).json({ msg: 'product deleted successfully!!' });
    
});
adminRouter.delete('/api/admin/delete/user', async (req, res) => {
    const email = req.body.email;
    const userType = req.body.type;
    if (email == null)
        return res.status(404).json({ msg: 'invalid request!!?' });
     if (userType != 'admin')
        return res.status(400).json({ msg: "you are not admin!!?" });
    const user = await userModel.findOne({
        email
    });
    if (user == null)
        return res.status(404).json({ msg: 'user not found!!?' });
    const deletingUserType = user.type;
    if (deletingUserType =='admin')
        return res.status(400).json({ msg: 'you cannot delete admin!!? ' });
    const result=await userModel.findOneAndDelete({
        email
    });
    if (result == null)
        return res.status(400).json({ msg: 'user not found' });
    return res.status(200).json({ msg: 'user deleted successfully!!' });
});
adminRouter.post('/api/admin/add-product', async (req, res) => {
    const { name, url, productType, price } = req.body;
    const result = await Product.findOne({
        url
    });
    if (result != null)
        return res.status(400).json({ msg: 'It already registered ' });
    var newProduct = new Product({
        name,url,productType,price
    });
    newProduct = await newProduct.save();
    return res.json({
        msg: 'product addedd successfully!!',newProduct
    });
});

userRouter.post('/api/admin/update/password', async (req, res) => {
    try {
        const user = await User.findOneAndUpdate(
            {
                email: { $regex: req.body.email, $options: "i" },
                password:req.body.password,
            },
        {password: req.body.password }
    );
    if (user == null)
        return res.status(400).json({ msg: "user not found with this email!!" });
    return res.json({ msg: 'password updated successfully!!!' ,user});
    } catch (e)
    {
        return res.status(500).json({ msg: 'something went wrong!!' });
    }
});
module.exports = adminRouter;
