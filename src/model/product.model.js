require('dotenv').config();
const { Sequelize, DataTypes, Model, UUIDV4} = require('sequelize');

const sequelize = new Sequelize(
    process.env.DB_NAME,
    process.env.DB_USER,
    process.env.DB_PASSWORD,
    {
        host: process.env.DB_HOST,
        dialect: process.env.DB_DIALECT,
        port: process.env.DB_PORT,
    }
);

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

async function testConnection() {
    try {
        await sequelize.authenticate();
        console.log("Conexion Exitosa")
    } catch (err) {
        console.error("Error de Conexion", err);
    }
}

testConnection();