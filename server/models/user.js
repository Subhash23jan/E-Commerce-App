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
            }
        }
    ],
    favourites: [
        {
            productId: {
                type: String,
                required:true,
            },
        }
    ],
    orders: [
        {
            orderId: {
                type: String,
                required:true,
            }
        }
    ]
});

const userModel = mongoose.model("User", userSchema);
module.exports = userModel;