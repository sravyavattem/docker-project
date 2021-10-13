import sys
from flask import render_template, Flask
from flask_cors import CORS
app = Flask(__name__)

CORS(app)


@app.route('/')
def hello():
    return render_template('index.html')

if __name__ == "__main__":
    app.run(debug=True)