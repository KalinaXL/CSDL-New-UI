from flask_restful import fields

class FormatDateTime(fields.String):
    def format(self, value):
        return '/'.join(super().format(value).split('-')[::-1])
class FormatGender(fields.String):
    def format(self, value):
        return 'Male' if super().format(value).upper() == 'M' else 'Female'

student_serializer = {
    'id': fields.String,
    'fullname': fields.String,
    'address': fields.String,
    'gender': FormatGender,
    'birthdate': FormatDateTime,
    'username' : fields.String,
    'password' : fields.String
}

teacher_serializer = {
    'id': fields.String,
    'fullname': fields.String,
    'gender': FormatGender,
    'email': fields.String,
    'address': fields.String,
    'phonenumber': fields.String,
    'identitycardnumber': fields.String,
    'birthdate': FormatDateTime,
    'group_id': fields.Integer,
    'username' : fields.String,
    'password' : fields.String
}

subject_serializer = {
    'id': fields.String,
    'name': fields.String,
    'num_periods': fields.Integer,
    'syllabus': fields.String,
    'ratio_score_15': fields.Integer,
    'ratio_score_45': fields.Integer,
    'ratio_score_final': fields.Integer,
    'id_group': fields.Integer
}