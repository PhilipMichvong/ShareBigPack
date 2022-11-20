#
# GAUSS MNK 
#

import random
import math

# Potrzebuje: importowania z pliku xlsx, generowania rownan do worda oraz tabelki z calym tym shitem :)

a = 0
b = 0
sigma_a = 0
sigma_b = 0
arguments = []
values = []

def generateTestingData(upRange):
    global arguments
    for i in range(1,upRange):
        arguments.append(i)
    global values
    for i in range(1,upRange):
        values.append(random.randint(400,500))

def printTestingFunction():
    for i in range(1, arguments.__len__()):
        print ("X = "+str(arguments[i])+" Y = "+str(values[i]))

def generateRegressionLine():
    sumOfArguments = 0
    sumOfValues = 0
    sumOfArgumentsMulValues = 0
    sumfOfArgumentsKwadrat = 0
    sumOfValuesKwadrat = 0 
    for i in range(1, values.__len__()):
        sumOfArguments += arguments[i]
        sumOfValues += values[i]
        sumOfArgumentsMulValues += arguments[i]*values[i]
        sumfOfArgumentsKwadrat += arguments[i]*arguments[i]
        sumOfValuesKwadrat += values[i]*values[i]    
    global a
    a = ((sumOfArguments*sumOfValues) - (values.__len__()*sumOfArgumentsMulValues))/((sumOfArguments*sumOfArguments)-values.__len__()*sumfOfArgumentsKwadrat)
    global b
    b = (sumOfValues-a*sumOfArguments)/values.__len__()
    global sigma_a
    sigma_a = math.sqrt((values.__len__()/(values.__len__()-2))*((sumOfValuesKwadrat-(a*sumOfArgumentsMulValues)-(b*sumOfValues)))/(values.__len__()*sumfOfArgumentsKwadrat-(sumOfArguments*sumOfArguments)))
    global sigma_b
    sigma_b = sigma_a*math.sqrt(sumOfArguments/values.__len__())
    print("f(x) = "+str(a)+"x + "+str(b))
    print("sigma_a = "+str(sigma_a))
    print("sigma_b = "+str(sigma_b))

def prognoseFutureValue(futureArgument):
    futureValueUpperRange = (a+sigma_a)*futureArgument+(b+sigma_b)
    futureValueDownRange = (a-sigma_a)*futureArgument+(b-sigma_b)
    print("Dla chwili x = "+str(futureArgument)+" wartosc zawrze sie w przedziale od: "+str(futureValueDownRange)+" do "+str(futureValueUpperRange))

#generateTestingData(100)
#generateRegressionLine()
#prognoseFutureValue(112)

#
# Znajdywanie sklepów w poblizu + znajdywanie uzytkownikow w poblizu:
#

API_KEY = 'AIzaSyB9sTjt5fRCkGaNgrM6TjgAZHZChYPCpDo'
map_client = googlemaps.Client(API_KEY)
# address to zmienna ktora poda sprzegiel i od tego nam szuka
address = 'Kaliskiego 17'
geocode = map_client.geocode(address=address)
(lat, lng) = map(geocode[0]['geometry']['location'].get, ('lat', 'lng'))
search_string = 'supermarket'  # Czego szuka
buisness_list = []

response = map_client.places_nearby(
    location=(lat, lng),
    keyword=search_string,
    rank_by='distance'
)
buisness_list.extend(response.get('results'))
print(buisness_list)
dataFrame = " "
try:
    dataFrame = pd.DataFrame(buisness_list)
except:
    print("Nie znaleziono nic,bledinie podane dane")

closeShopInfo = {}
counter = 0
try:
    for shopAddress in dataFrame['vicinity']:

        distance = map_client.distance_matrix(address, shopAddress)['rows'][0]['elements'][0]
        closeShopInfo[counter] = {
            "Address": shopAddress,
            "Distance": distance['distance']['text']}
        counter += 1
        if counter == 5:
            break

    counter = 0
    for shopName in dataFrame['name']:

        name = {"Name": shopName}
        closeShopInfo[counter].update(name)
        counter += 1
        if counter == 5:
            break
    counter = 0
    for shopRating in dataFrame['rating']:
        rating = {"Rating": shopRating}
        closeShopInfo[counter].update(rating)
        counter += 1
        if counter == 5:
            break
    counter = 0

    for starSet in closeShopInfo:

        stars = closeShopInfo[counter]['Rating']
        final = int(stars)
        g = stars-final
        print(g)
        if g >= 0.5:
            final += 1
        print(final)
        starsToAdd = {'Stars': final}
        closeShopInfo[counter].update(starsToAdd)
        counter += 1
        if counter == 5:
            break
    print(closeShopInfo)

except:
    print("Blednie podane dane")

#
# OCR
#

path_to_tesseract = r'C:\Program Files\Tesseract-OCR\tesseract.exe'
# Define path to image
path_to_image = 'C:\\Users\\macie\\Desktop\\python test\\test6.png'
# Point tessaract_cmd to tessaract.exe
pytesseract.tesseract_cmd = path_to_tesseract
# Open image with PIL
img = Image.open(path_to_image)
# Extract text from image
text = pytesseract.image_to_string(img, config='psm --13')
fullText = text.split(" ")
productToFind = input("Podaj produkt do znalezienia")
lineCounter = 0
for singleLine in fullText:
    ##Poruszamy sie po slowach i szukamy produktu który wybralismy
    if productToFind.lower() in singleLine.lower():

        for singleWord in range(lineCounter + 1, lineCounter + 10):
            # Jezeli znalezeiony produkt to sprawdzamy nastepne 10 w poszukiwaniu końca linii
            if "\n" in fullText[singleWord]:
                # Znaleziony koniec linii
                #print(fullText[singleWord])
                try:
                    # Próba znalezienia cena rozdzielonej przecinkiem
                    priceOfProduct = re.findall("\d+\,\d+", fullText[singleWord])
                    unity = re.findall("\d+", priceOfProduct[0])
                    print(unity)

                    try:
                        price = int(unity[0])+(0.01*int(unity[1]))
                        price = round(price, 2)
                        print(price)
                        print(price*2)
                    except:
                        print("dupa")
                    break
                except:
                    print("Blad odczytu zdjecia")

    lineCounter = lineCounter + 1