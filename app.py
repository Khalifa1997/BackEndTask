from flask import Flask, render_template, request, redirect, url_for, session 
from flask_mysqldb import MySQL 
import MySQLdb.cursors 
import re 
app = Flask(__name__) 
  
  
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'password'
app.config['MYSQL_DB'] = 'BackEndTask'
  
  
mysql = MySQL(app) 
  
  
@app.route('/') 
@app.route('/get', methods=['GET'])
def get():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor) 
    cid =request.args.get('id')
    try:
        string = int(cid)
    except ValueError:
        return "Enter a valid ID", 400
    cursor.execute('SELECT * FROM customer where CID =%s',(cid))
    account = cursor.fetchone()
    if not account:
        return "User not found", 400
    
    return(account)

@app.route('/delete', methods=['POST'])
def delete():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor) 
    cid =request.args.get('id')
    
    try:
        string = int(cid)
    except ValueError:
        return "Enter a valid ID", 400
    cursor.execute('Select COUNT(*) from (SELECT * from customer WHERE CID=%s) AS T',(cid))
    if (cursor.fetchone()['COUNT(*)']==0):
        return "No corresponding Customer", 400

    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM customer WHERE CID = %s" % (cid))
    cur.connection.commit()    
    return("account")

@app.route('/add', methods=['POST'])
def add():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor) 
    name =request.args.get('name')

    if name.isalpha()==False:
        return "Enter only letters", 400
    cursor.execute('insert into customer (Name) values("%s")' % (str(name)))
    
    cursor.connection.commit()    
    return "Suceess",200