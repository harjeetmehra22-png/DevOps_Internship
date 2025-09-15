from flask import Flask, jsonify

app = Flask(__name__)

@app.get("/")
def home():
    return "Hello Interns, Flask running in Docker!"

@app.get("/health")
def health():
    return jsonify(status="ok")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
