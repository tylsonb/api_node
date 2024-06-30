const express = require ('express');
const morgan = require ('morgan');
const path = require('path');
const { engine } = require('express-handlebars');
const { join, dirname } = require('path');
const { fileURLToPath } = require('url');
const router = require('../router/product.router.js');


const app = express ();

app.set('views', join(__dirname, '../views'));
app.engine('.hbs', engine({
    defaultLayout: 'main',
    layoutsDir: join(app.get('views'), 'layouts'),
    partialsDir: join(app.get('views'), 'partials'),
    extname: '.hbs',
    runtimeOptions: {
        allowProtoPropertiesByDefault: true,
        allowProtoMethodsByDefault: true
    }
}));

app.set('views engine', '.hbs');


//Middlewares
app.use(morgan ('dev'));
app.use(express.json());
app.use(express.urlencoded({extended: false}))

/* app.get('/', (req, res) => {
    res.send('Sevidor Express');
});
 */
app.get('/', (req, res) => {
    res.render('index.hbs');
});

app.get('/add', (req, res) =>{
    res.render('productos/add.hbs')
})

app.get('/edit', (req, res) =>{
    res.render('productos/edit.hbs')
})



app.use('/api/v1', router)

// public
app.use(express.static(path.join(__dirname,'../public')))


module.exports = app;