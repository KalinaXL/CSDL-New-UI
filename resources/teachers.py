from flask_restful import Resource, marshal_with, reqparse
from flask import request
from models import teacher_serializer
from sql_server import sql
from utils import convert_to_date_iso8601
class TeacherListApi(Resource):
    @marshal_with(teacher_serializer)
    def get(self):
        filter = request.args.get('fitter')
        queryString = ' Where 1=1'
        if(filter):
            id = request.args.get('id')
            fullname = request.args.get('fullname')
            gender = request.args.get('gender')
            email = request.args.get('email')
            address = request.args.get('address')
            phonenumber = request.args.get('phonenumber')
            identitycardnumber = request.args.get('identitycardnumber')
            birthdate1 = request.args.get('birthdate1')
            birthdate2 = request.args.get('birthdate2')
            group_id = request.args.get('group_id')
            if(id): queryString += ' AND id LIKE \'%'+ id +'%\''
            if(fullname): queryString += ' AND fullname LIKE \'%'+ fullname +'%\''
            if(gender): queryString += ' AND gender = \''+ gender[0] +'\''
            if(email): queryString += ' AND email LIKE \'%'+ email +'%\''
            if(address): queryString += ' AND address LIKE \'%'+ address +'\'%'
            if(phonenumber): queryString += ' AND phonenumber LIKE \'%'+ phonenumber +'%\''
            if(identitycardnumber): queryString += ' AND identitycardnumber LIKE \'%'+ identitycardnumber +'%\''
            if(birthdate1): queryString += ' AND Birthdate >= \''+ convert_to_date_iso8601(birthdate1) + '\''
            if(birthdate2): queryString += ' AND Birthdate <= \''+ convert_to_date_iso8601(birthdate2) + '\''
            if(group_id): queryString += ' AND group_id = '+ group_id
            
        teachers = sql.get_all_teachers(queryString)
        if teachers:
            return teachers
        return {"error": "No teachers"}, 404

class TeacherAddApi(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('id', required = True, help = 'Please enter a id')
        parser.add_argument('fullname', required = True, help = 'Please enter fullname')
        parser.add_argument('gender', required = True, help = 'Please enter gender')
        parser.add_argument('email', required = True, help = 'Please enter an email')
        parser.add_argument('address', required = True, help = 'Please enter an address')
        parser.add_argument('phonenumber', required = True, help = 'Please enter phonenumber')
        parser.add_argument('identitycardnumber', required = True, help = 'Please enter identitycardnumber')
        parser.add_argument('birthdate', required = True, help = 'Please enter birthdate')
        parser.add_argument('group_id', required = True, help = 'Please enter groud id')
        parser.add_argument('username', required = True, help = 'Please enter username')
        parser.add_argument('password', required = True, help = 'Please enter password')
        args = parser.parse_args()
        result = sql.add_one_teacher(args)
        if isinstance(result, int):
            return {"message": f"Add teacher having id {args.id} successfully!"}
        return {"error": result + ' ' + args.id}, 401

class TeacherEditApi(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('id', required = True, help = 'Please enter a id')
        parser.add_argument('fullname', required = True, help = 'Please enter fullname')
        parser.add_argument('gender', required = True, help = 'Please enter gender')
        parser.add_argument('email', required = True, help = 'Please enter an email')
        parser.add_argument('address', required = True, help = 'Please enter an address')
        parser.add_argument('phonenumber', required = True, help = 'Please enter phonenumber')
        parser.add_argument('identitycardnumber', required = True, help = 'Please enter identitycardnumber')
        parser.add_argument('birthdate', required = True, help = 'Please enter birthdate')
        parser.add_argument('group_id', required = True, help = 'Please enter groud id')
        args = parser.parse_args()
        result = sql.update_one_teacher(args)
        if isinstance(result, int):
            return {"message": f"Edit teacher having id {args.id} successfully!"}
        return {"error": result + ' ' + args.id}, 401

class TeacherDeleteApi(Resource):
    def delete(self, id):
        rowcount = sql.delete_one_teacher(id)
        if rowcount:
            return {"message": f"Delete teacher having id {id} successfully!"}
        return {"error": "Can't delete teacher having " + id}, 401