from flask import Flask, render_template, request, redirect, url_for
from sqlalchemy import create_engine
import pandas as pd
from urllib.parse import quote_plus

app = Flask(__name__)

DB_USER = 'root'
DB_PASS = 'Pavan@143'
DB_HOST = 'localhost'
DB_NAME = 'training'

encoded_password = quote_plus(DB_PASS)
engine = create_engine(f'mysql+pymysql://{DB_USER}:{encoded_password}@{DB_HOST}:3306/{DB_NAME}')

@app.route('/')
def home():
    return redirect(url_for('input_page'))

@app.route('/input',methods = ['GET', 'POST'])
def input_page():
    if request.method == 'POST':
        customer_id = request.form['customer_id']
        gender = request.form['gender']
        age = request.form['age']
        category = request.form['category']
        quantity = request.form['quantity']
        price = request.form['price']
        payment_method = request.form['payment_method']
        shopping_mall = request.form['shopping_mall']
        invoice_date = request.form['invoice_date']

        query = f"""
        INSERT INTO customer_shopping_data
        (customer_id,gender,age,category,quantity,price,payment_method,shopping_mall,invoice_date)
        VALUES
        ('{customer_id}', '{gender}', {age}, '{category}', {quantity}, {price}, '{payment_method}', '{shopping_mall}', '{invoice_date}');
        """

        with engine.connect as connection:
            connection.execute(query)

        return redirect(url_for('report page'))
    
    return render_template('input_page.html')

@app.route('/report')
def report_page():
    query = 'SELECT * FROM customer_shopping_data'
    df = pd.read_sql(query,engine)
    return render_template('report_page.html', table = df.to_html(classes = 'table-striped', index = False))

if __name__ == '__main__':
    app.run(debug = True)