from flask_restful import Resource, marshal_with, reqparse
from models import teacher_serializer
from sql_server import sql
class TeacherListApi(Resource):
    @marshal_with(teacher_serializer)
    def get(self):
        teachers = sql.get_all_teachers()
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