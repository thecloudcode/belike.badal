from flask import Flask, request, jsonify
from lol import user_model

app = Flask(__name__)
obj = user_model()

@app.route("/user/getall", methods=["GET"])
def user_getall_controller():
    return obj.user_getall_model()

@app.route("/user/addone", methods=["POST"])
def user_addone_controller():
    return obj.user_addone_model(request.form)

if __name__ == "__main__":
    app.run(debug=True)
