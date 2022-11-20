import bcrypt as bc
from flask import jsonify
from flask_mysqldb import MySQL

import api.models.user as mduser
import api.models.advertisement as mdadvertisement

# MySQL connection
def sql_connect(app):
    global mysql
    mysql = MySQL(app)

# -----------------------------------------------------------------------------
# DB Queries
# -- Users
#  * GET
def get_user_by_uuid(uuid : str):
    query = f'SELECT * FROM `shareBigPackUser` WHERE user_id="{uuid}"'
    with mysql.connection.cursor() as curr:
        curr.execute(query)
        rv = curr.fetchone()
    
    if not rv:
        return None
            
    user = mduser.User(uuid=rv[0], login=rv[1], password=rv[2], localization=rv[3], phone_number=rv[4])
    return user.get_json()

def get_user_by_login(login : str):
    query = f'SELECT * FROM `shareBigPackUser` WHERE user_name="{login}"'
    with mysql.connection.cursor() as curr:
        curr.execute(query)
        rv = curr.fetchone()
    
    if not rv:
        return None
    
    user = mduser.User(uuid=rv[0], login=rv[1], password=rv[2], localization=rv[3], phone_number=rv[4])
    return user.get_json()

def get_users():
    query = f'SELECT * FROM `shareBigPackUser`'
    with mysql.connection.cursor() as curr:
        curr.execute(query)
        rv = curr.fetchall()
    
    if not rv:
        return None

    users = []
    
    for result in rv:
        user = mduser.User(uuid=result[0], login=result[1], password=result[2], localization=result[3], phone_number=result[4] )
        users.append(user.get_json(json_obj=False))
    
    return jsonify(users)

#  * POST
def add_user(user : mduser.User):
    # Query
    sql = "INSERT INTO `shareBigPackUser` (`user_id`, `user_name`, `user_password`,`user_localization`, `user_phoneNumber`) VALUES (UUID(), %s, %s, %s, %s)"
    val = (user.login, user.password, user.localization, user.phone_number)
    
    # Execute query
    with mysql.connection.cursor() as curr:
        curr.execute(sql, val)
        mysql.connection.commit()
    
#  * PUT
def update_user(user : mduser.User):
    # Check if user exists
    existed_user = get_user_by_login(user.login)
    if existed_user is None:
        return False
    
    user.uuid = existed_user.json[0].get('uuid').strip()
    
    # Query
    sql = "UPDATE `users` SET `password` = %s, `role` = %s, `phone_number` = %s WHERE `users`.`uuid` = %s"
    val = (user.password, user.role, user.phone_number, user.uuid)
    
    # Execute query
    with mysql.connection.cursor() as curr:
        curr.execute(sql, val)
        mysql.connection.commit()

    return True

#  * DELETE
def delete_user(uuid : str):
    # Query
    query = f'DELETE FROM `users` WHERE `users`.`uuid` = "{uuid}"'
    
    # Execute query
    with mysql.connection.cursor() as curr:
        curr.execute(query)
        mysql.connection.commit()
        
# QUERIES - ADVERTISEMENTS
def add_advertisement(advertisement : mdadvertisement.Advertisement):
    # Query
    sql = "INSERT INTO `Advertisement` (`advertisement_id`, `advertisement_title`,`advertisement_user`, `advertisement_location`, `advertisement_shop`) VALUES (UUID(), %s, %s, %s, %s)"
    val = (advertisement.title, advertisement.user, advertisement.location, advertisement.shop)
    
    # Execute query
    with mysql.connection.cursor() as curr:
        curr.execute(sql, val)
        mysql.connection.commit()