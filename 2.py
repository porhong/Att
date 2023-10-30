from Api_Att import api, data_gen
import os
import time
from Api_Att import api
import pygetwindow
from faker import Faker
fake = Faker()
win = pygetwindow.getWindowsWithTitle('1')[0]
win.size = (215, 150)
status = 200

while True:
    if status >= 200 and status < 300:
        url = "https://api.ldpform.com/sendform"
        payload = {
            "name": data_gen()["Name"],
            "phone": data_gen()["Phone"],
            "address": data_gen()["Address"],
            "form_item1225": data_gen()["Item"],
            "form_item1226": data_gen()["Item"],
            "message": data_gen()["Message"]}
        status = api(url, payload, 2)
    else:
        print("Sleeping...😴")
        time.sleep(250)
        os.system('cls')
        status = 200
