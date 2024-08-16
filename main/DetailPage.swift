//
//  DetailPage.swift
//  Project!
//
//  Created by Ellie Wu on 4/14/24.
//

import UIKit

class DetailPage: UIViewController {

    
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
    
       
       
       override func viewDidLoad() {
           super.viewDidLoad()
           imageView.image = image
           imageLabel.text = name
           movieView.text = text
           shotText.text = shot
           factText.text = fact
          
           // Set the detail label text
    
    }
    

}
