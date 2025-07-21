#!/bin/bash

USUARIOS="usuarios.txt"

echo "=== MENÚ DE AUTENTICACIÓN ==="
echo "1. Registrar usuario"
echo "2. Iniciar sesión"
read -p "Opción: " opcion

if [ "$opcion" == "1" ]; then
  read -p "Nombre de usuario: " usuario
  read -p "Contraseña: " clave
  echo "$usuario:$clave" >> $USUARIOS
  echo "Usuario registrado."
elif [ "$opcion" == "2" ]; then
  read -p "Nombre de usuario: " usuario
  read -p "Contraseña: " clave
  if grep -q "$usuario:$clave" "$USUARIOS"; then
    echo "Login exitoso."
  else
    echo "Usuario o contraseña incorrecta."
  fi
else
  echo "Opción inválida."
fi


