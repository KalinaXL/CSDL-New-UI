class Person:
    def __init__(self, id, fullname, address, gender, birthdate):
        self.id = id
        self.fullname = fullname
        self.address = address
        self.gender = gender
        self.birthdate = birthdate

class Student(Person):
    pass

class Teacher(Person):
    def __init__(self, id, fullname, gender, email, address, phonenumber, identitycardnumber, birthdate, group_id):
        super().__init__(id, fullname, address, gender, birthdate)
        self.email = email
        self.phonenumber = phonenumber
        self.identitycardnumber = identitycardnumber
        self.group_id = group_id

class Subject:
    def __init__(self, id, name, num_periods, syllabus, ratio_score_15, ratio_score_45, ratio_score_final, id_group):
        self.id = id
        self.name = name
        self.num_periods = num_periods
        self.syllabus = syllabus
        self.ratio_score_15 = ratio_score_15
        self.ratio_score_45 = ratio_score_45
        self.ratio_score_final = ratio_score_final
        self.id_group = id_group