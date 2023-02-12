import requests
from bs4 import BeautifulSoup
from tabulate import tabulate

data = []


def load_professor_name(URL: str, parsedPage: BeautifulSoup):
    fullName = parsedPage.find("div", class_="NameTitle__Name-dowf0z-0 cfjPUG")
    if fullName is None:
        return ["", ""]

    try:
        firstName = fullName.text.strip().split()[0] + " " + fullName.text.strip().split()[1]
        lastName = fullName.text.strip().split()[2]
    except IndexError:
        firstName = fullName.text.strip().split()[0]
        lastName = fullName.text.strip().split()[1]
    name = [firstName, lastName]
    return name


def load_professor_score(URL: str, parsedPage: BeautifulSoup):
    score = parsedPage.find("div", class_="RatingValue__Numerator-qw8sqy-2 liyUjw")
    if score is None:
        return ""
    return score.text.strip()


def load_professor_department(URL: str, parsedPage: BeautifulSoup):
    department = parsedPage.find("a", class_="TeacherDepartment__StyledDepartmentLink-fl79e8-0 fuypDB")
    if department is None:
        return ""
    return department.text.strip().replace(' department', '')


def load_take_again_and_difficulty(URL: str, parsedPage: BeautifulSoup):
    scores: list[str] = []
    for i in parsedPage.find_all(attrs={"class": "FeedbackItem__FeedbackNumber-uof32n-1 kkESWs"}):
        scores.append(i.text.strip())
    return scores


def load_reviews(URL: str, parsedPage: BeautifulSoup):
    reviews = parsedPage.find("li", class_="TeacherRatingTabs__StyledTab-pnmswv-2 bOzrdx react-tabs__tab--selected")
    if reviews is None:
        return ""
    return reviews.text.strip().replace(' Student Ratings', '')


def add_to_data(URL: str):
    page = requests.get(URL)
    soup = BeautifulSoup(page.content, "html.parser")
    name = load_professor_name(URL, soup)
    department = load_professor_department(URL, soup)
    score = load_professor_score(URL, soup)
    reviews = load_reviews(URL, soup)
    takeAgainAndDifficulty = load_take_again_and_difficulty(URL, soup)
    load_take_again_and_difficulty(URL, soup)
    professorData = name + [department] + [score] + takeAgainAndDifficulty + [reviews]
    data.append(professorData)


def convert_to_SQL_insert():
    pass


def convert_to_SQL_update():
    pass


def print_table():
    col_names = ["First Name", "Last Name", "Department", "RMP Score", "Would Take Again", "Difficulty", "Reviews"]
    print(tabulate(data, headers=col_names, tablefmt="fancy_grid", floatfmt=(None, None, None, '.1f', None, '.1f', None)))


add_to_data("https://www.ratemyprofessors.com/professor?tid=2256935")  # Allman,Mark
add_to_data("https://www.ratemyprofessors.com/professor?tid=2354474")  # Ayday,Erman
add_to_data("https://www.ratemyprofessors.com/professor?tid=2420821")  # Barendt,Nicholas
add_to_data("https://www.ratemyprofessors.com/professor?tid=801648")   # Cavusoglu,Cenk
# Chandra,Praphul
# Chaudhary,Vipin
add_to_data("https://www.ratemyprofessors.com/professor?tid=1658282")  # Connamacher,Harold
add_to_data("https://www.ratemyprofessors.com/professor?tid=2832423")  # Foreback,Dianne
add_to_data("https://www.ratemyprofessors.com/professor?tid=2638814")  # French,Roger
add_to_data("https://www.ratemyprofessors.com/professor?tid=2252150")  # Fu,Michael
add_to_data("https://www.ratemyprofessors.com/professor?tid=2593133")  # Gajurel,Sanjaya
# Ganesan,Ashwin
# Gupta,Manish
add_to_data("https://www.ratemyprofessors.com/professor?tid=1901816")  # Gurkan Cavusoglu,Evren
add_to_data("https://www.ratemyprofessors.com/professor?tid=2766350")  # Izadnegahdar,Daniel
add_to_data("https://www.ratemyprofessors.com/professor?tid=2849338")  # Jayapandian,Catherine
add_to_data("https://www.ratemyprofessors.com/professor?tid=2863682")  # Jimenez Segovia,Luis
add_to_data("https://www.ratemyprofessors.com/professor?tid=1104419")  # Koyuturk,Mehmet
# add_to_data("https://www.ratemyprofessors.com/professor?tid=2848501") # Kuppannagari,Sanmukh
add_to_data("https://www.ratemyprofessors.com/professor?tid=1478435")  # Lewicki,Michael
add_to_data("https://www.ratemyprofessors.com/professor?tid=846293")  # Li,Jing
add_to_data("https://www.ratemyprofessors.com/professor?tid=2231701")  # Li,Pan
# Li,Shuo
add_to_data("https://www.ratemyprofessors.com/professor?tid=16817")  # Liberatore,Vincenzo
add_to_data("https://www.ratemyprofessors.com/professor?tid=2529012")  # Loui,Ronald
# Murthy,Sreerama
add_to_data("https://www.ratemyprofessors.com/professor?tid=2699654")  # Omeike,Stanley
add_to_data("https://www.ratemyprofessors.com/professor?tid=2571392")  # Ozguner,Orhan
add_to_data("https://www.ratemyprofessors.com/professor?tid=16730")  # Podgurski,H
add_to_data("https://www.ratemyprofessors.com/professor?tid=846287")  # Rabinovich,Michael
add_to_data("https://www.ratemyprofessors.com/professor?tid=1868954")  # Ray,Soumya
# Shkurti,Thomas
add_to_data("https://www.ratemyprofessors.com/professor?tid=321409")  # Szarek,Stanislaw
add_to_data("https://www.ratemyprofessors.com/professor?tid=935633")  # Thomas,Peter
add_to_data("https://www.ratemyprofessors.com/professor?tid=2425127")  # Wang,An
# add_to_data("https://www.ratemyprofessors.com/professor?tid=2764934") # Weyer,Daniel
# add_to_data("https://www.ratemyprofessors.com/professor?tid=2025941") # Wilson,David
add_to_data("https://www.ratemyprofessors.com/professor?tid=2558896")  # Wu,Yinghui
add_to_data("https://www.ratemyprofessors.com/professor?tid=2355255")  # Xiao,Xusheng
# Xu,Kevin
add_to_data("https://www.ratemyprofessors.com/professor?tid=2519044")  # Xu,Shuai
add_to_data("https://www.ratemyprofessors.com/professor?tid=2524332")  # Ye,Yanfang

print_table()
