#!/bin/bash

# Instalar vim-plug (gestor de plugins para Vim)
# Si ya tienes vim-plug instalado, puedes omitir esta parte
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    echo "Instalando vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Crear el directorio de plugins si no existe
if [ ! -d ~/.vim/plugged ]; then
    echo "Creando el directorio de plugins..."
    mkdir -p ~/.vim/plugged
fi

# Instalar los plugins y las dependencias
echo "Instalando los plugins..."
vim -c "PlugInstall" -c "qa"

# Instalar dependencias de coc.nvim
echo "Instalando dependencias de coc.nvim..."
cd ~/.vim/plugged/coc.nvim
yarn install --frozen-lockfile

echo "¡La instalación de plugins y dependencias ha finalizado!"

