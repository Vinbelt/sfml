# sfml
Este es un ejercicio para alumnos de prof.Javier Boira en el IES Elaios:  
**El repositorio incluye:**  
    - Un shell para ejecutar con codespaces  
    - Tiene todo preparado para compilar (ctrl+shift+b) usando cMake+Ninja  
    - Incluye librerías sfml para compilar en C++  
    - Servidor desktop-lite + Xvfb de pantalla virtual X en memoria   
    - Servidor TigerVNC de pantalla X en memoria + Servidor de pantalla remota VNC(6080)  
    - Escritorio gráfico Fluxbox  
    - Websockify proxy entre Websocket y tcp (websocket puerto 6080 y tcp puerto 5901)  
    - noVNC de cliente VNC en Javascript para comunicarse con Websockify por puerto 5901  

OJO:  No se arranca bien el servidor tigervncserver con 24 layers de profundidad (lo hace con 16) por lo que hay que ejecutar en el terminal:  
tigervncserver -kill :1 && tigervncserver :1 -geometry 1440x768 -depth 24 -rfbport 5901 -dpi 96 -localhost -Securitytypes None &&xdpyinfo|grep "depth of root windows"   
y comprobar que tiene 24 bits de profundidad.  

**La estructura de direcotrios tiene:**  
```
/-┐  
  ├/assets (ficheros .png)  
  └/include   
      └funciones.h (fichero con las definiciones de todos los objetos y librerías usadas)  
  └/src   
      ├main.cpp          (fichero con bucle principal)  
      ├funciones.cpp     (fichero por si es necesario algún objeto en común)  
      └javier.cpp        (fichero con objetos de cada alumno- un fichero por alumno)  
```
**Para trabajar:**  
1.- Se hace fork de este repositorio en un repositorio master  
2.- Los alumnos pueden trabajar en local a) ó en Github b)  
    a)git clone del repositorio en local  
    b)hacen un fork a su vez desde su repositorio del repositorio master  
3.- El programa tiene todo preparado para compilar (ctrl+shift+b)  
4.- Uno ó varios alumnos se encargan del bucle principal main.cpp  
5.- Los alumnos creaan un fichero /src/nombre.cpp propio con el objeto que deseen con los métodos:  
    a)constructor, en el que se carga la textura (puede ser la que viene dada ó no)  
    b)mover, en el que se decide el movimiento  
    c)colision, en el que se decide que hacer cuando colisiona  
    d)destructor  
propiedades privadas:  
    a)velocidad  
    b)textura  

Los alumnos pueden acordar más métodos y propiedades.   
Los alumnos se deben de poner de acuerdo en cuantos objetos se lanzan al principio y cuales son las reglas del juego.  






sfml 2026:
El nombre del proyecto y del fichero es Fubar y está en el CMakeLists.txt del raíz

Ejecutar: tigervncserver -kill :1 && tigervncserver :1 -geometry 1440x768 -depth 24 -rfbport 5901 -dpi 96 -localhost -Securitytypes None

