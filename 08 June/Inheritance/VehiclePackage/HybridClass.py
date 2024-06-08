# Hybrid Class 
from VehiclePackage.CarClass import Car

class Hybrid(Car):
    def __init__(self, type, make, model, batteryKVA):
        super().__init__(type, make, model)
        self.batteryKVA = batteryKVA

    def __str__(self):
        return super().__str__() + ", Battery KVA = " + self.batteryKVA
    
    def __repr__(self):
        return super().__repr__() + ", Battery KVA: " + str(self.batteryKVA)
        