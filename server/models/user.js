const mongoose = require('mongoose');
const productSchema = require("../models/product");

const userSchema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true,
    },
    address: {
        type: String,
        default: '',
    },
    userType: {
        type: String,
        default: 'user',
    },
    password: {
        type: String,
        required: true,
    },
    email: {
        required: true,
        type: String,
        trim: true,
    },
    cart: [
        {
            productId: {
                type: String,
                required:true,
            },
            quantity: {
                type: Number,
                required: true,
            },
            _id:false,
        }
    ],
    favourites: [
        {
            productId: {
                type: String,
                required:true,
            },
            _id:false,
        }
    ],
    orders: [
        {
            orderId: {
                type: String,
                required:true,
            },
            _id:false,
        }
    ]
});

const userModel = mongoose.model("User", userSchema);
module.exports = userModel;