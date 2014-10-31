// Playground - noun: a place where people can play


//assignment 1: Create a Person class in Swift with the following functionality:
//* Properties for a person’s first name and last name and a bool declaring if the person is a student or not
//* An init method that takes in 3 parameters that are used to set each property on the person.
//* A method that returns the persons full name (the first name and last name combined!)

class Person {
    var firstName = "Al"
    var lastName = "Ng"
    var isStudent : Bool = true
    
    init (firstName : String, lastName : String, isStudent : Bool) {
        self.firstName = firstName
        self.lastName = lastName
        self.isStudent = isStudent
    }
    
    func fullName() {
        println(self.firstName + " " + self.lastName)
    }
   }

var myPerson = Person(firstName: "Bob", lastName: "Forapples", isStudent: true)
myPerson.fullName()
myPerson.firstName







