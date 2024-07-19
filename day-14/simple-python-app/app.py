from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    names = ["Amish","Ram","Harish","Abhishek"]
    for name in names:
        if name == "Amish":
            print("Hello :" + name)
            

    return 'Hello, world!'

if __name__ == '__main__':
    app.run()
