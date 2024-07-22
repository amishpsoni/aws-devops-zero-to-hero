from flask import Flask, render_template_string

app = Flask(__name__)

@app.route('/')
def home():
    html_content = """
    <!DOCTYPE html>
    <html>
    <head>
        <title>Simple Flask Web Page</title>
    </head>
    <body>
        <h1>Welcome to My Simple Flask Web Page</h1>
        <p>This is a basic example of a web page served with Flask.</p>
    </body>
    </html>
    """
    return render_template_string(html_content)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
