from flask import Flask, render_template, redirect, url_for
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

@app.route('/monthly_sales')
def home():
    return redirect(url_for('monthly_sales'))
    
    query = """
    SELECT 
        DATE_FORMAT(invoice_date, '%Y-%m') AS month,
        SUM(quantity * price) AS monthly_sales,
        SUM(SUM(quantity * price)) OVER (ORDER BY DATE_FORMAT(invoice_date, '%Y-%m')) AS cumulative_sales
    FROM 
        customer_shopping_data
    GROUP BY 
        month
    ORDER BY 
        month;
    """
    
    df = pd.read_sql(query, engine)
    return render_template('monthly_sales.html', table=df.to_html(classes='table table-striped', index=False))

if __name__ == '__main__':
    app.run(debug=True)
