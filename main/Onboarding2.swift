//
//  Onboarding2.swift
//  Project!
//
//  Created by Ellie Wu on 4/27/24.
//

import UIKit

class Onboarding2: UIViewController {
    
    
    @IBOutlet weak var footprint1: UIImageView!
    
    
    @IBOutlet weak var footprint2: UIImageView!
    
    
    @IBOutlet weak var footprint3: UIImageView!
    
    
    @IBOutlet weak var footprint4: UIImageView!
    
    
    @IBOutlet weak var line: UIImageView!
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.footprint1.alpha = 0.0
        self.footprint2.alpha = 0.0
        self.footprint3.alpha = 0.0
        self.footprint4.alpha = 0.0
        self.line.alpha = 0.0
        fadeAnimation()
        
        
        func fadeAnimation() {
        
            UIView.animate(withDuration: 1.0, animations: {
                self.line.alpha = 1.0
            }) { _ in
        
                UIView.animate(withDuration: 1.0, animations: {
                    self.footprint1.alpha = 1.0
                }) { _ in
                   
                    UIView.animate(withDuration: 1.0, animations: {
                        self.footprint2.alpha = 1.0
                    }) { _ in
                   
                        UIView.animate(withDuration: 1.0, animations: {
                            self.footprint3.alpha = 1.0
                        }) { _ in
                   
                            UIView.animate(withDuration: 1.0) {
                                self.footprint4.alpha = 1.0
                            }
                        }
                    }
                }
            }
        }
    }
}
