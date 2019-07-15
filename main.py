from flask import Flask,render_template,request,session,redirect,flash
from flask_sqlalchemy import SQLAlchemy
import os
import datetime
import json
from werkzeug import secure_filename
import math

project_root = os.path.dirname(__file__)
template_path = os.path.join(project_root, 'template/')
app = Flask(__name__, template_folder=template_path)
app.secret_key = "secret-key"

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

if params['local_server']:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)
app.config['UPLOAD_FOLDER'] = params['upload_location']

class Contacts(db.Model):
    """
    name ,email,phone_num,message,date
    """
    sno = db.Column(db.Integer , primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(12), nullable=False)
    phone_num = db.Column(db.String(120), nullable=False)
    message = db.Column(db.String(12),  nullable=False)
    date = db.Column(db.String(20), nullable=False)

class Posts(db.Model):
    """
    sno ,title,slug,content,date
    """
    sno = db.Column(db.Integer , primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    tagline = db.Column(db.String(20), nullable=False)
    slug = db.Column(db.String(12), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    img_file = db.Column(db.String(12), nullable=False)
    date = db.Column(db.String(20), nullable=False)


@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    print(type(posts))
    last = math.ceil(len(posts) / int(params['no_of_posts']))

    page = request.args.get('page')
    if not str(page).isnumeric():
        page = 1

    page = int(page)
    posts = posts[((page-1)*int(params['no_of_posts'])) : ((page-1)*int(params['no_of_posts']) + int(params['no_of_posts']))]

    if page == 1:
         prev = "#"
         next ="/?page=" + str(page + 1)

    elif page == last:
        prev = "/?page=" + str(page - 1)
        next = "#"

    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template('index.html', params=params, posts=posts ,prev=prev ,next=next)


@app.route("/about")
def about():
    return render_template('about.html',params=params)


@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/uploader" , methods= ['GET','POST'])
def uploader():
    if 'user' in session and session['user'] == params['admin_username']:
        if request.method == 'POST':
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'] , secure_filename(f.filename)))
            flash("File uploaded scucessfully","success")
            return redirect('/dashboard')

@app.route("/delete/<string:sno>" , methods= ['GET','POST'])
def delete(sno):
    if 'user' in session and session['user'] == params['admin_username']:
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
        flash("Post deleted sucessfully","success")
    return redirect('/dashboard')


@app.route("/edit/<string:sno>" , methods= ['GET','POST'])
def edit(sno):
    if 'user' in session and session['user'] == params['admin_username']:
        if request.method == 'POST':
            box_title = request.form.get('title')
            box_tagline = request.form.get('tagline')
            box_slug = request.form.get('slug')
            box_content = request.form.get('content')
            box_imgfile = request.form.get('img-file')
            date = datetime.datetime.now()
            if sno == '0':
              post = Posts(sno=sno,title=box_title , tagline=box_tagline , slug=box_slug , content=box_content, img_file=box_imgfile, date=date)
              db.session.add(post)
              db.session.commit()
              flash("Post added sucessfully", "success")


            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.tagline = box_tagline
                post.slug = box_slug
                post.content = box_content
                post.img_file = box_imgfile
                post.date = date
                db.session.commit()
                redirect('edit/'+sno)
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html',params=params ,post=post ,sno=sno)

@app.route("/dashboard" , methods=['GET','POST'])
def dashboard():
    if 'user' in session and session['user'] == params['admin_username']:
        posts = Posts.query.filter_by().all()
        return render_template('dashboard.html',params=params ,posts=posts)

    if request.method == 'POST':
        username = request.form.get('uname')
        password = request.form.get('pass')
        if username == params['admin_username'] and password == params['admin_password'] :
            session['user'] = username
            posts = Posts.query.filter_by().all()
            return render_template('dashboard.html', params=params ,posts=posts)

    return render_template('login.html',params=params)


@app.route("/post/<string:post_slug>",methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug = post_slug).first()
    return render_template('post.html',params=params ,post=post)

@app.route("/contact", methods = ['GET','POST'])
def contact():
    if(request.method == 'POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone_num = request.form.get('phone')
        mesg = request.form.get('message')
        entry = Contacts(name=name,email=email, phone_num=phone_num, message=mesg, date=str(datetime.datetime.now()))
        db.session.add(entry)
        db.session.commit()
        flash("Thanks for sumbitting your details , We will get back to you soon","success")

    return render_template('contact.html',params=params)

app.run(debug=True)