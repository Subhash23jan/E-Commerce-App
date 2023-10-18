const express=require('express');
const mongoose=require('mongoose');
const authRouter = require('./server/routes/auth');
const userRouter = require('./server/routes/user_router');
const adminRouter = require('./server/routes/admin_router');
const productRouter = require('./server/routes/product_router');
const DB='mongodb+srv://subhash613d:subhash123@cluster0.wgtypza.mongodb.net/?retryWrites=true&w=majority';
console.log("subhash");
const app=express();

app.use(express.json());
app.use(authRouter);
app.use(userRouter);
app.use(adminRouter);
app.use(productRouter);
app.listen(4000,()=>{
    console.log('connection is successfull');
})
mongoose.connect(DB).then( ()=>{
       console.log('connected to mongoDB');
    }
).catch((e)=>{
    console.log('not connected to mongoDB');
    console.log(e);
});
