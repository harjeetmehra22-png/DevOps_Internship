from flask import Flask
app = Flask(__name__)
@app.get("/message")
def message():
 return "Hello from the Message Service!"
if __name__ == "__main__":
 app.run(host="0.0.0.0", port=6000)
