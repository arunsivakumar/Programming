//
//  main.swift
//  MonsterTown
//
//  Created by Lakshmi on 1/7/18.
//  Copyright © 2018 com.arunsivakumar. All rights reserved.
//

import Foundation

var myTown = Town(population: 10_000, stoplights: 6) // values replace default values
myTown.printDescription()

myTown.changePopulation(by: 1_000_000)
print("Size: \(myTown.townSize), population: \(myTown.population)")


let fredTheZombie = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")
//let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown() //change population
fredTheZombie.town?.printDescription()


print("VP: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
print("VP: \(fredTheZombie.victimPool), population: \(String(describing: fredTheZombie.town?.population))") // chapter 22

var convenientZombie = Zombie(limp: true, fallingApart: false)

var requiredZombie = Zombie(town: myTown, monsterName: "ConvinientFred")
