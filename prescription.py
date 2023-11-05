from PyPDF2 import PdfReader
import pandas as pd
import requests
import csv

reader = PdfReader('pres.pdf')

print(len(reader.pages))

page = reader.pages[0]

text = page.extract_text().lower()
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
            return csv_rows
        else:
            return "Failed to retrieve CSV data"

    except Exception as e:
        return "error"
# Load the medicine name database (med123.csv)
firebase_download_url = 'https://firebasestorage.googleapis.com/v0/b/medinfo-92ecd.appspot.com/o/med123%20-%20Copy.csv?alt=media&token=678a5234-dc13-460c-b1fb-736f9d94d79f'
            #df = pd.read_csv('med123.csv')
known_medicine_names = get_csv_data(firebase_download_url)
known_medicine_names = [name for name in known_medicine_names]

print(known_medicine_names)
# Convert the text to lowercase for case-insensitive matching
text = text.lower()

# Extracted medicine names
extracted_medicine_names = set()  # Use a set to avoid duplicates

# Iterate through each medicine name in the database
for row in known_medicine_names:
    # Convert the database medicine name to lowercase
    db_medicine_name = row['name'].lower()

    # Check if any word from the database medicine name is present in the text
    if any(word in text for word in db_medicine_name.split()):
        extracted_medicine_names.add(row['name'])

# Print the extracted medicine names
for name in extracted_medicine_names:
    print(f"Extracted Medicine Name: {name}")