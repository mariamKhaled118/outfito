import requests

url = "http://127.0.0.1:8081/suitable_size"
data = {
    "weight": 70,
    "age": 25,
    "height": 175
}

response = requests.get(url, json=data)

print(response.json())
