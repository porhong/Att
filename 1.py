
import pygetwindow
import time
from faker import Faker
import os
from Api_Att import api, data_gen
fake = Faker()
win = pygetwindow.getWindowsWithTitle('1')[0]
win.size = (215, 150)
status = 200

while True:
    if status >= 200 and status < 300:
        url = "https://pos.pages.fm/api/v1/shops/20011032/orders?api_key=895c1a89448341c897a01fc0ebda286f&warehouse_id=UL2&pke_mkter=1003656760635129"
        payload = {
            "bill_full_name": data_gen()["Name"],
            "bill_phone_number": data_gen()["Phone"],
            "shipping_address": data_gen()["Address"],
            "note": data_gen()["Message"],
            "link": data_gen()["Link"]}
        status = api(url, payload, 1)
    else:
        print("Sleeping...😴")
        time.sleep(250)
        os.system('cls')
        status = 200
