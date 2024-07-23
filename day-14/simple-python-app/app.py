from flask import Flask, render_template_string

app = Flask(__name__)

@app.route('/')
def home():
    html_content = """
    <!DOCTYPE html>
    <html>
    <head>
        <title>Master The AWS Code Pipeline</title>
    </head>
    <body>
        <h1>Welcome to Learning Space</h1>
        <p>Successfully Completed the Build and Deployment of the code from AWS Code Pipeline</p>
    </body>
    </html>
    """
    return render_template_string(html_content)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
