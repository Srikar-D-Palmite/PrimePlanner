from flask import Flask, request, jsonify, render_template
from PyPDF2 import PdfReader
import pandas as pd
import requests
import csv
import json

app = Flask(__name__)

@app.route('/')
def upload_file():
    return render_template('upload.html')

@app.route('/process', methods=['POST'])
def process_pdf():
    uploaded_file = request.files['pdf_file']

    reader = PdfReader(uploaded_file)
    page = reader.pages[0]
    text = page.extract_text().lower()
    text = add_space_after_single_numbers(text)

    firebase_download_url = 'https://firebasestorage.googleapis.com/v0/b/medinfo-92ecd.appspot.com/o/med123%20-%20Copy.csv?alt=media&token=678a5234-dc13-460c-b1fb-736f9d94d79f'
    #df = pd.read_csv('med123.csv')
    csv_data = get_csv_data(firebase_download_url)
    csv_data = csv_data.json
    # df = pd.read_json(known_medicine_names, encoding='latin-1')
    # #df=pd.read_json(known_medicine_names)
    #    # Convert the text to lowercase for case-insensitive matching
    text = text.lower()

    # # # Extracted medicine names
    extracted_medicine_names = set()  # Use a set to avoid duplicates
    med_names = []
    # # # Iterate through each medicine name in the database
    for item in csv_data:
        for item1 in item:
            item1 = item1.lower()
    # #     # Check if any word from the database medicine name is present in the text
        if item1 in text:
             extracted_medicine_names.add(item1)

    # # # Print the extracted medicine names
    for name in extracted_medicine_names:
        med_names.append(name)
        
    # return jsonify(med_names)
    return med_names
    # #return jsonify({"error": "PDF file not provided."})

def get_csv_data(firebase_download_url):
    try:
        # Retrieve CSV data from Firebase Cloud Storage
        response = requests.get(firebase_download_url)

        # Check if the request was successful
        if response.status_code == 200:
            csv_data = response.text

            # Process CSV data (example: parse CSV using the 'csv' module)
            csv_rows = []
            reader = csv.reader(csv_data.splitlines())
            for row in reader:
                csv_rows.append(row)

            # Return CSV data as JSON
            return jsonify(csv_rows)
        else:
            return "Failed to retrieve CSV data"

    except Exception as e:
        return jsonify({"error": str(e)})
    
def add_space_after_single_numbers(input_string):
    result = ""
    i = 0
    while i < len(input_string):
        if input_string[i].isdigit() and (i == 0 or not input_string[i - 1].isdigit()) and (i == len(input_string) - 1 or not input_string[i + 1].isdigit()):
            result += input_string[i] + " "
        else:
            result += input_string[i]
        i += 1
    return result

if __name__ == '_main_':
    app.run(debug=True)