from faker import Faker
import Api_Att as att
fake = Faker()
payload = {
    "name": att.data["Name"],
    "phone": att.data["Phone"],
    "address": att.data["Address"],
    "form_item1225": att.data["Item"],
    "form_item1226": att.data["Item"],
    "message": att.data["Message"]}
url = "https://api.ldpform.com/sendform"

att.api(url, payload)
