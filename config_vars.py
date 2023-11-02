#BBDD_CONNECTION = "postgresql://admin:ueDrxqVQwtQeBGJ@192.168.88.247/rasa"  


BBDD_CONNECTION = "oracle+cx_oracle://ADMIN:Basededatos2+@basededatosii_low/?encoding=UTF-8&nencoding=UTF-8"
import cx_Oracle

d="C:\\Users\\danit\\opt\\instantclient_19_20"
print(d)
cx_Oracle.init_oracle_client(lib_dir=d)
