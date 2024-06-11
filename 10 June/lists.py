"""
A granular .py Task Manager program to understand lists in depth

Badal Prasad Singh
"""
class Task:
    def __init__(self, description, status='Pending'):
        self.description = description
        self.status = status

    def mark_completed(self):
        self.status = 'Completed'

    def __str__(self):
        return f"Task(description='{self.description}', status='{self.status}')"

class TaskManager:
    def __init__(self):
        self.tasks = []

    def add_task(self, task):
        if isinstance(task, Task):
            self.tasks.append(task)
        else:
            raise TypeError("Only Task instances can be added.")

    def remove_task(self, task_description):
        self.tasks = [task for task in self.tasks if task.description != task_description]

    def get_all_tasks(self):
        return self.tasks

    def get_pending_tasks(self):
        return [task for task in self.tasks if task.status == 'Pending']

    def get_completed_tasks(self):
        return [task for task in self.tasks if task.status == 'Completed']

    def mark_task_completed(self, task_description):
        for task in self.tasks:
            if task.description == task_description:
                task.mark_completed()
                break

if __name__ == "__main__":
    task_manager = TaskManager()

    # Adding tasks
    task1 = Task("Buy groceries")
    task2 = Task("Read a book")
    task3 = Task("Write a report")

    task_manager.add_task(task1)
    task_manager.add_task(task2)
    task_manager.add_task(task3)

    task_manager.mark_task_completed("Read a book")

    print("All tasks:")
    for task in task_manager.get_all_tasks():
        print(task)

    print("\nPending tasks:")
    for task in task_manager.get_pending_tasks():
        print(task)

    print("\nCompleted tasks:")
    for task in task_manager.get_completed_tasks():
        print(task)

    task_manager.remove_task("Write a report")

    print("\nAll tasks after removal:")
    for task in task_manager.get_all_tasks():
        print(task)
