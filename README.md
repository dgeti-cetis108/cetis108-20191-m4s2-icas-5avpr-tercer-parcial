## Centro de Estudios Tecnológicos industrial y de servicios No. 108
### Carrera: Programación<br>Semestre: Agosto 2019 - Enero 2020
### Módulo 4: Administra sistemas operativos, de aplicaciones y servicios
### Profesor: Bidkar Aragón Cárdenas
___
## M4S2 - Instala y configura aplicaciones y servicios
### Tercer parcial
Instalación y configuración de un entorno **LAMP** (*Linux+Apache+MySQL+PHP*), para el alojamiento de aplicaciones web desarrolladas con ésta tecnología.

### Instalación del sistema operativo
#### Ubuntu Server 18.04 LTS


#### Instalar Apache, MySQL y PHP utilizando Tasksel
En lugar de instalar Apache, MySQL y PHP por separado, Tasksel ofrece una manera simple de obtener LAMP corriendo rápidamente.

```bash
# actualizar lista de paquetes
$ sudo apt update

# aplicar actualizaciones
$ sudo apt upgrade

# instalar tasksel
$ sudo apt install tasksel

# instalar lamp-server con tasksel
$ sudo tasksel install lamp-server
```

### Configuración del entorno LAMP
