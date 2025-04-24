from flask import Flask, render_template
from sqlalchemy import create_engine, text
import pandas as pd
import plotly.express as px
import plotly.io as pio
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
    return render_template('home.html')

@app.route('/dashboard')
def dashboard():
    query = """
    SELECT 
        DATE_FORMAT(invoice_date, '%y-%m') AS month,
        COUNT(DISTINCT customer_id) AS num_customers
    FROM 
        customer_shopping_data
    GROUP BY 
        month
    ORDER BY 
        month;
    """
    
    with engine.connect() as connection:
        df = pd.read_sql(text(query), connection)

    fig = px.bar(df, x='month', y='num_customers', 
                 labels={'month': 'Month', 'num_customers': 'Number of Customers'},
                 title="Number of Customers Over the Months")
    
    graph_html = pio.to_html(fig, full_html=False)
    
    return render_template('dashboard.html', graph_html=graph_html)

if __name__ == '__main__':
    app.run(debug=True)
