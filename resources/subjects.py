from flask_restful import Resource, marshal_with, reqparse
from models import subject_serializer
from sql_server import sql
class SubjectListApi(Resource):
    @marshal_with(subject_serializer)
    def get(self):
        subjects = sql.get_all_subjects()
        if subjects:
            return subjects
        return {"error": "No subject"}, 404

class SubjectAddApi(Resource):
    def post(self):
        parser = reqparse.RequestParser()

        parser.add_argument('id', required = True, help = 'Please enter a id')
        parser.add_argument('name', required = True, help = 'Please enter name')
        parser.add_argument('num_periods', required = True, help = 'Please enter num_periods')
        parser.add_argument('syllabus', required = True, help = 'Please enter syllabus')
        parser.add_argument('ratio_score_15', required = True, help = 'Please enter ratio_score_15')
        parser.add_argument('ratio_score_45', required = True, help = 'Please enter ratio_score_45')
        parser.add_argument('ratio_score_final', required = True, help = 'Please enter ratio_score_final')
        parser.add_argument('id_group', required = True, help = 'Please enter id_group')
        args = parser.parse_args()
        result = sql.add_one_subject(args)
        if isinstance(result, int):
            return {"message": f"Add subject having id {args.id} successfully!"}
        return {"error": result + ' ' + args.id}, 401

class SubjectEditApi(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('id', required = True, help = 'Please enter a id')
        parser.add_argument('name', required = True, help = 'Please enter name')
        parser.add_argument('num_periods', required = True, help = 'Please enter num_periods')
        parser.add_argument('syllabus', required = True, help = 'Please enter syllabus')
        parser.add_argument('ratio_score_15', required = True, help = 'Please enter ratio_score_15')
        parser.add_argument('ratio_score_45', required = True, help = 'Please enter ratio_score_45')
        parser.add_argument('ratio_score_final', required = True, help = 'Please enter ratio_score_final')
        parser.add_argument('id_group', required = True, help = 'Please enter id_group')
        args = parser.parse_args()
        result = sql.update_one_subject(args)
        if isinstance(result, int):
            return {"message": f"Edit subject having id {args.id} successfully!"}
        return {"error": result + ' ' + args.id}, 401

class SubjectDeleteApi(Resource):
    def delete(self, id):
        rowcount = sql.delete_one_subject(id)
        if rowcount:
            return {"message": f"Delete subject having id {id} successfully!"}
        return {"error": "Can't delete subject having " + id}, 401