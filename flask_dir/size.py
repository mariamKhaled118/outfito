import pandas as pd
import _thread
import json
import warnings

warnings.simplefilter("ignore")

df = pd.read_csv("C:/Users/Mariam/Untitled Folder/graduation/New folder/data/final_test.csv")

print(df.head())

# Filling the missing values with the median
df['age'] = df['age'].fillna(df['age'].median())
df['height'] = df['height'].fillna(df['height'].median())

print(df.isna().sum())

print(df["size"].value_counts())
size_mapping = {'XXS': 1, 'S': 2, "M": 3, "L": 4, "XL": 5, "XXL": 6, "XXXL": 7}

df['size'] = df['size'].map(size_mapping)

X = df.drop("size", axis=1)
Y = df["size"]

from sklearn.ensemble import RandomForestClassifier

model = RandomForestClassifier()
model.fit(X, Y)
from flask import Flask, request, jsonify

app = Flask(__name__)

size_mapping = {'XXS': 1, 'S': 2, "M": 3, "L": 4, "XL": 5, "XXL": 6, "XXXL": 7}

@app.route('/suitable_size', methods=['GET'])
def predict_size():
    try:
        weight = float(request.args.get("weight"))
        age = float(request.args.get("age"))
        height = float(request.args.get("height"))

        input_features = [[weight, age, height]]  # Create a list of lists or a 2D array

        # Make predictions using the trained model
        predicted_value = model.predict(input_features)

        rounded_predicted_value = int(round(predicted_value[0]))

        # Map the rounded value to the corresponding size from the dictionary
        predicted_size = [key for key, value in size_mapping.items() if value == rounded_predicted_value]

        if predicted_size:
            return jsonify({'predicted_size': predicted_size[0]})
        else:
            return jsonify({'message': 'No corresponding size found for the prediction.'}), 404

    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)

