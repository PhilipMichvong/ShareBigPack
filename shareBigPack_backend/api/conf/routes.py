from flask_restful import Api

from api.handlers import userHandlers as userH
from api.handlers import advertisementHandlers as advertisementH

def generate_routes(app):
    # Create API
    api = Api(app)

    # Setting up the endpoints
    # -- User Handler
    api.add_resource(userH.Login, '/login')

    api.add_resource(userH.Register, '/register')

    api.add_resource(userH.UsersManager, '/users')
    
    api.add_resource(advertisementH.AddAdvertisement, '/addAdvertisement')