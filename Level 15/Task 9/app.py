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

@app.route('/top_customers_by_category')
def top_customers_by_category():
    query = """
    SELECT 
        category,
        customer_id,
        SUM(quantity * price) AS total_sales
    FROM 
        customer_shopping_data
    GROUP BY 
        category, customer_id
    ORDER BY 
        category, total_sales DESC
    LIMIT 5;
    """
    
    df = pd.read_sql(query, engine)
    return render_template('top_customers_by_category.html', table=df.to_html(classes='table table-striped', index=False))

if __name__ == '__main__':
    app.run(debug=True)
