import json
import pyodbc
import pandas as pd
from models import Student, Teacher
from utils import convert_to_date_iso8601

with open("config.json", "r") as f:
    config = json.loads(f.read())
class SQLServer:
    def __init__(self, config = config['SQL-Server']):
        conn_str = ''
        for key, value in config.items():
            conn_str = f'{conn_str}{key}={value};'
        self.__open_connection(conn_str)
    def __open_connection(self, conn_str):
        try:
            self.conn = pyodbc.connect(conn_str)
            self.cursor = self.conn.cursor()
        except pyodbc.InterfaceError:
            print("[SQL Server] Driver not found")
            exit()
        except pyodbc.OperationalError:
            print("[SQL Server] Time out.. Can't open a connection to SQL Server")
            exit()
        except:
            print("[SQL Server] Can't open a connection to SQL Server")
            exit()
    def login(self, username, password):
        return pd.read_sql(f"SELECT * FROM [User] WHERE username = '{username}' AND password = '{password}'", self.conn).shape[0]

    def get_all_students(self):
        df =  pd.read_sql("SELECT * FROM Student", self.conn)
        return [Student(*kwargs.values()) for kwargs in df.to_dict(orient='records')]
    def delete_one_student(self, id):
        self.cursor.execute(f"DELETE Student WHERE Id = {id}")
        self.conn.commit()
        return self.cursor.rowcount
    def add_one_student(self, args):
        id, fullname, address, gender, birthdate, username, password = args['id'], args['fullname'], args['address'], args['gender'], args['birthdate'], args['username'], args['password']
        try:
            self.cursor.execute(f"INSERT [User] VALUES('{id}', N'{username}', N'{password}', 'S')")
            self.cursor.execute(f"INSERT Student VALUES('{id}', N'{fullname}', N'{address}', '{gender[0]}', '{convert_to_date_iso8601(birthdate)}')")
        except pyodbc.IntegrityError as e:
            return "Can't have 2 students that have same id"
        self.conn.commit()
        return self.cursor.rowcount
    def update_one_student(self, args):
        id, fullname, address, gender, birthdate = args['id'], args['fullname'], args['address'], args['gender'], args['birthdate']
        try:
            self.cursor.execute(f"UPDATE Student SET fullname='{fullname}', address='{address}', gender='{gender[0]}', birthdate='{convert_to_date_iso8601(birthdate)}' WHERE id='{id}'")
        except pyodbc.IntegrityError as e:
            return "Update error"
        self.conn.commit()
        return self.cursor.rowcount
    def get_all_teachers(self):
        df = pd.read_sql("SELECT * FROM Teacher", self.conn)
        return [Teacher(*kwargs.values()) for kwargs in df.to_dict(orient = 'records')]
    def add_one_teacher(self, args):
        id, fullname, address, gender, birthdate, username, password, email, phonenumber, identitycardnumber, group_id = args['id'], args['fullname'], args['address'], args['gender'], args['birthdate'], args['username'], args['password'], args['email'], args['phonenumber'], args['identitycardnumber'], args['group_id']
        print(id, fullname, address, gender, birthdate, username, password, email, phonenumber, identitycardnumber, group_id)
        try:
            self.cursor.execute(f"INSERT [User] VALUES('{id}', N'{username}', N'{password}', 'T')")
            self.cursor.execute(f"INSERT Teacher VALUES('{id}', N'{fullname}', '{gender[0]}', '{email}', N'{address}', '{phonenumber}', '{identitycardnumber}', '{convert_to_date_iso8601(birthdate)}', '{group_id}')")
        except pyodbc.IntegrityError as e:
            return "Can't have 2 teachers that have same id"
        self.conn.commit()
        return self.cursor.rowcount
    def close(self):
        self.conn.close()

sql = SQLServer()