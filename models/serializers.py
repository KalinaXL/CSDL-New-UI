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
    'birthdate': FormatDateTime
}

teacher_serializer = {
    'id': fields.String,
    'fullname': fields.String,
    'address': fields.String,
    'email': fields.String,
    'gender': FormatGender,
    'phonenumber': fields.String,
    'identity_card_id': fields.String,
    'group_id': fields.Integer,
    'birthdate': FormatDateTime
}