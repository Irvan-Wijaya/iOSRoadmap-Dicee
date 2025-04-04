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
    }

    // MARK: - Shake Animation
    func shakeDice(_ imageView: UIImageView) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: imageView.center.x - 5, y: imageView.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: imageView.center.x + 5, y: imageView.center.y))
        imageView.layer.add(animation, forKey: "position")
    }

    // MARK: - Fade-in Animation for Images
    func fadeInNewImage(_ imageView: UIImageView, newImage: UIImage) {
        UIView.transition(with: imageView, duration: 0.3, options: .transitionCrossDissolve, animations: {
            imageView.image = newImage
        }, completion: nil)
    }

    // MARK: - Button Press Animation
    func buttonPressAnimation(_ button: UIButton) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                           button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                       },
                       completion: { _ in
                           UIView.animate(withDuration: 0.1) {
                               button.transform = CGAffineTransform.identity
                           }
                       })
    }
    
    // MARK: - Roll Button Action
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        buttonPressAnimation(sender)
        
        let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
        
        // Shake Dice Images
        shakeDice(diceImageViewLeft)
        shakeDice(diceImageViewRight)
        
        // Delay for shake effect and then update images
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.fadeInNewImage(self.diceImageViewLeft, newImage: diceArray.randomElement()!)
            self.fadeInNewImage(self.diceImageViewRight, newImage: diceArray.randomElement()!)
        }
        
        // randomElement: It returns an optional (UIImage?), which means it could be nil if the array is empty, but since diceArray is not empty, this should always return a valid dice image.
        // [Int.random(in: 0...5): generates a random number between 0 and 5 (inclusive).This number is then used as an index to fetch an image from diceArray. | Cons if the array fewer or more it will cause crash.
    }
}
