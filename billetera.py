#from sqlalchemy import create_engine, select, join, MetaData, Table
import sys
import os
dirname = os.path.dirname(__file__)
 
sys.path.append(dirname)
sys.path.append(dirname+"/db_models/")
from sqlalchemy import create_engine, select, join, MetaData, Table

#from db_models.headquarte import Headquarters
from db_models.typeoftransactions import TypeOfTransactions
from db_models.users import Users
from db_models.companies import Companies
from db_models.contacts import Contacts
from db_models.transactions import Transactions
from config_vars import BBDD_CONNECTION


class WalletDAO:
    print("starting")
    engine = create_engine(BBDD_CONNECTION)
    connection = engine.connect()
    print("finished connection")
    metadata = MetaData()
    
    def get_typeoftransactions(self, *, tpe_id=None):
        if tpe_id:
            query = TypeOfTransactions.single_typeoftransactions(tpe_id=tpe_id)
        else:
            query = TypeOfTransactions.all_typeoftransactions()
        return self.connection.execute(query).fetchall()
        
    def get_users(self, *, user_id=None, user_name=None):
        if user_id:
            query = Users.single_users(user_id=user_id)
        elif user_name:
            query = Users.users_by_name_or_last_name(user_name=user_name)
        else:
            query = Users.all_users()
        return self.connection.execute(query).fetchall()
        
    def insert_user(self, user_name, user_last_name, user_email, user_password):
        query = Users.insert_user(user_name, user_last_name, user_email, user_password)
        return self.connection.execute(query)
        
    def update_user(self,user_id, user_name, user_last_name, user_email, user_password):
        query = Users.update_user(user_id, user_name, user_last_name, user_email, user_password)
        return self.connection.execute(query)

    def delete_user(self, user_id):
        query = Users.delete_user(user_id)
        return self.connection.execute(query)
            
    def get_companies(self, *, companies_id=None, user_id=None):
        if companies_id:
            query = Companies.single_companies(companies_id = companies_id)
        elif user_id:
            query = Companies.companies_by_user(user_id = user_id)
        else:
            query = Companies.all_companies()
        return self.connection.execute(query).fetchall()
        
    def get_contacts(self, *, contacts_id=None, user_id=None):
        if contacts_id:
            query = Contacts.single_contacts(contacts_id = contacts_id)
        elif user_id:
            query = Contacts.contacts_by_user(user_id = user_id)
        else:
            query = Contacts.all_contacts()
        return self.connection.execute(query).fetchall()
        
    def get_transactions(self, *, transactions_id=None, user_id=None, tpe_id=None):
        if transactions_id:
            query = Transactions.single_transactions(transactions_id = transactions_id)
        elif user_id and tpe_id:
            query = Transactions.transactions_by_user_and_type_of_transactions(user_id = user_id, tpe_id = tpe_id)
        elif user_id:
            query = Transactions.transactions_by_user(user_id = user_id)
        elif tpe_id:
            query = Transactions.transactions_by_type_of_transactions(tpe_id = tpe_id)
        else:
            query = Transactions.all_transactions()
        return self.connection.execute(query).fetchall()