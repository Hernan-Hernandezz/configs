#!/bin/bash

# Instalación y configuración de Neovim y Zsh

# Función para instalar y configurar Neovim
configure_neovim() {
    # Instalar vim-plug (si no está instalado)
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
    echo "Instalando los plugins de Neovim..."
    nvim -c "PlugInstall" -c "qa"

    # Instalar dependencias de coc.nvim
    echo "Instalando dependencias de coc.nvim..."
    cd ~/.vim/plugged/coc.nvim
    yarn install --frozen-lockfile

    echo "¡La instalación de Neovim y sus plugins ha finalizado!"
}

# Función para configurar Zsh
configure_zsh() {
    # Verifica si Zsh está instalado, y si no, lo instala
    if ! command -v zsh &> /dev/null; then
        echo "Zsh no está instalado. Instalando Zsh..."
        # Instala Zsh en sistemas basados en Debian (como Ubuntu)
        if [ -f /etc/debian_version ]; then
            sudo apt-get update
            sudo apt-get install -y zsh
        # Instala Zsh en sistemas basados en Red Hat (como CentOS)
        elif [ -f /etc/redhat-release ]; then
            sudo yum install -y zsh
        else
            echo "No se pudo determinar el sistema operativo compatible."
            exit 1
        fi
    fi

    # Instala Oh My Zsh
    echo "Instalando Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Configura Zsh (Agrega tu configuración aquí)
    echo "Configurando Zsh..."
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="nanotech"/' ~/.zshrc

    # Define plugins y alias (Agrega tus plugins y alias aquí)
    cat <<EOL >> ~/.zshrc

# Plugins de Zsh
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  web-search
  extract
)

# Alias personalizados
alias estudio="cd ~/Escritorio/estudio"
alias la="ls -la --color"
LS_COLORS=\$LS_COLORS:'ow=1;34:tw=1;34:' ; export LS_COLORS
EOL

    # Imprime un mensaje de finalización
    echo "Configuración de Zsh completa."
}

# Llama a las funciones para instalar y configurar Neovim y Zsh
configure_neovim
configure_zsh

# Imprime un mensaje final
echo "Configuración completa. Reinicia tu terminal para aplicar los cambios."
