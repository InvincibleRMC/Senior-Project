"""SIS Scraper"""
import csv
import os
from typing import List, Any
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.firefox.options import Options as FirefoxOptions
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException
from tabulate import tabulate

options = FirefoxOptions()
options.add_argument("--headless")
options.add_argument("--incognito")
browser = webdriver.Firefox(options=options)

professor_data: List[List[Any]] = []
spreadsheet_data: List[List[Any]] = []
urls: List[Any] = []

def read_csv():
    file_path = os.path.join(os.getcwd(), "Desktop", "Senior Project", "back_end", "Data", "sisScanningData.csv")
    with open(file_path, mode ='r')as file:
        csvFile = csv.reader(file)
        for lines in csvFile:
            spreadsheet_data.append(lines)
    spreadsheet_data.pop(0)

def generate_urls():
    read_csv()
    for professor in spreadsheet_data:
        semester = professor[0]

        if semester == "Fall 2022":
          semester_id = "2228"
        elif semester == "Spring 2022":
          semester_id = "2221"

        if semester_id is None:
           raise Exception("unable to read semester")
        
        class_id = professor[3]
        name = professor[4].split(",")
        first_name = name[1]
        last_name = name[0]
        urls.append(form_url(first_name, last_name, semester_id, class_id))


def form_url(first_name, last_name, semester_id, class_id):
    url = ('https://webapps.case.edu/courseevals/report-course?'
           + 'semester=' + semester_id
           + '&instructor=' + first_name + '%20' + last_name
           + '&course=' + semester_id + '%3A' + class_id)

    return url


def login():
    """Login to Browser"""
    while True:
        try:
            username_field = browser.find_element(By.ID, "username")
            password_field = browser.find_element(By.ID, "password")
            submit = browser.find_element(By.ID, "login-submit")
        except NoSuchElementException:
            # Don't need to login
            break

        # sis_key.txt 2 line .gitignored file with username and password
        file_path = os.path.join(os.getcwd(), "Desktop", "Senior Project", "back_end", "Data", "sis_key.txt")
        with open(file_path, encoding="utf8") as file:
            lines = file.readlines()
        username = lines[0].strip().replace('\n', '')
        password = lines[1].strip().replace('\n', '')

        username_field.send_keys(username)
        password_field.send_keys(password)

        submit.click()


def get_name(soup: BeautifulSoup):
    full_name: List[Any] = []
    for row in soup.table.find_all('tr')[1:2]:
        for col in row.find_all('td')[0:1]:
            result = col.text.strip()
    name = result.replace('Your overall rating of the instructor (regarding ', '')
    name = name.strip(')')
    name = name.split(" ")

    # Special case: Evren Gurkan-Cavusoglu
    if len(name) > 2:
        first_name = name[0]
        last_name = name[1] + "-" + name[2]
    else:
        first_name = name[0]
        last_name = name[1]

    # Special Case: H.Andy Podgurski
    if first_name == "H":
        first_name = "H. Andy"

    full_name.append(first_name)
    full_name.append(last_name)
    return full_name


def get_course(soup: BeautifulSoup):
    """Gets Course"""
    div = soup.find_all('div', attrs={'class': None})[2::3]
    return div[0].text.strip()[12:]


def get_semester(soup: BeautifulSoup):
    """Gets Semester"""
    div = soup.find_all('p', attrs={'class': None})[0::1]
    return div[0].text.strip()[10:]


def get_scores(soup: BeautifulSoup):
    """Gets Scores"""
    table_values: List[str] = []
    for row in soup.table.find_all('tr')[1:]:
        for col in row.find_all('td'):
            table_values.append(col.text.strip())
    scores: List[str] = []
    scores.append(table_values[7])
    scores.append(table_values[17])
    return scores


def generate_data(url: str):
    """Generates Data"""
    browser.get(url)
    login()
    soup = BeautifulSoup(browser.page_source, "html.parser")
    course_never_set_up = soup.find("p", string="This evaluation was never set up.") != None
    course_not_minimum_enrollment = soup.find("p", string="This evaluation did not meet the minimum enrollment, so reports are not available.") != None
    course_no_responses = soup.find("p", string="There were no responses for this evaluation.") != None
    if not (course_never_set_up or course_not_minimum_enrollment or course_no_responses):
        name = get_name(soup)
        course = get_course(soup)
        semester = get_semester(soup)
        scores = get_scores(soup)
        data = name + [course] + [semester] + scores
        professor_data.append(data)
    else:
        # no course evals
        pass


def run_sis_scanner():
    generate_urls()
    url = urls[0:63]
    for link in url:
        generate_data(link)
    browser.quit()
    return professor_data