
from faker import Faker
import Api_Att as att
fake = Faker()
url = "https://pos.pages.fm/api/v1/shops/20011032/orders?api_key=895c1a89448341c897a01fc0ebda286f&warehouse_id=UL2&pke_mkter=1003656760635129"
payload = {
    "bill_full_name": att.data["Name"],
    "bill_phone_number": att.data["Phone"],
    "shipping_address": att.data["Address"],
    "note": att.data["Message"],
    "link": att.data["Link"]
}

att.api(url, payload)
