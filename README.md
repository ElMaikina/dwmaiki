## DWMaiki (_Fork_ de [DWM](https://dwm.suckless.org/))
____
## Descripcion

_Window Manager_ hecho a partir del codigo original de DWM de Suckless. Esta escrito en C y tiene
una cantidad de lineas de codigo muy bajo.

## Motivacion
____

La idea de este proyecto es crear un gestor de ventanas con una configuracion estandar razonable,
la interfaz contiene una barra de tareas que muestra las aplicaciones abiertas junto a iconos
descriptivos. Ademas, viene con cuatro disposiciones de ventana: _Mosaico_, _Flotante_, _Monoculo_ 
y _Centrado_.  

## Instalacion 🔎
____

Primero, instalar las dependencias a traves del terminal:

### 󰣇 Arch Linux /  Manjaro
```console
user@desktop: sudo pacman -S base-devel libx11 libxft libxinerama freetype2 fontconfig
```

###  Ubuntu / 󰣭 Linux Mint /  Debian
```console
user@desktop: sudo apt install build-essential libx11-dev libxft-dev libxinerama-dev libfreetype6-dev libfontconfig1-dev
```

###  Fedora
```console
user@desktop: sudo dnf install libX11-devel libXft-devel libXinerama-devel libXrandr-devel xorg-x11-xinit-session
```

 Luego, clonar el proyecto a la carpeta de preferencia y luego compilar:

```console
user@desktop: git clone https://github.com/ElMaikina/dwmaiki
user@desktop: cd dwmaiki
user@desktop: sudo make clean install
```

_La carpeta puede borrarse luego de instalar_
