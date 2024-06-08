def divide_numbers(a, b):
    try:
        result = a / b
    except ZeroDivisionError as e:
        return f"Error: Cannot divide by zero. ({e})"
    else:
        return f"The result is {result}"
    finally:
        print("Execution of divide_numbers completed.")

def read_file(file_path):
    try:
        with open(file_path, 'r') as file:
            content = file.read()
            return content
    except FileNotFoundError as e:
        return f"Error: File not found. ({e})"
    except IOError as e:
        return f"Error: IO error occurred. ({e})"
    finally:
        print("Execution of read_file completed.")

class NegativeNumberError(Exception):
    def __init__(self, value):
        self.value = value
        self.message = f"Negative numbers are not allowed: {value}"
        super().__init__(self.message)

def check_positive(number):
    if number < 0:
        raise NegativeNumberError(number)
    return f"{number} is positive."

def nested_exception_handling():
    try:
        try:
            result = 10 / 0
        except ZeroDivisionError as e:
            print(f"Inner exception caught: {e}")
            raise ValueError("A ValueError occurred after catching ZeroDivisionError")
    except ValueError as e:
        return f"Outer exception caught: {e}"
    finally:
        print("Execution of nested_exception_handling completed.")

if __name__ == "__main__":
    print("\n--- Basic Exception Handling ---")
    print(divide_numbers(10, 2)) 
    print(divide_numbers(10, 0)) 
    
    print("\n--- Handling Multiple Exceptions ---")
    print(read_file("existing_file.txt"))
    print(read_file("non_existing_file.txt")) 
    
    print("\n--- Custom Exceptions ---")
    try:
        print(check_positive(10)) 
        print(check_positive(-5)) 
    except NegativeNumberError as e:
        print(e)  
    
    print("\n--- Nested Exception Handling ---")
    print(nested_exception_handling())  