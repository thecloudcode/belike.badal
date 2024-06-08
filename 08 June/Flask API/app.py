"""
Author : Akshaya & Yashwanth
Contributor : Badal Prasad Singh

This is a Flask API to add, delete, update and get data from Supabase Database of table : ecommerce
"""

from flask import Flask, request, jsonify
from supabase import create_client, Client
import os
from dotenv import load_dotenv

app = Flask(__name__)
load_dotenv()

url: str = os.environ.get("SUPABASE_URL")
key: str = os.environ.get("SUPABASE_KEY")
supabase: Client = create_client(url, key)


@app.route('/add_data_to_e_commerce', methods=['POST'])
def add_data_to_e_commerce():
    data = request.json
    try:
        response = supabase.table('ecommerce').insert(data).execute()
        return jsonify(response.data), 201
    except Exception as e:
        return jsonify({'error': str(e)}), 400


@app.route('/delete_data_from_e_commerce/<int:id>', methods=['DELETE'])
def delete_data_from_e_commerce(id):
    try:
        response = supabase.table('ecommerce').delete().eq('Id', id).execute()
        return jsonify(response.data), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 400

@app.route('/update_data_from_e_commerce/<int:id>', methods=['PUT'])
def update_data_from_e_commerce(id):
    data = request.json
    try:
        response = supabase.table('ecommerce').update(data).eq('Id', id).execute()
        return jsonify(response.data), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 400

@app.route('/get_data_from_e_commerce', methods=['GET'])
def get_data_from_e_commerce():
    try:
        response = supabase.table('ecommerce').select('*').execute()
        return jsonify(response.data), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 400


if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port, debug=True)