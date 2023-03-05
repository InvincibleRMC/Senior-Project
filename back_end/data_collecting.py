from sis_scanner import *
from rmp_scanner import *

def main():
    """main function call"""
    #sis_data = run_sis_scanner()
    sis_data = [['Harold', 'Connamacher', 'CSDS 101: The Digital Revolution: Computer and Data Science For All (100/11257)', 'Fall 2022', '3.89', '3.36'], ['Harold', 'Connamacher', 'CSDS 132: Programming in Java (100/4603)', 'Fall 2022', '4.46', '4.13'], ['Laura', 'Bruckman', 'CSDS 133: Introduction to Data Science and Engineering for Majors (100/5326)', 'Fall 2022', '3.79', '3.45'], ['Daniel', 'Izadnegahdar', 'CSDS 221: Full Stack Web Development (100/11999)', 'Fall 2022', '2.28', '2.65'], ['Erman', 'Ayday', 'CSDS 233: Introduction to Data Structures (100/4263)', 'Fall 2022', '3.63', '3.59'], ['Yinghui', 'Wu', 'CSDS 234: Structured and Unstructured Data (100/5020)', 'Fall 2022', '3.50', '3.12'], ['Vincenzo', 'Liberatore', 'CSDS 245: Functional Programming in Java (100/11756)', 'Fall 2022', '4.22', '4.00'], ['Evren', 'Gurkan-Cavusoglu', 'CSDS 281: Logic Design and Computer Organization (100/5135)', 'Fall 2022', '4.43', '4.13'], ['An', 'Wang', 'CSDS 293: Software Craftsmanship (100/4610)', 'Fall 2022', '2.00', '3.33'], ['An', 'Wang', 'CSDS 293N: Software Craftsmanship (100/4807)', 'Fall 2022', '2.00', '3.33'], ['Ulises', 'Fidalgo', 'CSDS 302: Discrete Mathematics (100/4349)', 'Fall 2022', '2.53', '2.95'], ['Shuai', 'Xu', 'CSDS 302: Discrete Mathematics (101/4845)', 'Fall 2022', '4.35', '3.92'], ['Catherine', 'Jayapandian', 'CSDS 305: Files, Indexes and Access Structures for Big Data (100/12058)', 'Fall 2022', '2.25', '1.75'], ['Mehmet', 'Koyuturk', 'CSDS 310: Algorithms (101/5158)', 'Fall 2022', '4.32', '4.32'], ['Mehmet', 'Koyuturk', 'CSDS 310N: Algorithms (100/11267)', 'Fall 2022', '4.32', '4.32'], ['Jing', 'Li', 'CSDS 313: Introduction to Data Analysis (100/5013)', 'Fall 2022', '3.12', '3.25'], ['Mark', 'Allman', 'CSDS 325: Computer Networks I (100/4270)', 'Fall 2022', '4.50', '4.25'], ['Mark', 'Allman', 'CSDS 325N: Computer Networks I (100/4808)', 'Fall 2022', '4.50', '4.25'], ['Ronald', 'Loui', 'CSDS 338: Intro to Operating Systems and Concurrent Programming (100/4748)', 'Fall 2022', '3.62', 
'3.20'], ['Ronald', 'Loui', 'CSDS 338N: Intro to Operating Systems and Concurrent Programming (100/4809)', 'Fall 2022', '3.62', '3.20'], ['Kevin', 'Xu', 'CSDS 340: Machine Learning for Big Data (100/12094)', 'Fall 2022', '4.60', '4.50'], ['Dianne', 'Foreback', 'CSDS 341: Introduction to Database Systems (100/4771)', 'Fall 2022', '1.74', '1.97'], ['Dianne', 'Foreback', 'CSDS 341N: Introduction to Database Systems (100/4811)', 'Fall 2022', '1.74', '1.97'], ['Dianne', 'Foreback', 'CSDS 344: Computer Security (100/4999)', 'Fall 2022', '1.39', '1.61'], ['Gregory', 'Lee', 'CSDS 373: Modern Robot Programming (100/5139)', 'Fall 2022', '2.00', '1.83'], ['Michael', 'Fu', 'CSDS 390: Advanced Game Development Project (100/5140)', 'Fall 2022', '4.67', '4.40'], ['Michael', 'Lewicki', 'CSDS 391: Introduction to Artificial Intelligence (100/4801)', 'Fall 2022', '3.14', '3.00'], ['H. Andy', 'Podgurski', 'CSDS 393: Software Engineering (100/4277)', 'Fall 2022', '3.45', '3.45'], ['Luis', 'Jimenez-Segovia', 'CSDS 393: Software Engineering (101/12056)', 'Fall 2022', '2.88', '2.50'], ['H. Andy', 'Podgurski', 'CSDS 393N: Software Engineering (100/4812)', 'Fall 2022', '3.45', '3.45'], ['Luis', 'Jimenez-Segovia', 'CSDS 393N: Software Engineering (101/12057)', 'Fall 2022', '2.88', '2.50'], ['Shuai', 'Xu', 'CSDS 395: Senior Project in Computer Science (101/4631)', 'Fall 2022', '3.62', '3.38'], ['Shuai', 'Xu', 'CSDS 401: Foundations of Computer Science (500/11263)', 'Fall 2022', '3.75', '3.00'], ['Mehmet', 'Koyuturk', 'CSDS 410: Analysis of Algorithms (100/5156)', 'Fall 2022', '4.50', '4.04'], ['Vincenzo', 'Liberatore', 'CSDS 410: Analysis of Algorithms (500/11269)', 'Fall 2022', '3.67', '3.33'], ['Mark', 'Allman', 'CSDS 425: Computer Networks I (100/4997)', 'Fall 2022', '4.00', '3.60'], ['Sanjaya', 'Gajurel', 'CSDS 438: High Performance Data and Computing (100/5174)', 'Fall 2022', '4.04', '4.09'], ['Sanjaya', 'Gajurel', 'CSDS 438: High Performance Data and Computing (500/11266)', 'Fall 2022', '3.00', '3.00'], ['Soumya', 'Ray', 'CSDS 440: Machine Learning (100/4508)', 'Fall 2022', '4.11', '3.78'], ['Dianne', 'Foreback', 'CSDS 444: Computer Security (100/4909)', 'Fall 2022', '1.39', '1.61'], ['Jing', 'Li', 'CSDS 458: Introduction to Bioinformatics (100/4685)', 'Fall 2022', '4.08', '4.00'], ['Gregory', 'Lee', 'CSDS 473: Modern Robot Programming (100/5143)', 'Fall 2022', '2.00', '1.83'], ['Michael', 'Fu', 'CSDS 487: Advanced Game Development Project (100/5252)', 'Fall 2022', '4.67', '4.40'], ['Cenk', 'Cavusoglu', 'CSDS 489: Robotics I (100/5251)', 'Fall 2022', '3.90', '4.10'], ['H. Andy', 'Podgurski', 'CSDS 493: Software Engineering (100/4562)', 'Fall 2022', '3.45', '3.45'], ['Soumya', 'Ray', 'CSDS 497: Artificial Intelligence: Statistical Natural Language Processing (100/11264)', 'Fall 2022', '4.00', '3.60'], ['Erman', 'Ayday', 'CSDS 500: CSDS Colloquium (100/5159)', 'Fall 2022', '4.55', '4.55'], ['Mehmet', 'Koyuturk', 'OPRE 454: Analysis of Algorithms (100/7729)', 'Fall 2022', '4.50', '4.04'], ['Shuai', 'Xu', 'MATH 304: Discrete Mathematics (101/3073)', 'Fall 2022', '4.35', '3.92'], ['Ulises', 'Fidalgo', 'MATH 304: Discrete Mathematics (100/1829)', 'Fall 2022', '2.53', '2.95'], ['Shuai', 'Xu', 'ECSE 302: Discrete Mathematics (101/5195)', 'Fall 2022', '4.35', '3.92'], ['Cenk', 'Cavusoglu', 'EMAE 489: Robotics I (100/5254)', 'Fall 2022', '3.90', '4.10']]
    #rmp_data = run_rmp_scanner()
    #aggregate_professors = add_all_professor_scores(sis_data)
    #professor_data = average_professor_scores(aggregate_professors)
    #combine_sis_rmp(professor_data, rmp_data)
    aggregate_courses = add_all_course_scores(sis_data)
    print(avgerage_course_scores(aggregate_courses))
    #print_data_sis(sis_data)
    #print_data_rmp(rmp_data)

def print_data_sis(data: List):
    for row in data:
        first_name = row[0]
        last_name = row[1]
        course =  row[2]
        semester = row[3]
        sis_teacher_score = str(row[4])
        sis_coure_score = str(row[5])
        print (first_name + ", " + last_name + ", " + course + ", " + semester + ", " + sis_teacher_score + ", " + sis_coure_score)


def print_data_rmp(data: List):
    for row in data:
        first_name = row[0]
        last_name = row[1]
        department = row[2]
        rmp_score = str(row[3])
        would_take_again = str(row[4])
        difficulty = str(row[5])
        reviews = str(row[6])
        print (first_name + ", " + last_name + ", " + department + ", " + rmp_score + ", " + would_take_again + ", " + difficulty + ", " + reviews)


def add_all_professors(data: List):
    professor_data: List[List[Any]] = []
    for entry in data:
        name = [entry[0], entry[1]]
        if not name in professor_data:
            professor_data.append(name)
        else:
            # repeated name, don't need to add
            pass
    return professor_data


def add_all_professor_scores(data: List):
    professor_data = add_all_professors(data)
    for entry in data:
        first_name = entry[0]
        last_name = entry[1]
        score = entry[4]
        for professor in professor_data:
            if first_name == professor[0] and last_name == professor[1]:
                professor.append(score)
            else:
                # nothing
                pass
    return professor_data


def average_professor_scores(professor_data: List):
    aggregate_data: List[List[Any]] = []
    for professor in professor_data:
        first_name = professor[0]
        last_name = professor[1]
        scores = professor[2:]
        sum_of_scores = float(0)
        for score in scores:
            sum_of_scores = sum_of_scores + float(score)
        avg_score = sum_of_scores / len(scores)
        aggregate_data.append([first_name] + [last_name] + [avg_score])
    return aggregate_data


def combine_sis_rmp(aggregate_data, rmp_data):
    for sis in aggregate_data:
        sis_first_name = sis[0]
        sis_last_name = sis[1]
        sis_score = sis[2]
        for rmp in rmp_data:
            rmp_first_name = rmp[0]
            rmp_last_name = rmp[1]
            rmp_score = rmp[3]
            rmp_would_take_again = rmp[4]
            rmp_difficulty = rmp[5]
            rmp_reviews = rmp[6]
            if sis_first_name == rmp_first_name and sis_last_name == rmp_last_name:
                sis.extend([rmp_score, rmp_would_take_again, rmp_difficulty, rmp_reviews])
    print(aggregate_data)


def add_all_courses(sis_data: List):
    course_data: List[List[Any]] = []
    for data in sis_data:
        course_name = data[2]
        course_title = ""
        split_name = course_name.split()[2:-1]
        for split in split_name:
            course_title = course_title + " " + split
        #if course_title[1:] == "Introduction to Programming in Java":
        #    print("JAVA")
        if not [course_title[1:]] in course_data:
            course_data.append([course_title[1:]])
    return course_data


def add_all_course_scores(data: List):
    course_data = add_all_courses(data)
    for entry in data:
        entry_course = entry[2]
        score = entry[5]
        for data_course in course_data:
            if data_course[0] in entry_course:
                data_course.append(score)
    return course_data


def avgerage_course_scores(course_data: List):
    aggregate_data: List[List[Any]] = []
    for course in course_data:
        course_name = course[0]
        scores = course[1:]
        sum_of_scores = float(0)
        for score in scores:
            sum_of_scores = sum_of_scores + float(score)
        avg_score = sum_of_scores / len(scores)
        aggregate_data.append([course_name] + [avg_score])
    return aggregate_data



if __name__ == "__main__":
    main()