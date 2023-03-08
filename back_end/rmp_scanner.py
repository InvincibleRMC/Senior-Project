"""Rate My Professor Scanner"""
from typing import List, Any
import requests
from bs4 import BeautifulSoup
from tabulate import tabulate

data: List[List[Any]] = []


def load_professor_name(parsed_page: BeautifulSoup):
    """Load professors name"""
    full_name = parsed_page.find("div", class_="NameTitle__Name-dowf0z-0 cfjPUG")
    if full_name is None:
        return ["", ""]

    try:
        first_name = full_name.text.strip().split()[0] + " " + full_name.text.strip().split()[1]
        last_name = full_name.text.strip().split()[2]
    except IndexError:
        first_name = full_name.text.strip().split()[0]
        last_name = full_name.text.strip().split()[1]
    name = [first_name, last_name]
    return name


def load_professor_score(parsed_page: BeautifulSoup):
    """Load professors score"""
    score = parsed_page.find("div", class_="RatingValue__Numerator-qw8sqy-2 liyUjw")
    if score is None:
        return ""
    return score.text.strip()


def load_professor_department(parsed_page: BeautifulSoup):
    """Load professors department"""
    department = parsed_page.find("a",
                                  class_="TeacherDepartment__StyledDepartmentLink-fl79e8-0 fuypDB")
    if department is None:
        return ""
    return department.text.strip().replace(' department', '')


def load_take_again_and_difficulty(parsed_page: BeautifulSoup):
    """Load take again and difficulty"""
    scores: List[str] = []
    for i in parsed_page.find_all(attrs={"class": "FeedbackItem__FeedbackNumber-uof32n-1 kkESWs"}):
        scores.append(i.text.strip())
    return scores


def load_reviews(parsed_page: BeautifulSoup):
    """Load reviews"""
    reviews = parsed_page.find("li", class_="TeacherRatingTabs__StyledTab-pnmswv-2" +
                                            " bOzrdx" +
                                            " react-tabs__tab--selected")
    if reviews is None:
        return ""
    return reviews.text.strip().replace(' Student Ratings', '')


def add_to_data(url: str):
    """Takes a url and adds data to the table"""
    page = requests.get(url, timeout=10)
    soup = BeautifulSoup(page.content, "html.parser")
    name = load_professor_name(soup)
    department = load_professor_department(soup)
    score = load_professor_score(soup)
    reviews = load_reviews(soup)
    take_again_and_difficulty = load_take_again_and_difficulty(soup)
    load_take_again_and_difficulty(soup)
    professor_data = name + [department] + [float(score)] + take_again_and_difficulty + [reviews]
    data.append(professor_data)


def no_rmp_data(last_name: str, first_name: str):
    professor_data = [first_name, last_name] + ["N/A"] + ["N/A"] + ["N/A", "N/A"] + ["N/A"]
    data.append(professor_data)

def print_table():
    """Uses tabulate to print the table nicely"""
    col_names = ["First Name", "Last Name", "Department", "RMP Score",
                 "Would Take Again", "Difficulty", "Reviews"]
    print(tabulate(data, headers=col_names, tablefmt="fancy_grid",))


def run_rmp_scanner():
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2256935")  # Allman,Mark
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2354474")  # Ayday,Erman
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2420821")  # Barendt,Nicholas
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2848027")  # Bruckman, Laura
    add_to_data("https://www.ratemyprofessors.com/professor?tid=801648")   # Cavusoglu,Cenk
    no_rmp_data("Chandra", "Praphul")                                      # Chandra,Praphul
    no_rmp_data("Chaudhary", "Vipin")                                      # Chaudhary,Vipin
    add_to_data("https://www.ratemyprofessors.com/professor?tid=1658282")  # Connamacher,Harold
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2832423")  # Foreback,Dianne
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2638814")  # French,Roger
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2252150")  # Fu,Michael
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2593133")  # Gajurel,Sanjaya
    no_rmp_data("Ganesan", "Ashwin")                                       # Ganesan,Ashwin
    no_rmp_data("Gupta","Manish")                                          # Gupta,Manish
    add_to_data("https://www.ratemyprofessors.com/professor?tid=1901816")  # Gurkan Cavusoglu,Evren
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2766350")  # Izadnegahdar,Daniel
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2849338")  # Jayapandian,Catherine
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2863682")  # Jimenez Segovia,Luis
    add_to_data("https://www.ratemyprofessors.com/professor?tid=1104419")  # Koyuturk,Mehmet
    no_rmp_data("Kuppannagari", "Sanmukh")                                 # Kuppannagari,Sanmukh
    add_to_data("https://www.ratemyprofessors.com/professor?tid=1478435")  # Lewicki,Michael
    add_to_data("https://www.ratemyprofessors.com/professor?tid=846293")   # Li,Jing
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2231701")  # Li,Pan
    no_rmp_data("Li", "Shuo")                                              # Li,Shuo
    add_to_data("https://www.ratemyprofessors.com/professor?tid=16817")    # Liberatore,Vincenzo
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2529012")  # Loui,Ronald
    no_rmp_data("Murthy", "Sreerama")                                      # Murthy,Sreerama
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2699654")  # Omeike,Stanley
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2571392")  # Ozguner,Orhan
    add_to_data("https://www.ratemyprofessors.com/professor?tid=16730")    # Podgurski,H
    add_to_data("https://www.ratemyprofessors.com/professor?tid=846287")   # Rabinovich,Michael
    add_to_data("https://www.ratemyprofessors.com/professor?tid=1868954")  # Ray,Soumya
    no_rmp_data("Shkurti", "Thomas")                                       # Shkurti,Thomas
    add_to_data("https://www.ratemyprofessors.com/professor?tid=321409")   # Szarek,Stanislaw
    add_to_data("https://www.ratemyprofessors.com/professor?tid=935633")   # Thomas,Peter
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2425127")  # Wang,An
    no_rmp_data("Weyer", "Daniel")                                         # Weyer,Daniel
    no_rmp_data("Wilson", "David")                                         # Wilson,David
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2558896")  # Wu,Yinghui
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2355255")  # Xiao,Xusheng
    no_rmp_data("Xu", "Kevin")                                             # Xu,Kevin
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2519044")  # Xu,Shuai
    add_to_data("https://www.ratemyprofessors.com/professor?tid=2524332")  # Ye,Yanfang
    return data