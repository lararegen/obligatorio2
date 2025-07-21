#!/bin/bash

PRODUCTOS="productos.txt"

echo "=== ALTA DE PRODUCTO ==="
read -p "Nombre: " nombre
read -p "Descripción: " descripcion
read -p "Precio: " precio
read -p "Stock: " stock

echo "$nombre|$descripcion|$precio|$stock" >> $PRODUCTOS
echo "Producto agregado."

