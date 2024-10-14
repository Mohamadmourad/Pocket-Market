const mongoose = require('mongoose');
const Product = require('../models/Product');

module.exports.getProducts = async (req,res)=>{
    try{
        const products = await Product.find({});
        res.json(products);
    }catch(err){
        console.log(err);
        res.status(500).json({message:'Server Error'});
    }
}

module.exports.createProduct = async (req,res)=>{
    try{
        const product = new Product(req.body);
        await product.save();
        res.json(product);
    }catch(err){
        console.log(err);
        res.status(500).json({message:'Server Error'});
    }
}

module.exports.searchProduct = async (req, res) => {
    try {
        const name = req.params.name;
        
        // Assuming you have a Product model
        const products = await Product.find({
            name: { $regex: name, $options: 'i' } 
        });
        
        if (products.length === 0) {
            return res.status(404).json({ message: 'No products found' });
        }

        res.status(200).json(products);
    } catch (err) {
        console.log(err);
        res.status(500).json({ message: 'Server Error' });
    }
};

    