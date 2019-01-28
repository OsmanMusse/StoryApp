//
//  Adventure.swift
//  TextField
//
//  Created by Mezut on 11/01/2019.
//  Copyright © 2019 Mezut. All rights reserved.
//

import Foundation


// Wrapper Object
struct Adventure {
    static func story(withName name: String) -> Page {
    let returnTrip = Page(story: .returnTrip(name: name))
        let touchdown = returnTrip.addChoiceWith(title: "Stop and Investigate", story: .touchDown)
        let homeward = returnTrip.addChoiceWith(title: "Continue home to Earth", story: .homeward(name: name))
        
        let rover = touchdown.addChoiceWith(title: "Explore the Rover", story: .rover)
        let crate = touchdown.addChoiceWith(title: "Open the Crate", story: .crate)
        
        let cave = rover.addChoiceWith(title: "Explore the Coordinates", story: .cave(name: name))
        let home = homeward.addChoiceWith(title: "Continue Home to Earth", story: .home)
        
        
        
        homeward.addChoiceWith(title: "Head back to Mars", page: touchdown)
    
        rover.addChoiceWith(title: "Return to Earth", page: home)
        
        cave.addChoiceWith(title: "Continue towards faint light", story: .droid)
        cave.addChoiceWith(title: "Refill the ship and explore the rover", page: rover)
        
        crate.addChoiceWith(title: "Explore the Rover", page: rover)
        crate.addChoiceWith(title: "Use the key", story: .monster)
        
        return returnTrip
    }
}

