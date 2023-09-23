const mongoose = require("mongoose");
const productSchema = require("./product");
const userSchema = require("./user");

const orderSchema = new mongoose.Schema({
    products: [
        {
            productId: {
                type: String,
                required:true,
            },
            quantity: {
                type: Number,
                default:1,
            },
            _id:false,
        }
    ],
    date: {
        type: Date,
        default: Date.now, 
    },
});

const orderModel = mongoose.model("Order", orderSchema);
module.exports = orderModel;
