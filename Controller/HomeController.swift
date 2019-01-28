//
//  ViewController.swift
//  TextField
//
//  Created by Mezut on 08/01/2019.
//  Copyright © 2019 Mezut. All rights reserved.
//
//

import UIKit
import Foundation



class HomeController: UIViewController{
    
    var bottomLayouConstraint: NSLayoutConstraint!
    
    
    let secondScreen = PageController()
    
    
    let imageView: UIImageView = {
       let image = UIImageView(image: #imageLiteral(resourceName: "Beginning"))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let button: UIButton = {
       let button = UIButton()
        button.setTitle("Start Your Adventure", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(nextButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let textField: UITextField = {
       let inputField = UITextField()
        inputField.borderStyle = .roundedRect
        inputField.layer.borderWidth = 1
        inputField.allowsEditingTextAttributes = true
        inputField.layer.cornerRadius = 3
        inputField.layer.masksToBounds = true
        inputField.translatesAutoresizingMaskIntoConstraints = false
        return inputField
    }()
    
    
    
    @objc func nextButton()  {
        print("Button Clicked")
        do {
            if let text = textField.text {
                if text == "" {
                    throw StoryError.nameRequired
                } else {
                    navigationController?.pushViewController(secondScreen, animated: true)
                    secondScreen.page = Adventure.story(withName: text)
                }
            }
            
        } catch StoryError.nameRequired{
            let alertController = UIAlertController(title: "Name not provided", message: "Provide a name to start the story adventure", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
    
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        } catch let error {
            fatalError(error.localizedDescription)
        }
 
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back ", style: .plain, target: nil, action: nil)
        view.backgroundColor = .white
    
        view.addSubview(imageView)
        view.addSubview(button)
        view.addSubview(textField)
     
        setupViews()
    
        // Observer for the keyboard when showed
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIWindow.keyboardWillShowNotification, object: nil)
    

    }
    
    func setupViews() {
        let guide = view.safeAreaLayoutGuide
      

        bottomLayouConstraint = textField.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -40)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: guide.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            
            button.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -40),
            button.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            
            textField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 24),
            textField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -24),
            textField.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -40),
            bottomLayouConstraint
        
            ])
    }
    
    

    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardInfo = notification.userInfo, let keyboardFrame = keyboardInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue{
            let frame = keyboardFrame.cgRectValue
            let topConstant = frame.size.height + 10
            bottomLayouConstraint.constant = -topConstant
        }
 
    }
    
    
    
   
    
    

   
    
}



















