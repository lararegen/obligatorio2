#!/usr/bin/env bash

cd "$(dirname "$0")"

estado_git=$(git status --porcelain)

if [ -z "$estado_git" ]; then
  rama_local=$(git rev-parse @)
  rama_remota=$(git rev-parse @{u} 2>/dev/null)

  if [ "$rama_local" = "$rama_remota" ]; then
    echo "No hay commits nuevos para enviar."
    exit 0
  else
    echo "Hay commits sin eviar. Procediendo a hacer push."
  fi
else
  echo "Se detectaron cambios sin commit. Realizando commit automatico..."

  git add .
  git commit -m "Commit automatico semanal"
fi

git push origin main


lineas_modificadas=$(git show --stat --oneline -1 | grep "changed" | awk '{print $1}')

echo "Se modificaron $lineas_modificadas lineas en el ultimo commit."

echo "Ultima subida: $(date). Lineas modificadas: $lineas_modificadas" >> README.md
