# Vehicle Class 
class Vehicle():
    '''
    Constructor
    :param type: the kind of vehicle
    '''
    def __init__(self, type):
        self.type  = type

    def printType(self):
        print("type = ", type)
       
    # A couple more 'dunders'
    def __str__(self):
        print("Vehicle.__str__()")
        return "type = " + self.type 
    def __repr__(self):
        print("Vehicle.__repr__()")
        return "type: " + self.type 
    