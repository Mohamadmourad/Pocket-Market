require('dotenv').config();

const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();

const productRoutes = require('./routes/ProductRoutes');

app.use(express.json());
app.use(cors());
app.use('/products',productRoutes);

app.use((req,res,next)=>{
  console.log(req.path,req.method);
  next();
})


mongoose.connect(process.env.MongoDB_URL)
.then(()=>{
    app.listen(process.env.PORT,()=>{
        console.log('connected to db and listening to port 4000');
    })
    
})
.catch((err)=>{console.log(err)});




