# Car Class 
from VehiclePackage.VehicleClass import Vehicle

class Car(Vehicle):
    def __init__(self, type, make, model):
        print("Car.__init__()")
        self.make = make
        self.model = model
        super().__init__(type)
    def print_make(self):
        print(self.make)
    def print_model(self):
        print(self.model)
    def __str__(self):
        print("Car.__str__()")
        return super().__str__() + ", make = " + self.make + ", model = " + self.model
     
    