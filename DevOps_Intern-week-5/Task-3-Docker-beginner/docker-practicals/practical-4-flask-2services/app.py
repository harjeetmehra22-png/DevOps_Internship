import requests
from flask import Flask

app = Flask(__name__)

@app.get("/")
def home():
    try:
        response = requests.get("http://message-service:6000/message")
        return f"Flask app received: {response.text}"
    except Exception as e:
        return f"Error: {e}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
