#!/bin/bash

PRODUCTOS="productos.txt"
TEMP="tmp.txt"

read -p "Nombre del producto: " nombre
read -p "Cantidad a comprar: " cantidad

touch $TEMP

encontrado=0
while IFS="|" read -r n desc precio stock; do
  if [ "$n" == "$nombre" ]; then
    if [ "$stock" -ge "$cantidad" ]; then
      nuevo_stock=$((stock - cantidad))
      echo "$n|$desc|$precio|$nuevo_stock" >> $TEMP
      echo "Compra realizada. Stock actualizado."
    else
      echo "$n|$desc|$precio|$stock" >> $TEMP
      echo "Stock insuficiente."
    fi
    encontrado=1
  else
    echo "$n|$desc|$precio|$stock" >> $TEMP
  fi
done < $PRODUCTOS

mv $TEMP $PRODUCTOS

if [ "$encontrado" -eq 0 ]; then
  echo "Producto no encontrado."
fi
