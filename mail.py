import requests
from requests.exceptions import ConnectionError
import time

def send_simple_message(subject, text):
    return requests.post(
        "https://api.mailgun.net/v3/addxy.com/messages",
        auth=("api", "key-f3ba6afcd07a8f35e5061f625ecba051"),
        data={"from": "Denis Carriere <info@addxy.com>",
              "to": ["Denis Carriere <carriere.denis@gmail.com>, Eddie Connell <Ewclighting@aol.com>, thevillagesgps@gmail.com"],
              "subject": subject,
              "text": text})

def graphhopper_url(lat1, lng1, lat2, lng2):
    return 'http://52.5.34.35:8888/route?'\
        'point={0},{1}&point={2},{3}'\
        '&vehicle=bike&type=json'\
        '&points_encoded=false'.format(lat1, lng1, lat2, lng2)


if __name__ == '__main__':
    ok = True
    while True:
        try:
            r = requests.get(graphhopper_url(28.969, -81.992, 28.969, -81.995))
            if not ok:
                text = 'Congrats! The Graphhopper API for TheVillages is now fixed.'
                print 'Fixed: TheVillages Graphhopper API'
                send_simple_message('Fixed: TheVillages Graphhopper API', text)
                ok = True
            time.sleep(15)

        except ConnectionError:
            if ok:
                text = 'Unfortunately the Graphhopper API for TheVillages is not working properly.'
                print 'Broken: TheVillages Graphhopper API'
                send_simple_message('Broken: TheVillages Graphhopper API', text)
                ok = False
            time.sleep(5)