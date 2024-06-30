# API Node Project

![Node.js Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Node.js_logo.svg/320px-Node.js_logo.svg.png)
![npm Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Npm-logo.svg/320px-Npm-logo.svg.png)



Este proyecto API Node.js está diseñado para gestionar productos en una base de datos MySQL alojada en [bellotj.alwaysdata.net](http://bellotj.alwaysdata.net).

## Requisitos

- Node.js
- npm
- MySQL

## Rutas de la API

- **Crear Producto:** `POST /api/v1/products`
  - Crea un nuevo producto en la base de datos.

- **Editar Producto:** `POST /api/v1/products/:product_id`
  - Edita un producto existente en la base de datos.

- **Eliminar Producto:** `DELETE /api/v1/products/:product_id`
  - Elimina un producto de la base de datos.

- **Consultar Productos:** `GET /api/v1/products`
  - Obtiene la lista de todos los productos almacenados.

## Configuración

1. Clona este repositorio.
2. Instala las dependencias usando `npm install`.
3. Configura las variables de entorno necesarias para la conexión a la base de datos.

## Ejecución

Para ejecutar el servidor, utiliza el siguiente comando:

```bash
node src/index.js