"""
Basic Dicitonary and Sets

Badal Prasad Singh
"""
from collections import defaultdict

students = defaultdict(lambda: "null")

def add_student(id, name):
    students[id] = name
    
def del_student(id):
    del students[id]

def unique_students():
    print(set(list(students.keys)))

"""
A OOP program to understand dictionary and sets in depth

"""


class Student:
    def __init__(self, student_id, name):
        self.student_id = student_id
        self.name = name
        self.courses = {} 

    def add_course(self, course, grade=None):
        self.courses[course] = grade

    def update_grade(self, course, grade):
        if course in self.courses:
            self.courses[course] = grade
        else:
            print(f"Course {course} not found for student {self.name}.")

    def __str__(self):
        return f"Student[ID: {self.student_id}, Name: {self.name}, Courses: {self.courses}]"


class Course:
    def __init__(self, course_id, name):
        self.course_id = course_id
        self.name = name

    def __hash__(self):
        return hash((self.course_id, self.name))

    def __eq__(self, other):
        return self.course_id == other.course_id and self.name == other.name

    def __str__(self):
        return f"Course[ID: {self.course_id}, Name: {self.name}]"


class StudentManagementSystem:
    def __init__(self):
        self.students = {}
        self.courses = set()

    def add_student(self, student_id, name):
        if student_id not in self.students:
            self.students[student_id] = Student(student_id, name)
            print(f"Student {name} added successfully.")
        else:
            print(f"Student with ID {student_id} already exists.")

    def add_course(self, course_id, name):
        course = Course(course_id, name)
        if course not in self.courses:
            self.courses.add(course)
            print(f"Course {name} added successfully.")
        else:
            print(f"Course {name} already exists.")

    def assign_course_to_student(self, student_id, course_id):
        if student_id in self.students:
            student = self.students[student_id]
            course = self._get_course_by_id(course_id)
            if course:
                student.add_course(course)
                print(f"Course {course.name} assigned to student {student.name}.")
            else:
                print(f"Course with ID {course_id} does not exist.")
        else:
            print(f"Student with ID {student_id} does not exist.")

    def update_student_grade(self, student_id, course_id, grade):
        if student_id in self.students:
            student = self.students[student_id]
            course = self._get_course_by_id(course_id)
            if course:
                student.update_grade(course, grade)
                print(f"Grade updated for student {student.name} in course {course.name}.")
            else:
                print(f"Course with ID {course_id} does not exist.")
        else:
            print(f"Student with ID {student_id} does not exist.")

    def _get_course_by_id(self, course_id):
        for course in self.courses:
            if course.course_id == course_id:
                return course
        return None

    def __str__(self):
        students_str = "\n".join(str(student) for student in self.students.values())
        courses_str = "\n".join(str(course) for course in self.courses)
        return f"Students:\n{students_str}\n\nCourses:\n{courses_str}"


if __name__ == "__main__":
    sms = StudentManagementSystem()
    sms.add_student(1, "Alice")
    sms.add_student(2, "Bob")
    sms.add_course(101, "Mathematics")
    sms.add_course(102, "Physics")

    sms.assign_course_to_student(1, 101)
    sms.assign_course_to_student(1, 102)
    sms.assign_course_to_student(2, 101)

    sms.update_student_grade(1, 101, 'A')
    sms.update_student_grade(1, 102, 'B')
    sms.update_student_grade(2, 101, 'C')


    print(sms)