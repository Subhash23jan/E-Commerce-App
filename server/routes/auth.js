const express=require('express');
const User = require('../models/user');
const authRouter=express.Router();

authRouter.post('/api/user', (req, res) => {
    const { user } = req.body;
    res.json({ msg: user });
})

//user authentications

authRouter.post('/api/user/signup', async (req, res) => {
    const { name, email, password } = req.body;
        console.log("stage1");
    const exisitingUSer = await User.findOne({
        email: { $regex: email, $options: "i" }
    });
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
authRouter.post('/api/user/signin', async (req, res) => {
    const { email, password } = req.body;
    try {
        const user = await User.findOne({
            email:{$regex:email,options:"i"}
        });
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
authRouter.delete('/api/user/delete', async (req, res) => {
    const { email,password } = req.body;
    const isDeleted = await User.findOneAndDelete({
        $and: [
            { email: { $regex: email, $options: "i" } },
            {userType:{$regex:'user'}}
       ]
    });
    if (isDeleted != null)
        return res.json({ msg: 'User deleted successfully!!!' });

    if (isDeleted == null)
        return res.status(400).json({ msg: 'Something went wrong!?' });

    if (isDeleted.password == password)
        return res.json({ msg: 'Incorrect password!!' });

    return res.status(400).json({ msg: 'Something went wrong!?' });
        
});




// admin authentications

authRouter.post('/api/admin/signup', async (req, res) => {
    const { name, email, password } = req.body;
        console.log("stage1");
    const exisitingUSer = await User.findOne({
            email: { $regex: email, $options: "i" }
        });
        if (exisitingUSer) {
            console.log('already exists');
            return res.status(400).json({ msg: 'user alreadt exisits' });
        }
        let user = new User({
            email, password, name,
            userType:'admin'
        });
        user = await user.save();
        return res.json({ msg: 'Admin account created successfully',user });
});
authRouter.post('/api/admin/signin', async (req, res) => {
    const { email, password } = req.body;
    try {
        const user = await User.findOne({email: { $regex: email, $options: "i" }});
        console.log(email);
        if (!user) {
             return res.status(400).json({ msg: 'Admin with this email does not exist !!' });
        }
        if (user && user.password != password) {
            return res.status(400).json({ msg: 'Incorrect password !!' }); 
        }
        if (user.userType != 'admin')
            return res.status(400).json({ msg: 'You are not an admin!!' });

        if (user && user.password == password) {
            return res.status(200).json(user);
        }
    } catch (e) {
        res.status(500).json({ msg: "something went wrong" });
    }
});


authRouter.delete('/api/admin/delete', async (req, res) => {
    const { email,password } = req.body;
    const isDeleted = await User.findOneAndDelete({
        $and: [
            { email: { $regex: email, $options: "i" } },
            {userType:{$regex:'admin'}}
       ]
    });
    if (isDeleted != null)
        return res.json({ msg: 'Admin deleted successfully!!!' });
    if (isDeleted == null)
        return res.status(400).json({ msg: 'Something went wrong!?' });
    
    if (isDeleted.password == password)
        return res.json({ msg: 'Incorrect password!!' });

    if (isDeleted.userType == 'user')
        return res.json({ msg: 'Admin cannot delete  user' });

    return res.status(400).json({ msg: 'Something went wrong!?' });
        
});











//  authRouter.get('/api/user/:email', async (req, res) => {
//     try {
//         const user = await User.findOne({
//             email: { $regex: req.params.email, $options: 'i' }
//         });
        
//         if (user !== null) {
//             return res.json(user);
//         } else {
//             return res.status(400).json({
//                 msg: 'No email exists'
//             });
//         }
//     } catch (error) {
//         return res.status(500).json({
//             msg: 'Internal server error'
//         });
//     }
// });


module.exports=authRouter;