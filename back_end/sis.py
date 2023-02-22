"""SIS Scraper"""
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

data: List[List[Any]] = []


def mark_allman():
    """Data for Mark Allman"""
    name = "Mark Allman"
    generate_data(name,
                  ('https://webapps.case.edu/courseevals/'
                   'report-course?instructor=allman&course=2228%3A4270'))
    generate_data(name,
                  ('https://webapps.case.edu/courseevals/'
                   'report-course?instructor=allman&course=2228%3A4997'))


def erman_ayday():
    """Data for Erman Ayday"""
    name = "Erman Ayday"
    generate_data(name,
                  ('https://webapps.case.edu/courseevals/'
                   'report-course?instructor=ayday&course=2228%3A4263'))
    generate_data(name,
                  ('https://webapps.case.edu/courseevals/'
                   'report-course?instructor=ayday&course=2228%3A5159'))


def nick_barendt():
    """Data for Nick Barendt"""
    name = "Nick Barendt"
    generate_data(name,
                  ('https://webapps.case.edu/courseevals/'
                   'report-course?instructor=Barendt&course=2221%3A5176'))


def cenk_cavusoglu():
    """Data for Cenk Cavusoglu"""


def login(browser: webdriver.Firefox):
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
        file_path = os.path.join(os.getcwd(), "back_end", "sis_key.txt")
        with open(file_path, encoding="utf8") as file:
            lines = file.readlines()
        username = lines[0].strip().replace('\n', '')
        password = lines[1].strip().replace('\n', '')

        username_field.send_keys(username)
        password_field.send_keys(password)

        submit.click()


def get_course(soup: BeautifulSoup):
    """Gets Course"""
    div = soup.find_all('div', attrs={'class': None})[2::3]
    return div[0].text.strip()[12:]


def get_scores(soup: BeautifulSoup):
    """Gets Scores"""
    values: List[str] = []
    for row in soup.table.find_all('tr')[1:]:
        for col in row.find_all('td'):
            values.append(col.text.strip())
    scores: List[str] = []
    scores.append(values[7])
    scores.append(values[17])
    return scores


def generate_data(name: str, url: str):
    """Generates Data"""
    browser.get(url)
    login(browser)
    soup = BeautifulSoup(browser.page_source, "html.parser")
    course = get_course(soup)
    scores = get_scores(soup)
    professor_data = [name] + [course] + scores
    data.append(professor_data)


def print_table():
    """Uses tabulate to print the table nicely"""
    col_names = ["Name", "Course", "Teacher Rating", "Course Rating"]
    print(tabulate(data, headers=col_names, tablefmt="fancy_grid"))


def main():
    """main function call"""
    mark_allman()
    erman_ayday()
    nick_barendt()
    print_table()
    browser.quit()


if __name__ == "__main__":
    main()
