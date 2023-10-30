import requests
import time
from faker import Faker
import os
fake = Faker()
# The API endpoint
count = 0
status = 200


def data_gen():
    name = fake.name()
    phone = fake.phone_number()
    address = fake.address()
    message = fake.aba()
    item = fake.iban()
    link = fake.hostname()
    data_set = {
        "Name": name,
        "Phone": phone,
        "Address": address,
        "Message": message,
        "Item": item,
        "Link": link
    }
    return data_set


def api(url, payload, att_name):
    global count, status, data
    # A get request to the API
    response = requests.post(url, payload)
    # Print the response
    status = response.status_code
    re_message = response.reason
    os.system('cls')
    count += 1
    print("Attcak : " + str(att_name))
    print("Requested time : " + str(count))
    print(str(status) + " : " + re_message + " 🚀")
    return status
