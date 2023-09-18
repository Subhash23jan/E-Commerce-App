const mongoose = require("mongoose");
const productSchema = require("./product");
const userSchema = require("./user");

const orderSchema = mongoose.Schema({
    Items: [
        {
            productId: {
                type: String,
                required:true,
            },
            quantity: {
                type: Number,
                default:1,
            }
        }
    ],
    date: {
        type: Date,
        default: Date.now, 
    },
});

const orderModel = mongoose.model("Order", orderSchema);
module.exports = orderModel;
