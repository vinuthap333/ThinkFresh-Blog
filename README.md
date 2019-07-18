# ThinkFresh-Blog

This project is a blog which is built using Flask framework.

Front end : HTML, CSS, Javascript 
Back end : python 3 (Flask framework with jinja2 component)
Database : SQL 

# Flask

Flask is a lightweight WSGI web application framework.
Werkzeug and Jinja2 ,components of Flask framework are used in this project

## Installation

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install flask.

```bash
pip install -U Flask
```

## Usage

```python
from flask import Flask

app = Flask(__name__)
@app.route('/')
def hello_world():
    return 'Hello, World!'
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


