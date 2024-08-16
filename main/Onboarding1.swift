//
//  Onboarding1.swift
//  Project!
//
//  Created by Ellie Wu on 4/13/24.
//

import UIKit

class Onboarding1: UIViewController {
    

    @IBOutlet weak var stone: UIImageView!
    
    @IBOutlet weak var felix: UIImageView!
    
    
    @IBOutlet weak var cake: UIImageView!
    
    
    @IBOutlet weak var wand: UIImageView!
    
    
    @IBOutlet weak var babydragon: UIImageView!
    
    
    
    @IBOutlet weak var star: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stone.alpha = 0.0
        self.felix.alpha = 0.0
        self.cake.alpha = 0.0
        self.wand.alpha = 0.0
        self.babydragon.alpha = 0.0
        self.star.alpha = 0.0
        fadeAnimation()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func fadeAnimation() {
        // Fade in
        UIView.animate(withDuration: 3.0, animations: {
            self.stone.alpha = 1.0
            self.felix.alpha = 1.0
            self.cake.alpha = 1.0
            self.wand.alpha = 1.0
            self.babydragon.alpha = 1.0
            self.star.alpha = 1.0
            
        
        })
        
    }
}
