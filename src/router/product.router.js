const router = require ('express').Router();
const {faker} = require ('@faker-js/faker');
const path = require('path');

const Products = require ("../model/product.model.js");

router.get('/products', async (req, res) => {
    try {
    const products = await Products.findAll()
    res.render('productos/list.hbs',{productos:products} )
} catch (error) {
    res.status(500).json({
        ok: false,
        status: 500,
        message: 'Internal Server Error'
    });
}
});

router.post('/add', async (req, res) => {
    try{
    const dataProducts = req.body
    await Products.sync()
    const createProduct = await Products.create({
        product_name:dataProducts.product_name,
        price:dataProducts.price,
        is_stock:dataProducts.is_stock,     
    });

    res.redirect('/api/v1/products');
}
catch(err){
    res.status(500).json({message:err.message});
}
}); 

//Editar

router.get('/products/:product_id', async (req, res) => {
    const id = req.params.product_id;
    try {
        
        const product = await Products.findOne({
            where: {
                product_id: id
            }
        });

        if (product) {
            console.log(product.toJSON());
            res.render('productos/edit.hbs', {product });
        } else {
            res.status(404).json({
                ok: false,
                status: 404,
                message: 'Producto no encontrado'
            });
        }
    } catch (error) {
        res.status(500).json({
            ok: false,
            status: 500,
            message: 'Error interno del servidor'
        });
    }
});



// actulizar

router.post('/products/:product_id', async (req, res) => { 
    const id = req.params.product_id;
    const dataProducts = req.body;

    try {
        const updateProduct = await Products.update(
            {
                product_name: dataProducts.product_name,
                price: dataProducts.price,
                is_stock: dataProducts.is_stock,
            },
            {
                where: {
                    product_id: id,
                },
            }
        );

        if (updateProduct[0] === 0) { 
            return res.status(404).json({
                ok: false,
                status: 404,
                message: 'Producto no encontrado'
            });
        }

        res.redirect('/api/v1/products');
    } catch (error) {
        res.status(500).json({
            ok: false,
            status: 500,
            message: 'Error interno del servidor',
            error: error.message
        });
    }
});


//eliminar

router.get('/delete/:product_id', async (req, res) => {
    const id = req.params.product_id;

    try {
        const deleteProduct = await Products.destroy({
            where: {
                product_id: id
            }
        });

        // Verifica si el producto fue eliminado
        if (deleteProduct === 0) {

            return res.status(404).sendFile(path.join(__dirname, '../public/404.html'));
            /* return res.status(404).json({
                ok: false,
                status: 404,
                message: 'Producto no encontrado'
            }); */
        }
        

        res.redirect('/api/v1/products');
        
    } catch (error) {
        res.status(500).json({
            ok: false,
            status: 500,
            message: 'Error interno del servidor',
            error: error.message
        });
    }
});






module.exports = router;