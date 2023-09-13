const express = require("express");
const userRouter = express.Router();
const User = require('../models/user');

userRouter.post('/api/user/update/password', async (req, res) => {

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
userRouter.post('/api/user/update/address', async (req, res) => {

    try {
        const user = await User.findOneAndUpdate(
            {
                email: { $regex: req.body.email, $options: "i" },
                password:req.body.password,  
            },
        {address: req.body.address }
    );
    if (user == null)
        return res.status(400).json({ msg: "incorrect email or password!!!" });
    return res.json({ msg: 'address updated successfully!!!' ,user}); 
    } catch (e)
    {
        return res.status(500).json({ msg: 'something went wrong!!' });
    }
});
userRouter.post('/api/user/add-cart', async (req, res) => {
    const  { email, productId, quantity } = req.body;
    const parsedQuantity = parseInt(quantity);
  try {
    const user = await User.findOne({ email });

    if (!user) {
      return res.status(400).json({ msg: 'User not found!!!' });
    }

    const cart = user.cart;
    const index = cart.findIndex(cartItem => cartItem.productId === productId);

    if (index === -1) {
      cart.push({
        productId,
        quantity:parsedQuantity,
      });
    } else {
      cart[index].quantity= parseInt(cart[index].quantity)+parsedQuantity;
    }

    user.cart = cart;
    await user.save();

    return res.json({ msg: 'Added to cart...' });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ msg: 'Internal Server Error' });
  }
});

userRouter.post('/api/user/cart',async(req, res) => {
    const { email } = req.body;
    const user = await User.findOne({email});
    if (user == null)
        return res.status(500).json({ msg: 'no user exists' });
    return res.json({ cart: user.cart });
});
module.exports = userRouter;