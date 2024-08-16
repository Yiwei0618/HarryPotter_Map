//
//  PopoverPage.swift
//  Project!
//
//  Created by Ellie Wu on 4/24/24.
//

import UIKit




class PopoverPage: UIViewController, UITextViewDelegate {
    
   

    @IBOutlet weak var addAction: UIButton!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    @IBOutlet weak var imageLabel: UILabel!
    
    
    @IBOutlet weak var shotText: UITextView!
    
    @IBOutlet weak var factText: UITextView!
    
    @IBOutlet weak var movieView: UITextView!
    
    
    var image = UIImage()
    var name = ""
    var text = ""
    var shot = ""
    var fact = ""
    var place: Place!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieView.delegate = self
        self.shotText.delegate = self
        self.factText.delegate = self

        imageView.image = image
        imageLabel.text = name
        movieView.text = text
        shotText.text = shot
        factText.text = fact
        
        
        let idx = favListArray.firstIndex(where: { $0.title == name })
        if idx != nil {
            addAction.setTitle("-", for: UIControl.State.normal)
        }
        else {
            addAction.setTitle("+", for: UIControl.State.normal)
        }
    }
    
    @IBAction func favoritesButton(_ sender: Any) {
//        print("ENTERING BUTTON")
        let idx = favListArray.firstIndex(where: { $0.title == name })
        if idx != nil {
//            print("HERE 1")
            addAction.setTitle("+", for: UIControl.State.normal)
            favListArray.remove(at: idx!)
        }
        else {
//            print("HERE 2")
            addAction.setTitle("-", for: UIControl.State.normal)
            favListArray.append(place!)
        }
//        print(favListArray)
    }
    
    
}
