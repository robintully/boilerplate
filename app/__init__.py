__version__ = '0.1.0'

from flask import Flask

def create_app():
    app = Flask(__name__)
    
    @app.route("/")
    def index():
        return "Hello changed World!"

    return app