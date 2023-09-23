
const mongoose = require("mongoose");

const productSchema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim:true,
    },
    url: {
        type: String,
        required: true,
    },
    productType: [{
        required: true,
        type: String,
        _id:false,
        },
    ],
    price: {
        type: Number,
        required: true,
    },
});
const productModel = mongoose.model("product", productSchema);
module.exports = productModel;