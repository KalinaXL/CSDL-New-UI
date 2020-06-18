from flask_restful import Resource, marshal_with
from models import teacher_serializer
from sql_server import sql
class TeacherListApi(Resource):
    @marshal_with(teacher_serializer)
    def get(self):
        teachers = sql.get_all_teachers()
        if teachers:
            return teachers
        return {"error": "No students"}, 404