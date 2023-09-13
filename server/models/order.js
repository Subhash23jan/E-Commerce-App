const mongoose = require("mongoose");
const productSchema = require("./product");
const userSchema = require("./user");

const orderSchema = mongoose.Schema({
    customer: userSchema,
    product: productSchema,
    quantity: {
        required: true,
        type: Number,
    },
    date: {
        type: Date,
        default: Date.now, 
    },
});

const orderModel = mongoose.model("Order", orderSchema);
module.exports = orderModel;
