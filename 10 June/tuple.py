"""
A granular .py file to understand tuples in depth

Badal Prasad Singh
"""

class Student:
    def __init__(self, name: str, roll_no: int, marks: tuple):
        self.name = name
        self.roll_no = roll_no
        self.marks = marks 
    
    def calculate_total_marks(self):
        return sum(self.marks)
    
    def calculate_average_marks(self):
        return sum(self.marks) / len(self.marks)
    
    def get_details(self):
        return f"Name: {self.name}, Roll No: {self.roll_no}, Total Marks: {self.calculate_total_marks()}, Average Marks: {self.calculate_average_marks()}"
    
    def __str__(self):
        return f"Student(Name: {self.name}, Roll No: {self.roll_no})"


class StudentRecords:
    def __init__(self):
        self.students = []
    
    def add_student(self, student: Student):
        self.students.append(student)
    
    def get_student_by_roll_no(self, roll_no: int):
        for student in self.students:
            if student.roll_no == roll_no:
                return student
        return None
    
    def remove_student_by_roll_no(self, roll_no: int):
        self.students = [student for student in self.students if student.roll_no != roll_no]
    
    def get_all_students(self):
        return self.students
    
    def __str__(self):
        return f"StudentRecords(Count: {len(self.students)})"


if __name__ == "__main__":
    class Student:
        def __init__(self, name: str, roll_no: int, marks: tuple):
            self.name = name
            self.roll_no = roll_no
            self.marks = marks 
    
        def calculate_total_marks(self):
            return sum(self.marks)
        
        def calculate_average_marks(self):
            return sum(self.marks) / len(self.marks)
        
        def get_details(self):
            return f"Name: {self.name}, Roll No: {self.roll_no}, Total Marks: {self.calculate_total_marks()}, Average Marks: {self.calculate_average_marks()}"
        
        def __str__(self):
            return f"Student(Name: {self.name}, Roll No: {self.roll_no})"


class StudentRecords:
    def __init__(self):
        self.students = []
    
    def add_student(self, student: Student):
        self.students.append(student)
    
    def get_student_by_roll_no(self, roll_no: int):
        for student in self.students:
            if student.roll_no == roll_no:
                return student
        return None
    
    def remove_student_by_roll_no(self, roll_no: int):
        self.students = [student for student in self.students if student.roll_no != roll_no]
    
    def get_all_students(self):
        return self.students
    
    def __str__(self):
        return f"StudentRecords(Count: {len(self.students)})"


if __name__ == "__main__":

    student1 = Student("Alice", 101, (85, 90, 78))
    student2 = Student("Bob", 102, (88, 92, 80))
    student3 = Student("Charlie", 103, (70, 75, 68))
    
    records = StudentRecords()
    
    records.add_student(student1)
    records.add_student(student2)
    records.add_student(student3)
    
    student = records.get_student_by_roll_no(102)
    if student:
        print(student.get_details())
    
    records.remove_student_by_roll_no(103)
    
    for student in records.get_all_students():
        print(student.get_details())

    student1 = Student("Alice", 101, (85, 90, 78))
    student2 = Student("Bob", 102, (88, 92, 80))
    student3 = Student("Charlie", 103, (70, 75, 68))
    
    records = StudentRecords()
    
    records.add_student(student1)
    records.add_student(student2)
    records.add_student(student3)
    
    student = records.get_student_by_roll_no(102)
    if student:
        print(student.get_details())
    
    records.remove_student_by_roll_no(103)
    
    for student in records.get_all_students():
        print(student.get_details())
