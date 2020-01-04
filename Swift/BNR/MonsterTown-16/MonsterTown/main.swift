//
//  main.swift
//  MonsterTown
//
//  Created by Lakshmi on 1/7/18.
//  Copyright © 2018 com.arunsivakumar. All rights reserved.
//

import Foundation

var myTown = Town()
myTown.changePopulation(by: 1_000_000)
print("Size: \(myTown.townSize), population: \(myTown.population)")
//myTown.changePopulation(by: 500)
//myTown.printDescription()

//let genericMonster = Monster()
//genericMonster.town = myTown
//genericMonster.terrorizeTown()


let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown() //change population
fredTheZombie.town?.printDescription()


print("VP: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
print("VP: \(fredTheZombie.victimPool), population: \(String(describing: fredTheZombie.town?.population))") // chapter 22

print(Zombie.spookyNoise)

if Zombie.isTerrifying{
    print("run away")
}
