//
//  SecondScreenViewController.swift
//  TextField
//
//  Created by Mezut on 08/01/2019.
//  Copyright © 2019 Mezut. All rights reserved.
//

import UIKit


extension NSAttributedString{
    var stringRange: NSRange {
        return NSMakeRange(0, self.length)
    }
}

extension Story {
     var styleText: NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphString = NSMutableParagraphStyle()
        paragraphString.lineSpacing = 10
        attributedString.addAttribute(.paragraphStyle, value: paragraphString, range: attributedString.stringRange)
        
        return attributedString
    }
}

class PageController: UIViewController {
    
    var page: Page?
    
    // MARK: - User Interface Properties
    let artworkView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ReturnTrip")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var storyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.attributedText = self.page?.story.styleText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var firstChoiceBtn: UIButton = {
        let button = UIButton(type: .system)
        let buttonText = self.page?.firstChoice?.title ?? "Play Again"
        let selector = self.page?.firstChoice != nil ? #selector(self.loadFirstChoice) : #selector
        (self.loadFirstChapter)
        
        button.setTitle(buttonText, for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    
    lazy var secondChoiceBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(self.page?.secondChoice?.title, for: .normal)
        button.addTarget(self, action: #selector(self.loadSecondChoice), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    @objc func loadsomething() {
        if let page = page, let firstPage = page.firstChoice?.page{
            print(firstPage.story)
        }
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(page: Page?){
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(){
        self.init(page: nil)
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()



       view.backgroundColor = .white
        
        view.addSubview(artworkView)
        view.addSubview(storyLabel)
        view.addSubview(firstChoiceBtn)
        view.addSubview(secondChoiceBtn)
        
        
        
 
        
        // Layout User interface
        
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
              artworkView.leadingAnchor.constraint(equalTo:guide.leadingAnchor, constant: 0),
              artworkView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 0),
              artworkView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 0),
              artworkView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 0),
              
              storyLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 16.0),
              storyLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -16.0),
              storyLabel.topAnchor.constraint(equalTo: guide.centerYAnchor, constant: -48.0),
              
              firstChoiceBtn.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
              firstChoiceBtn.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -80.0),
              
              secondChoiceBtn.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
              secondChoiceBtn.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -32.0),
              
            ])
        
        
        
        
   
    }
    
    @objc func loadFirstChoice() {
        if let page = page, let firstChoice = page.firstChoice {
            let nextPage = firstChoice.page
            let nextPageController = PageController(page: nextPage)
            navigationController?.pushViewController(nextPageController, animated: true)
            print(page.firstChoice?.page)
        }
    }
    
    @objc func loadSecondChoice() {
        if let page = page, let secondChoice = page.secondChoice {
            let nextPage = secondChoice.page
            let nextPageController = PageController(page: nextPage)
            navigationController?.pushViewController(nextPageController, animated: true)
        }
    }
    
    
    // Go back to the first Chapter when the story end
    
    @objc func loadFirstChapter(){
        navigationController?.popToRootViewController(animated: true)
        
    }

    


}



