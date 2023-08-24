
const mongoose=require('mongoose');

const userSchema = mongoose.Schema({
    // id: {
    //     type: String,
    //     required:true
    // },
    name: {
        type: String,
        required: true,
        trim: true,
    },
    address: {
        type: String,
        default: '',
    },
    type: {
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
    }
});

const userModel = mongoose.model("User", userSchema);
module.exports = userModel;