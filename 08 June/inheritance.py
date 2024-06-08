class Animal:
    def __init__(self, name, species):
        self.name = name
        self.species = species

    def make_sound(self):
        return f"{self.name} makes a sound."

    def get_info(self):
        return f"{self.name} is a {self.species}."

class Dog(Animal):
    def __init__(self, name, breed):
        super().__init__(name, species='Dog')
        self.breed = breed

    def make_sound(self):
        return f"{self.name} barks."

    def get_info(self):
        return f"{self.name} is a {self.breed} dog."

class ElectricAppliance:
    def __init__(self, brand):
        self.brand = brand

    def turn_on(self):
        return f"The {self.brand} appliance is now on."

    def turn_off(self):
        return f"The {self.brand} appliance is now off."

class SmartDog(Dog, ElectricAppliance):
    def __init__(self, name, breed, brand):
        Dog.__init__(self, name, breed)
        ElectricAppliance.__init__(self, brand)

    def get_info(self):
        dog_info = Dog.get_info(self)
        appliance_info = f" It also has smart features by {self.brand}."
        return dog_info + appliance_info

if __name__ == "__main__":
    animal = Animal(name="Generic Animal", species="Unknown")
    print(animal.make_sound())  
    print(animal.get_info())    

    print("\n--- Dog Inheritance Example ---")
    dog = Dog(name="Rex", breed="Labrador")
    print(dog.make_sound()) 
    print(dog.get_info())   

    print("\n--- SmartDog Multiple Inheritance Example ---")
    smart_dog = SmartDog(name="Bolt", breed="Bulldog", brand="TechPaws")
    print(smart_dog.make_sound()) 
    print(smart_dog.get_info())   
    print(smart_dog.turn_on())    
    print(smart_dog.turn_off())   
