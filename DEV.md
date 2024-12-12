
1. Clonar el repositorio
Primero, necesitas clonar el repositorio de OLFANALYZER en tu máquina local. Abre una terminal y ejecuta:

        -- git clone https://github.com/Mintplex-Labs/olfanalyzer.git
           cd olfanalyzer

2. Configurar el entorno
Asegúrate de tener instalado Node.js y Yarn. Luego, crea el archivo .env a partir del archivo de ejemplo:

    -- cp server/.env.example server/.env

Edita el archivo server/.env para configurar las variables necesarias. Asegúrate de que las claves y configuraciones sean correctas para tu entorno de desarrollo.

3. Instalar dependencias
Instala las dependencias necesarias para el servidor y el frontend:

    -- sudo yarn setup


4. Iniciar el servidor y el frontend
Ahora puedes iniciar el servidor y el frontend en modo desarrollo. Abre dos terminales diferentes y ejecuta los siguientes comandos:
En la primera terminal (servidor):

    -- sudo yarn dev:server

En la segunda terminal (frontend):

    -- sudo yarn dev:frontend

Colector de documentos:

    -- sudo yarn dev:collector

5. Acceder a la aplicación
Una vez que ambos procesos estén en funcionamiento, puedes acceder a la aplicación en tu navegador en la siguiente dirección:

    -- http://localhost:3001


6. Realizar cambios y ver en directo

Ahora puedes realizar cambios en el código y ver los resultados en tiempo real en tu navegador. Asegúrate de que tu editor de código esté configurado para guardar automáticamente los cambios o recuerda guardar manualmente para ver los cambios reflejados.

Notas adicionales
Si encuentras problemas de permisos, asegúrate de que el UID y GID en tu archivo .env coincidan con los de tu usuario en el sistema.
Para cualquier error que surja, revisa los logs en la terminal donde ejecutaste el servidor para obtener más información sobre lo que podría estar fallando.

Con estos pasos, deberías estar listo para comenzar a modificar y desarrollar nuevas funcionalidades en OLFANALYZER. Si necesitas más ayuda, no dudes en preguntar.