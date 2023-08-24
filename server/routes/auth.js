const express=require('express');
const User = require('../models/user');
const { Console } = require('console');
const authRouter=express.Router();

authRouter.post('/api/user',(req,res)=>{
    res.json({msg:'subhash'})
})
authRouter.post('/api/signup', async (req, res) => {
    const { name, email, password } = req.body;
        console.log("stage1");
        const exisitingUSer = await User.findOne({ email });
        if (exisitingUSer) {
            console.log('already exists');
            return res.status(400).json({ msg: 'user alreadt exisits' });
        }
        let user = new User({
            email, password, name
        });
        user = await user.save();
        return res.json({ msg: 'user created successfully',user });
});
authRouter.post('/api/signin', async (req, res) => {
    const { email, password } = req.body;
    try {
        const user = await User.findOne({email});
        console.log(email);
        if (!user) {
             return res.status(400).json({ msg: 'User with this email does not exist !!' });
        }
        if (user && user.password != password) {
            return res.status(400).json({ msg: 'Incorrect password !!' }); 
        }
        if (user && user.password == password) {
            return res.status(200).json(user);
        }
    } catch (e) {
        res.status(500).json({ msg: "something went wrong" });
    }

});


module.exports=authRouter;