import requests
import json
import os
from functools import wraps
from flask import Flask, request, render_template, redirect, url_for, session, flash
from flask_restful import Api
from resources import *
from utils import is_name, is_email, is_phone_number, is_valid_date
from sql_server import sql

with open("config.json", "r") as f:
    config = json.loads(f.read())
app_config = config['app']
path = config['path'] + app_config['prefix_api']
port = int(os.environ.get("PORT", 5000))

def login_required(f):
    @wraps(f)
    def wrapper(*args, **kwargs):
        if 'logged_in' in session and session['logged_in']:
            return f(*args, **kwargs)
        else:
            return redirect(url_for('login'))
    return wrapper

app = Flask(__name__)
app.secret_key = app_config['secret_key']
api = Api(app = app, prefix = app_config['prefix_api'])
api.add_resource(UserLogin, "/auth/login")
api.add_resource(StudentListApi, '/students')
api.add_resource(StudentApi, '/students/<string:id>' )
api.add_resource(TeacherListApi, '/teachers')
api.add_resource(StudentEditApi, '/students/edit')
api.add_resource(TeacherAddApi, '/teachers/add')
api.add_resource(TeacherDeleteApi, '/teachers/<string:id>')
api.add_resource(TeacherEditApi, '/teachers/edit')
api.add_resource(SubjectListApi, '/subjects')
api.add_resource(SubjectAddApi, '/subjects/add')
api.add_resource(SubjectDeleteApi, '/subjects/<string:id>')
api.add_resource(SubjectEditApi, '/subjects/edit')

@app.route('/', methods = ['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        user = {
            'username': request.form['username'],
            'password': request.form['password']
        }
        response = requests.post(f'{path}/auth/login', data = user)
        if response:
            session['logged_in'] = True
            return redirect(url_for("dashboard"))
        else:
            error = response.json()['error']
    return render_template('login.html', title = 'Login', error = error)


@app.route('/dashboard', methods = ['GET'])
@login_required
def dashboard():
    count = request.args.get('count')
    gender = request.args.get('gender')
    year_id = request.args.get('year_id')
    data = []
    if (count and gender):
        data = sql.run_proc3_a(count, gender)
    proc2 = []
    if (year_id):
        proc2 = sql.run_proc3_b(year_id)
    return render_template("dashboard.html", teachers=data, fitter_gender=gender, fitter_count=count,fitter_year=year_id, proc2s=proc2)

@app.route('/chart')
def chart():
    return render_template('chart.html')

@app.route('/table/student')
def table():
    response = requests.get(f'{path}/students')
    if response:
        students = response.json()
    else:
        students = []
    return render_template('table-student.html', students=students)

@app.route('/table')
@app.route('/table/teacher')
def table_teacher():
    query_string = str(request.query_string)[2:-1]
    response = requests.get(f'{path}/teachers?'+query_string)
    if response:
        teachers = response.json()
    else:
        teachers = []
    return render_template('table-teacher.html', teachers=teachers)

@app.route('/table/subject')
def table_subject():
    response = requests.get(f'{path}/subjects')
    if response:
        subjects = response.json()
    else:
        subjects = []
    return render_template('table-subject.html', subjects=subjects)

@app.route('/form')
def form():
    return render_template('form.html')

@app.route('/logout')
@login_required
def logout():
    session['logged_in'] = False
    return redirect(url_for('login'))
@app.route('/add_student', methods = ['GET', 'POST'])
@login_required
def add_student():
    def is_valid_user(args):
        return is_name(args['fullname']) and args['gender'].upper() in ('MALE', 'FEMALE') and is_valid_date(args['birthdate'])
    if request.method == 'POST':
        if not is_valid_user(request.form):
            flash("Invalid input", 'error')
        else:
            response = requests.post(f'{path}/students', data = request.form)
            output = response.json()
            if 'error' in output:
                flash(output['error'], 'error')
            else:
                flash(output['message'], 'success')
        return redirect(url_for('table'))


@app.route('/edit_student',methods = ['POST'])
@login_required
def edit_student():
    def is_valid_user(args):
        return is_name(args['fullname']) and args['gender'].upper() in ('MALE', 'FEMALE') and is_valid_date(args['birthdate'])
    if not is_valid_user(request.form):
        flash("Invalid input", 'error')
    else:
        response = requests.post(f'{path}/students/edit', data = request.form)
        output = response.json()
        if 'error' in output:
            flash(output['error'], 'error')
        else:
            flash(output['message'], 'success')
    return redirect(url_for('table'))

@login_required
@app.route('/delete_student/<string:id>')
def delete_student(id):
    response = requests.delete(f'{path}/students/{id}')
    output = response.json()
    if 'error' in output:
        flash(output.get('error'), 'error')
    else:
        flash(output.get('message'), 'success')
    return redirect(url_for('table'))

@login_required
@app.route('/delete_teacher/<string:id>')
def delete_teacher(id):
    response = requests.delete(f'{path}/teachers/{id}')
    output = response.json()
    if 'error' in output:
        flash(output.get('error'), 'error')
    else:
        flash(output.get('message'), 'success')
    return redirect('/table/teacher')

@login_required
@app.route('/edit-teacher', methods = ['POST'])
def edit_teacher():
    if request.method == 'POST':
        response = requests.post(f'{path}/teachers/edit', data = request.form)
        output = response.json()
        if 'error' in output:
            flash(output['error'], 'error')
        else:
            flash(output['message'], 'success')
    return redirect('/table/teacher')

@login_required
@app.route('/add-teacher', methods = ['POST'])
def add_teacher():
    if request.method == 'POST':
        response = requests.post(f'{path}/teachers/add', data = request.form)
        output = response.json()
        if 'error' in output:
            flash(output['error'], 'error')
        else:
            flash(output['message'], 'success')
    return redirect('/table/teacher')

@login_required
@app.route('/delete_subject/<string:id>')
def delete_subject(id):
    response = requests.delete(f'{path}/subjects/{id}')
    output = response.json()
    if 'error' in output:
        flash(output.get('error'), 'error')
    else:
        flash(output.get('message'), 'success')
    return redirect('/table/subject')

@login_required
@app.route('/edit-subject', methods = ['POST'])
def edit_subject():
    if request.method == 'POST':
        response = requests.post(f'{path}/subjects/edit', data = request.form)
        output = response.json()
        if 'error' in output:
            flash(output['error'], 'error')
        else:
            flash(output['message'], 'success')
    return redirect('/table/subject')

@login_required
@app.route('/add-subject', methods = ['POST'])
def add_subject():
    if request.method == 'POST':
        response = requests.post(f'{path}/subjects/add', data = request.form)
        output = response.json()
        if 'error' in output:
            flash(output['error'], 'error')
        else:
            flash(output['message'], 'success')
    return redirect('/table/subject')


if __name__ == "__main__":
    app.run(debug = True, port = port)