const express=require('express');
const mongoose=require('mongoose');
const authRouter = require('./server/routes/auth');
const DB='mongodb+srv://subhash613d:subhash123@cluster0.wgtypza.mongodb.net/?retryWrites=true&w=majority';
console.log("subhash")
const app=express();

app.use(express.json());
app.use(authRouter);
app.listen(3000,()=>{
    console.log('connection is successfull');
})
mongoose.connect(DB).then( ()=>{
       console.log('connected to mongoDB');
    }
).catch((e)=>{
    console.log('not connected to mongoDB');
    console.log(e);
});
