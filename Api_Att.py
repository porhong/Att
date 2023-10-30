import requests
import time
from faker import Faker
import os
fake = Faker()
# The API endpoint
count = 0
status = 200


def api(url, payload):
    global count, status
    while True:
        if status >= 200 and status < 300:
            # A get request to the API
            response = requests.post(url, payload)
            # Print the response
            status = response.status_code
            re_message = response.reason
            os.system('cls')
            count += 1
            print("Requested time : " + str(count))
            print(str(status) + " : " + re_message + " 🚀")
        else:
            print("Sleeping...😴")
            time.sleep(250)
            os.system('cls')
            status = 200


def data_gen():
    name = fake.name()
    phone = fake.phone_number()
    address = fake.address()
    message = fake.aba()
    item = fake.iban()
    link = fake.http_method()
    data_set = {
        "Name": name,
        "Phone": phone,
        "Address": address,
        "Message": message,
        "Item": item,
        "Link": link
    }
    return data_set


while True:
    if status >= 200 and status < 300:
        data = data_gen()
        payload_1 = {
            "name": data["Name"],
            "phone": data["Phone"],
            "address": data["Address"],
            "form_item1225": data["Item"],
            "form_item1226": data["Item"],
            "message": data["Message"]}

        url_1 = "https://api.ldpform.com/sendform"

        api(url_1, payload_1)
        # api(url_2, payload_2)
    else:
        print("Sleeping...🚀🚀🚀🚀🚀🚀🚀😴")
        time.sleep(250)
        os.system('cls')
        status = 200
