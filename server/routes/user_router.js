const express = require("express");
const userRouter = express.Router();
const Order = require('../models/order');
const User = require('../models/user');
const { compareSync } = require("bcrypt");
const productModel = require("../models/product");

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

//to add to cart
userRouter.put('/api/user/add-cart', async (req, res) => {
    const { email, productId, quantity } = req.body;
    const parsedQuantity = parseInt(quantity);
    try {
        const user = await User.findOne({email:{$regex:email,$options:"i"}});
        console.log(productId);
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
//remove from the cart
userRouter.put('/api/user/remove-cart', async (req, res) => {
    const { email, productId, quantity } = req.body;
    const parsedQuantity = parseInt(quantity);
    if (email != null && productId != null && quantity != null) {
          try {
        const user = await User.findOne({email:{$regex:email,$options:"i"}});
        console.log(productId);
    if (!user) {
      return res.status(400).json({ msg: 'User not found!!!' });
    }
    let cart = user.cart;
    const index = cart.findIndex(cartItem => cartItem.productId === productId);

    if (index === -1) {
        return res.status(400).json({ msg: 'something went wrong' });
    } else {
        console.log(quantity);
        cart[index].quantity = parseInt(cart[index].quantity) - parsedQuantity;
        if (parseInt(cart[index].quantity) <= 0)
        {
            cart.splice(index, 1);
            user.cart = cart;
            await user.save();
            return res.json({ msg: 'deleted from the cart...' });
        }  
    }
    user.cart = cart;
    await user.save();
    return res.json({ msg: 'removed from the cart...' });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ msg: 'Internal Server Error' });
  }
    } else {
        return res.status(500).json({ msg: 'Invalid body!!' });
     }
});   

//to add to favourites
userRouter.put('/api/user/add-favourite', async (req, res) => {
    const { email, productId } = req.body;
    try {
        console.log(email);
        const user = await User.findOne({ email: { $regex: email, $options: "i" } });
        if (!user) {
           return res.status(400).json({ msg: 'User not found!!!' });
        }
        const favourites = user.favourites;
        const index = favourites.findIndex(favouriteItem => favouriteItem.productId == productId);
        if (index == -1)
            favourites.push({
                productId
            });
        else {
             return res.json({ msg: 'Item is already in favourite list ...' });
        }
        user.favourites = favourites;
        await user.save();
        return res.json({ msg: 'Added to wishlist...' });

    } catch (e)
    {
        console.error(e);
        return res.status(500).json({ msg: 'Internal Server Error' });
    }
});



//remove from favourites
userRouter.put("/api/user/remove-favourite", async (req, res) => {
    const { email, productId } = req.body;
    try {
        const user = await User.findOne({email:{$regex:email,$options:"i"}});
        if (!user) {
           return res.status(400).json({ msg: 'User not found!!!' });
        }
        const favourites = user.favourites;
        const index = favourites.findIndex(favouriteItem => favouriteItem.productId == productId);
        if (index == -1)
           return res.json({ msg: 'Item not found ...' });
        else {
            favourites.splice(index, 1);
        }
        user.favourites = favourites;
        await user.save();
        return res.json({ msg: 'removed from favourites...' });

    } catch (e)
    {
        console.error(e);
        return res.status(500).json({ msg: 'Internal Server Error' });
    }
});


//to get cart items of perticular user
userRouter.get('/api/user/cart',async(req, res) => {
    const email  = req.header('email');
    console.log(email);
    const user = await User.findOne({email:{$regex:email,$options:"i"}});
    if (user == null)
        return res.status(500).json({ msg: 'no user exists' });
    return res.json({ cart: user.cart });
});



//to get favourites / wish-list items
userRouter.get('/api/user/favourites', async (req, res) => {
    const email = req.header('email');
    console.log(email);
  const user = await User.findOne({email:{$regex:email,$options:"i"}});
   //  console.log(user);
    if (user == null)
        return res.status(500).json({ msg: 'no user exists' });
    return res.json({ favourites: user.favourites });
});

//to place order
userRouter.post('/api/user/order-checkout', async (req, res) => {
    const productArr = req.body.products;
    console.log(productArr);
    const email = req.header('email');
    let products = [];
    if (productArr != null) {
        try {
            for (const val of productArr) {
                const productId = val.productId;
                const quantity = val.quantity;
                const price = val.price;
                //  console.log(price);
                if (price != null) {
                    products.push({
                        productId,
                        quantity,
                        price
                    });
                }
            }
         //   console.log(products);
            const order = new Order({products});
            console.log(order);
            const result = await order.save();

            if (result != null) {
                const user = await User.findOne({
                    email: {
                        $regex: email,
                        $options:'i'
                } });

                if (user == null) {
                    return res.status(404).json({ msg: 'No user exists!!??' });
                }

                user.orders.push({ orderId: order._id });
                await user.save();
                return res.json({ msg: 'Order placed successfully!!!!' });
            } else {
                return res.status(404).json({ msg: 'Something went wrong' });
            }
        } catch (err) {
            console.error(err);
            return res.status(404).json({ msg: 'Something went wrong' });
        }
    } else {
        return res.status(404).json({ msg: 'Cart is Empty' });
    }
});

//to get order history
userRouter.get('/api/user/orders', async (req, res) => {
    const email  = req.header('email');
    const user = await User.findOne({email: {$regex: email,$options:'i'} });
    if (user == null)
        return res.status(500).json({ msg: 'no user exists' });
    const orders = user.orders.slice().reverse();
    return res.json({ orders:orders });
    
});

userRouter.get('/api/user/order/:id', async(req, res) => {
    const orderId = req.params.id;
    const order = await Order.findOne({ _id: orderId });
    if (order == null)
        return res.status(500).json({ msg: 'no orders exists' });

    return res.json({order:order });
});

module.exports = userRouter;