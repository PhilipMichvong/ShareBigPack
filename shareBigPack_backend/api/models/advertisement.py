from flask import jsonify
from api.conf.config import FORMAT

class Advertisement:
    def __init__(self, title : str, shop : str, user : str, location : str, aid = None):
        self.aid = aid
        self.title = title
        self.user = user
        self.shop = shop
        self.location = location
        
    def get_json(self, json_obj = True):
        json_data = []
        content = {'aid': self.aid, 
                   'title': self.title,
                   'shop': self.shop,
                   'location': self.location,
                   'user': self.user}
        
        json_data.append(content)
        
        if json_obj:
            return jsonify(json_data)
        
        return content