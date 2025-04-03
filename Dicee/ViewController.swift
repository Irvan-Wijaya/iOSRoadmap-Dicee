//
//  ViewController.swift
//  Dicee
//
//  Created by Irvan Wijaya on 03/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageViewLeft: UIImageView!
    @IBOutlet weak var diceImageViewRight: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diceImageViewLeft.image = UIImage(named: "DiceSix")
        diceImageViewRight.image = UIImage(named: "DiceTwo")
        
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        diceImageViewLeft.image = UIImage(named: "DiceFive")
        diceImageViewRight.image = UIImage(named: "DiceFive")
    }
    
}

