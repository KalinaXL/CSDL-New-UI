import json
import pyodbc
import pandas as pd
import re
from models import Student, Teacher, Subject
from utils import convert_to_date_iso8601

with open("config.json", "r") as f:
    config = json.loads(f.read())
class SQLServer:
    pattern = '\[SQL Server\](.*) \(\d*\)'
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
        self.cursor.execute(f"DELETE [User] WHERE Id = {id}")
        self.conn.commit()
        return self.cursor.rowcount
    def add_one_student(self, args):
        id, fullname, address, gender, birthdate, username, password = args['id'], args['fullname'], args['address'], args['gender'], args['birthdate'], args['username'], args['password']
        try:
            self.cursor.execute(f"INSERT [User] VALUES('{id}', N'{username}', N'{password}', 'HS')")
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
    
    def get_all_teachers(self, q):
        df = pd.read_sql("SELECT * FROM Teacher " + q, self.conn)
        return [Teacher(*kwargs.values()) for kwargs in df.to_dict(orient = 'records')]
    
    def run_proc3_a(self, count, gender, sort_field):
        df = pd.read_sql("EXEC SP_GET_GROUP_WITH_NUMBER @count = "+str(count)+" , @gender = '"+gender+"', @ColumnName='"+sort_field+"'", self.conn)
        return df.to_dict(orient = 'records')
    
    def run_proc3_b(self, year_id):
        df = pd.read_sql("EXEC SP_GET_CLASS @id_year = '"+year_id+"'", self.conn)
        return df.to_dict(orient = 'records')
    
    def add_one_teacher(self, args):
        id, fullname, address, gender, birthdate, username, password, email, phonenumber, identitycardnumber, group_id = args['id'], args['fullname'], args['address'], args['gender'], args['birthdate'], args['username'], args['password'], args['email'], args['phonenumber'], args['identitycardnumber'], args['group_id']
        # print(id, fullname, address, gender, birthdate, username, password, email, phonenumber, identitycardnumber, group_id)
        try:
            self.cursor.execute(f"INSERT [User] VALUES('{id}', N'{username}', N'{password}', 'GV')")
            self.cursor.execute(f"EXEC insert_teacher @Id = '{id}', @Fullname = N'{fullname}', @Gender = '{gender}', @Email = '{email}', @Address = N'{address}', @Phonenumber = '{phonenumber}', @CardId = '{identitycardnumber}', @Birthdate = '{convert_to_date_iso8601(birthdate)}', @Group_id = '{group_id}'")
        except pyodbc.IntegrityError as e:
            self.conn.commit()
            return "Can't have 2 teachers that have same id"
        except pyodbc.ProgrammingError as e:
            self.conn.commit()
            msg = str(e)
            match = re.search(SQLServer.pattern, msg)
            if match:
                return match.group(1)
            return msg

        self.conn.commit()
        return self.cursor.rowcount
    
    def delete_one_teacher(self, id):
        try:
            self.cursor.execute(f"EXEC delete_teacher @Id ='{id}'")
        except pyodbc.ProgrammingError as e:
            self.conn.commit()
            msg = str(e)
            match = re.search(SQLServer.pattern, msg)
            if match:
                return match.group(1)
            return msg
        except pyodbc.IntegrityError as e:
            self.conn.commit()
            return str(e)
        self.conn.commit()
        return self.cursor.rowcount
    
    def update_one_teacher(self, args):
        id, fullname, address, gender, birthdate, email, phonenumber, identitycardnumber, group_id = args['id'], args['fullname'], args['address'], args['gender'], args['birthdate'], args['email'], args['phonenumber'], args['identitycardnumber'], args['group_id']
        # print( birthdate, email, phonenumber, identitycardnumber, group_id)
        try:
            self.cursor.execute(f"EXEC update_teacher @Id = '{id}', @Fullname = N'{fullname}', @Gender = '{gender}', @Email = '{email}', @Address = N'{address}', @Phonenumber = '{phonenumber}', @CardId = '{identitycardnumber}', @Birthdate = '{convert_to_date_iso8601(birthdate)}', @Group_id = '{group_id}'")
        except pyodbc.IntegrityError as e:
            self.conn.commit()
            return str(e)
        except pyodbc.ProgrammingError as e:
            self.conn.commit()
            msg = str(e)
            match = re.search(SQLServer.pattern, msg)
            print(msg)
            if match:
                return match.group(1)
            return msg
        self.conn.commit()
        return self.cursor.rowcount
    
    def get_all_subjects(self):
        df = pd.read_sql("SELECT * FROM Subject", self.conn)
        return [Subject(*kwargs.values()) for kwargs in df.to_dict(orient = 'records')]

    def add_one_subject(self, args):
        id, name, num_periods, syllabus, ratio_score_15, ratio_score_45, ratio_score_final, id_group = args['id'], args['name'], args['num_periods'], args['syllabus'], args['ratio_score_15'], args['ratio_score_45'], args['ratio_score_final'], args['id_group']
        print(id, name, num_periods, syllabus, ratio_score_15, ratio_score_45, ratio_score_final, id_group)
        try:
            self.cursor.execute(f"INSERT Subject VALUES('{id}', N'{name}', {num_periods}, '{syllabus}', {ratio_score_15}, {ratio_score_45}, {ratio_score_final}, {id_group})")
        except pyodbc.IntegrityError as e:
            self.conn.commit()
            return "Can't have 2 subjects that have same id"
        self.conn.commit()
        return self.cursor.rowcount
    
    def delete_one_subject(self, id):
        self.cursor.execute(f"DELETE Subject WHERE Id = {id}")
        self.conn.commit()
        return self.cursor.rowcount
    
    def update_one_subject(self, args):
        id, name, num_periods, syllabus, ratio_score_15, ratio_score_45, ratio_score_final, id_group = args['id'], args['name'], args['num_periods'], args['syllabus'], args['ratio_score_15'], args['ratio_score_45'], args['ratio_score_final'], args['id_group']
        # print( birthdate, email, phonenumber, identitycardnumber, group_id)
        try:
            self.cursor.execute(f"UPDATE Subject SET name='{name}', num_periods='{num_periods}', syllabus='{syllabus}', ratio_score_15='{ratio_score_15}', ratio_score_45='{ratio_score_45}', ratio_score_final='{ratio_score_final}', id_group='{id_group}'   WHERE id='{id}'")
        except pyodbc.IntegrityError as e:
            self.conn.commit()
            return "Update error"
        self.conn.commit()
        return self.cursor.rowcount

    def close(self):
        self.conn.close()

sql = SQLServer()