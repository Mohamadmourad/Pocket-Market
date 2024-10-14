const mongoose = require('mongoose');

const Schema = mongoose.Schema; 

const productSchema = new Schema({
    code:{type:String,required:true},
    name:{type:String,required:true},
    price:{type:Number,required:true},
    description:{type:String,required:true},
    smallDescription:{type:String,required:true},
    image:{type:String,required:true},
    category:{type:String,required:true},
    brand:{type:String,required:true},
    countInStock:{type:Number,required:true}, 
},{timestamps:true});

module.exports = mongoose.model('Product',productSchema);