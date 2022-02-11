# README


* Introducción
En este repositorio se guarda el acceso al código fuente de Kloudradio. Son comandos de manipulación de la nube de heroku, se describirán los requisitos, las dependencias y en paso a paso para la modificación del código fuente de kloudradio.

* Requisitos de sistema

**Se necesita una pc con linux y los siguientes paquetes instalados:**
* git
* docker
* docker-compose
* heroku-cli
* bash (para la ejecución del despliegue)

Se necesitará además un ide apropiado, como atom, visual-studio-code, sublime-text, etc. Además un navegador web para ingresar a la nube de heroku.

Las modificaciones pueden ser implementadas si sees miembro del equipo de desarrollo de kloudadio.herokuapp.com, y los comandos solamente modifican a esta aplicación web.

**Los comandos que provee este proyecto son:**
* get-code-heroku: Al ejeecutar este comando, se obtiene en una carpeta llamada kloudradio con el código fuente de la composición del container linux compatible con heroku. También es versionado por el repositorio git de heroku. una vez descargado, el código es editable mediante los ide antes mencionados.
* set-code-to-heroku: Este comando enciende un nuevo codigo fuente compilado en la nube de Heroku y sincroniza los cambios y guarda el mensaje correspondiente a la ejecucion del momento.

Para obtener el código fuente y modificarlo::
``` [bash]
  $ systemctl start docker #(para encender el proceso de docker si no se habilito antes)
  $ git clone https://github.com/byJDP/src-code-kloudradio.git
  $ cd src-code-kloudradio
  $ sh get-code-heroku.sh
  $ atom src-code-kloudredio
  $ set-code-to-heroku "Implementa los cambios editados con atom"
  
```