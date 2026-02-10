
# Keep the filename as app, otherwise the "--app" flag must be added when running the server, e.g. "flask --app <filename> run"
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"