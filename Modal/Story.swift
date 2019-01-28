//
//  Story.swift
//  TextField
//
//  Created by Mezut on 10/01/2019.
//  Copyright © 2019 Mezut. All rights reserved.
//

import Foundation
import UIKit

enum StoryError: Error {
    case nameRequired
}

enum Story {
    case returnTrip(name: String)
    case touchDown
    case homeward(name: String)
    case rover
    case cave(name: String)
    case crate
    case monster
    case droid
    case home

}


// Functionality of the Story Enum




extension Story {
     var storyImg: UIImageView {
        switch self {
        case .returnTrip : return UIImageView(image: #imageLiteral(resourceName: "Homeward"))
        case .touchDown  : return UIImageView(image: #imageLiteral(resourceName: "Homeward"))
        case .homeward   : return UIImageView(image: #imageLiteral(resourceName: "Homeward"))
        case .rover      : return UIImageView(image: #imageLiteral(resourceName: "Homeward"))
        case .cave       : return UIImageView(image: #imageLiteral(resourceName: "Homeward"))
        case .crate      : return UIImageView(image: #imageLiteral(resourceName: "Homeward"))
        case .monster    : return UIImageView(image: #imageLiteral(resourceName: "Homeward"))
        case .droid      : return UIImageView(image: #imageLiteral(resourceName: "Homeward"))
        case .home       : return UIImageView(image: #imageLiteral(resourceName: "Homeward"))
        }
    }
    
    
    var text: String {
        switch self {
        case .returnTrip(let name):
            return "\(name), On your return trip from studying Saturn's rings, you hear a distress signal that seems to be coming from the surface of Mars. It's strange because there hasn't been a colony there in years. Help me, you're my only hope"
        case .touchDown:
            return "You deftly land your ship near where the distress signal originated. You didn't notice anything strange on your fly-by, behind you is an abandoned rover from the early 21st century and a small crate."
        case .homeward(let name):
            return "You continue your course to Earth. Two days later, you receive a transmission from HQ saing that they have detected some sort of anomaly on the surface of Mars near an abandoned rover. They ask you to investigate, but ultimately the decision is \(name) because your mission has already run much longer than planned and supplies are low."
        case .rover:
            return "The rover is covered in dust and most of the solar panels are broken. But you are quite surprised to see the on-board system booted up and running. In fact, there is a message on the screen. Come to 28.2342, -81.08273. These coordinates aren't far but you don't know if your oxygen will last there and back."
        case .cave(let name):
            return "Your EVA suit is equipped with a headlamp which you use to navigate to a cave. After searching for a while your oxygen levels are starting to get pretty low. You know you should go refill your tank, but there's a faint light up ahead \(name)"
        case .crate:
            return "Unlike everything else around you the crate seems new and...alien. As you examine the create you notice something glinting on the ground beside it. Aha, a key! It must be for the crate..."
        case .monster:
            return "You pick up the key and try to unlock the crate, but the key breaks off in the keyhole.You scream out in frustration! Your scream alerts a creature that captures you and takes you away..."
        case .droid:
            return "After a long walk slightly uphill, you end up at the top of a small crater. You look around and are overjoyed to see your robot friend, Droid-S1124. It had been lost on a previous mission to Mars. You take it back to your ship and fly back to Earth."
        case .home:
            return "You arrive home on Earth. While your mission was a success, you forever wonder what was sending that signal. Perhaps a future mission will be able to investigate."
        }
    }
}




