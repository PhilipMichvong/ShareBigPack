from flask import jsonify, request, Response
from flask_restful import Resource
import re
import json

import api.database.db as db
import api.codes.errors as errors
import api.models.user as mduser

# @app.post('/login')
class Login(Resource):    
    @staticmethod
    def post():
        try:
            # Get user credentials
            login = request.json.get('login').strip()
            password = request.json.get('password').strip()
        except Exception as why:
            print(why)
            return errors.INVALID_INPUT_422

        # Check if any param is none
        if login is None or password is None:
            return errors.INVALID_INPUT_422

        # Get user if it is existed
        user = db.get_user_by_login(login)

        # Check if user is not existed
        if user is None:
            return errors.UNAUTHORIZED

        hashed_password = user.json[0].get('password').strip()
    
        # Check if password is valid
        if not mduser.User.check_passwd(password=password, hashed_password=hashed_password):
            return errors.UNAUTHORIZED

        try:
            res = "Success"
            response = Response(res, status=200,)
            response.headers.set('Access-Control-Allow-Origin', '*')
            response.headers.set('Access-Control-Allow-Headers', 'Content-Type,Authorization')
            response.headers.set('Access-Control-Allow-Methods', 'GET, PUT, POST, DELETE, OPTIONS')
            return response
        except Exception as e:
            response = {"status":"Fail", "message":str(e)}
            return json.dumps(response)

# @app.route('/register')
class Register(Resource):
    
    @staticmethod
    def _validate_phone_number(phone_number : str) -> bool:
        pattern = r"^\+[0-9]{11}$"
        
        if re.match(pattern, phone_number):
            return True

        return False
        
    
    @staticmethod
    def post():
        try:
            # Get user data
            login, password, localization, phone_number = (
                request.json.get('login').strip(),
                request.json.get('password').strip(),
                request.json.get('localization').strip(),
                request.json.get('phone_number').strip(),
            )
        except Exception as why:
            return errors.INVALID_INPUT_422
        
        # Check if any field is none
        if login is None or password is None or localization is None or phone_number is None:
            return errors.INVALID_INPUT_422
        
        # Check if `role` and `phone_number` are valid
        valid_phone_number = Register._validate_phone_number(phone_number)
        
        if not valid_phone_number:
            return errors.INVALID_INPUT_422
        
        # Get user if it is existed
        user = db.get_user_by_login(login)

        # Check if user exists
        if user is not None:
            return errors.ALREADY_EXIST
        
        # Create a new user
        user = mduser.User(login, mduser.User.hash_passwd(password), localization, phone_number)

        # Add new user to database
        db.add_user(user)

        return jsonify({
            'Message' : 'Registration completed.'
        })


# @app.route('/users')
class UsersManager(Resource):
    @staticmethod
    def get():
        # Check if there is `uuid` param
        try: uuid = request.json.get('uuid').strip()
        except Exception as _: uuid = None

        if not uuid:
            # Check if there is `login` param
            try: login = request.json.get('login').strip()
            except Exception as _: login = None
            
            if not login:
                
                # Get all users
                users = db.get_users()
                return users

            # Get user by login
            user = db.get_user_by_login(login)
        
            # If user does not exists
            if user is None:
                return errors.NOT_FOUND_404
            else:
                return user

        # Get user by uuidcd d:
        user = db.get_user_by_uuid(uuid)
        
        # If user does not exists
        if user is None:
            return errors.NOT_FOUND_404
        else:
            return user
        
    @staticmethod
    def put():
        try:
            # Get user data
            login, password, role, phone_number = (
                request.json.get('login').strip(),
                request.json.get('password').strip(),
                request.json.get('role').strip(),
                request.json.get('phone_number').strip(),
            )
        except Exception as why:
            return errors.INVALID_INPUT_422
        
        # Check if any field is none
        if login is None or password is None or role is None or phone_number is None:
            return errors.INVALID_INPUT_422
        
        # Check if `role` and `phone_number` are valid
        valid_role, role = Register._validate_role(role)
        valid_phone_number = Register._validate_phone_number(phone_number)
        
        if not valid_role or not valid_phone_number:
            return errors.INVALID_INPUT_422

        # Create a new user instance
        user = mduser.User(login, mduser.User.hash_passwd(password), role, phone_number)

        # Update user data
        if db.update_user(user):
            return jsonify({
                'Message' : 'User data updated.'
            })
        
        return errors.NOT_FOUND_404
    
    @staticmethod
    def delete():
        try:
            # Get user credentials
            login = request.json.get('login').strip()
        except Exception as why:
            return errors.INVALID_INPUT_422

        # Check if any param is none
        if login is None:
            return errors.INVALID_INPUT_422

        # Get user if it is existed
        user = db.get_user_by_login(login)

        # Check if user is not existed
        if user is None:
            return errors.NOT_FOUND_404

        uuid = user.json[0].get('uuid').strip()
        
        db.delete_user(uuid)
        
        return jsonify({
            'Message' : 'User deleted.'
        })