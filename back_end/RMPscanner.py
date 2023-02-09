import requests
from bs4 import BeautifulSoup
from tabulate import tabulate


data = []


def loadProfessorName(URL, parsedPage):
    fullName = parsedPage.find("div", class_="NameTitle__Name-dowf0z-0 cfjPUG")
    try:
        firstName = fullName.text.strip().split()[0] + " " + fullName.text.strip().split()[1]
        lastName = fullName.text.strip().split()[2]
    except:
        firstName = fullName.text.strip().split()[0]
        lastName = fullName.text.strip().split()[1]
    name = [firstName, lastName]
    return(name)


def loadProfessorScore(URL, parsedPage):
    score = parsedPage.find("div", class_="RatingValue__Numerator-qw8sqy-2 liyUjw")
    return(score.text.strip())


def loadProfessorDepartment(URL, parsedPage):
    department = parsedPage.find("a", class_="TeacherDepartment__StyledDepartmentLink-fl79e8-0 fuypDB")
    return(department.text.strip().replace(' department',''))


def loadTakeAgainAnDifficulty(URL, parsedPage):
    scores = []
    for i in parsedPage.find_all(attrs={"class": "FeedbackItem__FeedbackNumber-uof32n-1 kkESWs"}):
        scores.append(i.text.strip())
    return(scores)


def loadReviews(URL, parsedPage):
    reviews = parsedPage.find("li", class_="TeacherRatingTabs__StyledTab-pnmswv-2 bOzrdx react-tabs__tab--selected")
    return(reviews.text.strip().replace(' Student Ratings', ''))


def addToData(URL):
    page = requests.get(URL)
    soup = BeautifulSoup(page.content, "html.parser")
    name = loadProfessorName(URL, soup)
    department = loadProfessorDepartment(URL, soup)
    score = loadProfessorScore(URL, soup)
    reviews = loadReviews(URL, soup)
    takeAgainAndDifficulty = loadTakeAgainAnDifficulty(URL, soup)
    loadTakeAgainAnDifficulty(URL, soup)
    professorData = name + [department] + [float(score)] + takeAgainAndDifficulty + [reviews]
    data.append(professorData)


def convertToSQLInsert():
    pass


def convertToSQLUpdate():
    pass


def printTable():
    col_names = ["Firt Name", "Last Name", "Department", "RMP Score", "Would Take Again", "Difficulty", "Reviews"]
    print(tabulate(data, headers=col_names, tablefmt="fancy_grid", floatfmt=(None, None, None, '.1f', None, '.1f', None)))


addToData("https://www.ratemyprofessors.com/professor?tid=2256935") # Allman,Mark
addToData("https://www.ratemyprofessors.com/professor?tid=2354474") # Ayday,Erman
addToData("https://www.ratemyprofessors.com/professor?tid=2420821") # Barendt,Nicholas
addToData("https://www.ratemyprofessors.com/professor?tid=801648")  # Cavusoglu,Cenk
# Chandra,Praphul
# Chaudhary,Vipin
addToData("https://www.ratemyprofessors.com/professor?tid=1658282") # Connamacher,Harold
addToData("https://www.ratemyprofessors.com/professor?tid=2832423") # Foreback,Dianne
addToData("https://www.ratemyprofessors.com/professor?tid=2638814") # French,Roger
addToData("https://www.ratemyprofessors.com/professor?tid=2252150") # Fu,Michael
addToData("https://www.ratemyprofessors.com/professor?tid=2593133") # Gajurel,Sanjaya
# Ganesan,Ashwin
# Gupta,Manish
addToData("https://www.ratemyprofessors.com/professor?tid=1901816") # Gurkan Cavusoglu,Evren
addToData("https://www.ratemyprofessors.com/professor?tid=2766350") # Izadnegahdar,Daniel
addToData("https://www.ratemyprofessors.com/professor?tid=2849338") # Jayapandian,Catherine
addToData("https://www.ratemyprofessors.com/professor?tid=2863682") # Jimenez Segovia,Luis
addToData("https://www.ratemyprofessors.com/professor?tid=1104419") # Koyuturk,Mehmet
# addToData("https://www.ratemyprofessors.com/professor?tid=2848501") # Kuppannagari,Sanmukh
addToData("https://www.ratemyprofessors.com/professor?tid=1478435") # Lewicki,Michael
addToData("https://www.ratemyprofessors.com/professor?tid=846293") # Li,Jing
addToData("https://www.ratemyprofessors.com/professor?tid=2231701") # Li,Pan
# Li,Shuo
addToData("https://www.ratemyprofessors.com/professor?tid=16817") # Liberatore,Vincenzo
addToData("https://www.ratemyprofessors.com/professor?tid=2529012") # Loui,Ronald
# Murthy,Sreerama
addToData("https://www.ratemyprofessors.com/professor?tid=2699654") # Omeike,Stanley
addToData("https://www.ratemyprofessors.com/professor?tid=2571392") # Ozguner,Orhan
addToData("https://www.ratemyprofessors.com/professor?tid=16730") # Podgurski,H
addToData("https://www.ratemyprofessors.com/professor?tid=846287") # Rabinovich,Michael
addToData("https://www.ratemyprofessors.com/professor?tid=1868954") # Ray,Soumya
# Shkurti,Thomas
addToData("https://www.ratemyprofessors.com/professor?tid=321409") # Szarek,Stanislaw
addToData("https://www.ratemyprofessors.com/professor?tid=935633") # Thomas,Peter
addToData("https://www.ratemyprofessors.com/professor?tid=2425127") # Wang,An
# addToData("https://www.ratemyprofessors.com/professor?tid=2764934") # Weyer,Daniel
# addToData("https://www.ratemyprofessors.com/professor?tid=2025941") # Wilson,David
addToData("https://www.ratemyprofessors.com/professor?tid=2558896") # Wu,Yinghui
addToData("https://www.ratemyprofessors.com/professor?tid=2355255") # Xiao,Xusheng
# Xu,Kevin
addToData("https://www.ratemyprofessors.com/professor?tid=2519044") # Xu,Shuai
addToData("https://www.ratemyprofessors.com/professor?tid=2524332") # Ye,Yanfang


printTable()

