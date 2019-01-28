//
//  Page.swift
//  TextField
//
//  Created by Mezut on 10/01/2019.
//  Copyright © 2019 Mezut. All rights reserved.
//

import Foundation
import UIKit



class Page {
    let story: Story
    var firstChoice: Choice?
    var secondChoice: Choice?
    
    init(story: Story) {
        self.story = story
    }

}

struct Choice {
    let title: String
    let page: Page
}







// Helper Function for the Page


extension Page {
    
    func addChoiceWith(title: String, story: Story) -> Page {
        let page = Page(story: story)
        return addChoiceWith(title: title, page: page)
    }
    func addChoiceWith(title: String, page: Page) -> Page {
        
        switch (firstChoice, secondChoice) {
         case (.some, .some): return self
         case (.none, .none), (.none, .some): firstChoice = Choice(title: title, page: page)
         case (.some, .none): secondChoice = Choice(title: title, page: page)
        }
        
        return page
}
}





