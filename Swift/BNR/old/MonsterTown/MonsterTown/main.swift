//
//  main.swift
//  MonsterTown
//
//  Created by Lakshmi on 7/4/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation
var myTown = Town(region: "West", population: 10_000, stopLights: 6) // memberwise init Town() default init
let townSize = myTown.townSize
print(myTown.townSize)
myTown.changePopulation(by: 1_000_000)
print(myTown.townSize)
print(myTown.population)
//myTown.description()
//
//let genericMonster = Monster()
//genericMonster.town = myTown
//genericMonster.terrorizeTown()

// classes have inheritance

let fredTheZombie = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.description()

fredTheZombie.victimPool = 500

print("vp\(fredTheZombie.victimPool), population:\(String(describing: fredTheZombie.town?.population))")
