//
//  main.swift
//  Protocols
//
//  Created by Lakshmi on 7/15/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation

protocol TabularDataSource{
    var numberOfRows:Int{get} //conforming could have read write
    var numberOfColumns:Int{get}
    
    func label(forColumn column:Int) -> String
    func itemFor(row:Int,column:Int) ->String
}


func printTable(_ dataSource:TabularDataSource & CustomStringConvertible){
    print("Table: \(dataSource.description)")
    
    
    var firstRow = "|"
    
    // keep track of columns
    var columnWidths = [Int]()
    
    // Computation: fnd max column width - o(n)
    
    for i in 0 ..< dataSource.numberOfColumns{
         let columnLabel = dataSource.label(forColumn: i)
         columnWidths.append(columnLabel.count)
    }
    
    
    for i in 0 ..< dataSource.numberOfRows{
        for j in 0 ..< dataSource.numberOfColumns{
            let item = dataSource.itemFor(row: i, column: j)
            if item.count > columnWidths[j] {
                columnWidths[j] = item.count
            }
        }
    }
    
    
    
    //    for columnLabel in columnLabels{
    for i in 0 ..< dataSource.numberOfColumns{
        
        let columnLabel = dataSource.label(forColumn: i)
        let paddingNeeded = abs(columnWidths[i] - columnLabel.count)
        let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
        firstRow += " \(padding)\(columnLabel) |"
    }
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows{
        
        var out = "|"
        
        for j in 0 ..< dataSource.numberOfColumns{
            
            let item = dataSource.itemFor(row: i, column: j)
            
            let paddingNeeded = abs(columnWidths[j] - item.count)
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            out += " \(padding)\(item) |"
        }
        
        //print out
        print(out)
    }
}



struct Person {
    let name:String
    let age:Int
    let yearsOFExperience:Int
}

struct Department:TabularDataSource,CustomStringConvertible{
    let name:String
    var people = [Person]()
    
    
    init(name:String){
        self.name = name
    }
    
    mutating func add(_ person:Person){
        people.append(person)
    }
    
    var description: String{
        return "Department (\(name))"
    }
    var numberOfRows: Int{
        return people.count
    }
    var numberOfColumns: Int{
        return 3
    }
    func label(forColumn column:Int) -> String{
        switch column {
        case 0: return "Employee Name"
        case 1: return "Age"
        case 2: return "Years of Experience"
        default: fatalError("Invalid column!")
        }
        
    }
    func itemFor(row:Int,column:Int) ->String{
        let person = people[row]
        switch column {
        case 0: return person.name
        case 1: return String(person.age)
        case 2: return String(person.yearsOFExperience)
        default: fatalError("Invalid column!")
        }
    }
}

var department = Department(name: "Engineering")
department.add(Person(name: "Joe", age: 1000, yearsOFExperience: 2))
department.add(Person(name: "Karen", age: 23, yearsOFExperience: 1))
department.add(Person(name: "Fred", age: 25, yearsOFExperience: 24))

printTable(department)
//print(department)
