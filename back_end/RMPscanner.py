import requests
from bs4 import BeautifulSoup
from tabulate import tabulate

data = []

def loadProfessorName(URL):
    page = requests.get(URL)
    soup = BeautifulSoup(page.content, "html.parser")
    name = soup.find("div", class_="NameTitle__Name-dowf0z-0 cfjPUG")

    name = [name.text.strip().split()[0], name.text.strip().split()[1]]
    return(name)

def loadProfessorScore(URL):
    page = requests.get(URL)
    soup = BeautifulSoup(page.content, "html.parser")
    score = soup.find("div", class_="RatingValue__Numerator-qw8sqy-2 liyUjw")

    return(score.text.strip())

def addToData(URL):
    name = loadProfessorName(URL)
    score = loadProfessorScore(URL)
    nameWithScore = name + [score]
    data.append(nameWithScore)

def convertToSQLInsert():
    pass

def convertToSQLUpdate():
    pass

addToData("https://www.ratemyprofessors.com/professor?tid=2519044") # Shuai Xu
addToData("https://www.ratemyprofessors.com/professor?tid=1658282") # Harold Connamacher
addToData("https://www.ratemyprofessors.com/professor?tid=2832423") # Dianne Foreback
addToData("https://www.ratemyprofessors.com/professor?tid=2354474") # Erman Ayday
addToData("https://www.ratemyprofessors.com/professor?tid=2425127") # An Wang
addToData("https://www.ratemyprofessors.com/professor?tid=16817")   # Vincenzo Liberatore
addToData("https://www.ratemyprofessors.com/professor?tid=2571392") # Orhan Ozguner

col_names = ["Firt Name", "Last Name", "RMP Score"]
print(tabulate(data, headers=col_names, tablefmt="fancy_grid"))