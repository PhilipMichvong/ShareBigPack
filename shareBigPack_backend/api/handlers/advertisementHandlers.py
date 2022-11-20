from flask import jsonify, request, Response
from flask_restful import Resource
import re
import json

import api.database.db as db
import api.codes.errors as errors
import api.models.advertisement as mdadvertisement

# @app.post('/advertisements)
class AddAdvertisement(Resource):
    @staticmethod
    def post():
        try:
            # Get advertisements credentials
            title = request.json.get('title').strip()
            shop = request.json.get('shop').strip()
            user = request.json.get('user').strip()
            location = request.json.get('location').strip()
        except Exception as why:
            print(why)
            return errors.INVALID_INPUT_422
        
        advertisement = mdadvertisement.Advertisement(title, shop, user, location)
        db.add_advertisement(advertisement)