//
//  MyDemographicsViewController.swift
//  StudyBuddy
//
//  Created by Lekha Adari on 7/25/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation
import UIKit

class MyDemographicsViewController : UIViewController, UITextFieldDelegate {
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
  //      let post = Post(subject: "Math", classNum: "101", duration: "2h", userID: "12345543etyf")
//        PostService.create(for: post) { (completedPost) in
//            print(completedPost)
//
//       }
        
        
        
        PostService.show { (allPosts) in
            print(allPosts)
        }

        subjectTextField.delegate = self
        classTextField.delegate = self
        durationTextField.delegate = self
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    /**
     * Called when the user click on the view (outside the UITextField).
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFeedFromDone" {
            let vc = segue.destination as! FeedViewController
            
//            self.present(vc, animated: true, completion: nil)
//            self.performSegue(withIdentifier: "toFeedFromDone", sender: nil)
//            self.shouldPerformSegue(withIdentifier: "toFeedFromDone", sender: self)
        }
    }
    

    
    

    @IBAction func doneButtonTapped(_ sender: Any) {
        let user = User.current
//        let post = Post(subject: subjectTextField.text!, classNum: classTextField.text!, duration: durationTextField.text!, userID: user.uid, userName: user.username)
        let post = Post(subject: subjectTextField.text!, classNum: classTextField.text!, duration: durationTextField.text!, user: user)
        
        PostService.create(for: post) { (completedPost) in
            print(completedPost)
            
        }
        
        subjectTextField.text = ""
        classTextField.text = ""
        durationTextField.text = ""
//        self.performSegue(withIdentifier: "toFeedFromDone", sender: self)
        tabBarController?.selectedIndex = 1
        
    }
    



}



