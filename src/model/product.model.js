const { Sequelize, DataTypes, Model, UUIDV4} = require('sequelize');

const sequelize = new Sequelize ("bellotj_product", "bellotj_root", "rXAje#7#M8N9.4F",{
    host: 'mysql-bellotj.alwaysdata.net',
    dialect: 'mysql',
    port: 3306
})

class Product extends Model {}

Product.init({
    product_id: {
        type: DataTypes.UUID,
        defaultValue:DataTypes.UUIDV4,
        primaryKey: true,
    },
product_name : {
    type: DataTypes.STRING,
    allowNull: false,
},
price : {
    type: DataTypes.FLOAT(10 ,2),
    allowNull:false,
},
is_stock:{
    type:DataTypes.BOOLEAN,
}
 
},{
    sequelize,
    modelName: 'Product',
    tableName: 'products'
});

module.exports = Product;

/* async function testConnection() {
    try {
        await sequelize.authenticate();
        console.log("Conexion Exitosa")
    } catch (err) {
        console.error("Error de Conexion", err);
    }
}

testConnection(); */