# Billetera
Billetera virtual que administra usuarios, contactos de los usuarios, transacciones, tipos de transacciones, compañias.

#### Stack tecnologico 
* SQL Data Modeler
* SQL Developer
* IDE or Text editor 
* Python 3.8
* pip (administra e instala paquetes de software escritos en pyton)
* notebook
* jupyter (herramienta que permite hacer consulta a grandes conjuntos de datos de manera interactiva a traves de un navegador)
* sqlalchemy==1.4 (Asignador relacional de objetos y una biblioteca de Python que puede transferir datos almacenados en una base de datos SQL a Python objetos)
* cx_Oracle==8.3 (Api que permite consultar y actualizar bases de datos Oracle)
* oracledb

#### Pasos a seguir para administrar la Base de Datos 
En primer lugar instalamos las herramientas necesarias para realizar el diagrama de clases. 
https://drive.google.com/drive/u/0/folders/1_TpN7M4oR223WF6M5QCCR-V0lvgXRcG5
En este caso utilizamos SQL Data Modeler, continuamos con la creacion de las tablas y el scrip correspondiente en SQL Developer. 
https://drive.google.com/file/d/1LG_ZIbrByOQnAZx-dr9aseFqMM-dm42V/view?usp=share_link

Luego, mediante la herramienta Anaconda (instalada previamente) accedimos a Jupyter, donde creamos cada una de las clases: user, wallet, type of transaction, transaction, companyes y contacts; ademas del archivo de conexión.
A éste ultimo lo vinculamos con la base de datos creada en el cloud de la siguiente manera:

***cs='''(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.sa-saopaulo-1.oraclecloud.com))(connect_data=(service_name=gd5f74d7098ae29_basededatosii_high.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))'''


Así mismo modificamos el archivo config_vars donde colocamos los datos correspondientes para que la conexión fuera exitosa. 


***import cx_Oracle

***d="C:\\Users\\danit\\opt\\instantclient_19_20"
print(d)
cx_Oracle.init_oracle_client(lib_dir=d)


En el archivo billetera.py codificamos las funciones correspondientes para insertar, eliminar y filtrar cada una de las clases creadas anteriormente. Por ejemplo, para insertar un usuario el código es el siguiente:



***def insert_user(self,user_name, user_lastname, user_email, user_password):
        query = Users.insert_user(
            user_name=user_name,
            user_lastname=user_lastname,
            user_email=user_email,
            user_password=user_password
        )
        return self.connection.execute(query)

Por ultimo realizamos las consultas correspondientes en un archivo llamado Billetera_consultar. Por ejemplo, a la hora de listar los nombres de los usuarios colocamos:

***dataset['USER_NAME'] 


En caso de querer filtrar un usuario por una parte de su nombre, escribimos lo siguiente:

***com = data.get_users(user = 'Vil')
***com


Y asi continuamos consultando cada uno de los datos que componen a los usuarios de la billetera virtual, sus transacciones y contactos correspondientes.

