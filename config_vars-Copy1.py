#BBDD_CONNECTION = "postgresql://admin:ueDrxqVQwtQeBGJ@192.168.88.247/rasa"  


BBDD_CONNECTION = "postgresql://cristian:Ru7|97=(73Fb@hcaprod.kunan.com.ar:5432/rasa"

import cx_Oracle

d="/opt/oracle/instantclient_21_4"
print(d)
cx_Oracle.init_oracle_client(lib_dir=d)

