import UIKit

var str = "Hello, playground"


class Helper {
    static func changeTo( person: inout Person, firstName: String, lastName: String) {
        person.firstName = firstName
        person.lastName = lastName
    }
}


struct Person {
    var firstName = "Arun"
    var lastName = "Sivakumar"
    
    mutating func changeTo(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

var p = Person()
p.firstName
p.lastName

Helper.changeTo(person: &p, firstName: "Bruce", lastName: "Wayne")

p.firstName
p.lastName

