//
//  ViewController.swift
//  ThreeLetterWordHackwich
//
//  Created by isa fontana on 3/31/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var wordLabels: [UILabel]!
    
    @IBOutlet weak var currentLetterLabel: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBAction func whenTapped(_ sender: UITapGestureRecognizer) {
        let selectedPoint = sender.location(in: stackView)
//        print(selectedPoint)
        
        for label in wordLabels {
            if label.frame.contains(selectedPoint) {
                label.text = currentLetter
            }
        }
        counter += 1
        
        if counter == 26{
            counter = resetCounter()
        }
        
        currentLetter = letters[counter]
        currentLetterLabel.text = currentLetter
    }
    
    var letters: [String] =
    ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    var counter: Int = 0
    var currentLetter: String! = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getAndSetCurrentLetter()
//        currentLetter = letters[counter]
//        currentLetterLabel.text = currentLetter
        
        
        
        
    }
    func getAndSetCurrentLetter() {
    currentLetter = letters[counter]
    currentLetterLabel.text = currentLetter
    }
    
    func resetCounter () -> Int {
    let alert = UIAlertController(title: "Resetting Counter", message: nil, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
    for label in self.wordLabels {
    label.text = "?"
    }
    }
    alert.addAction(okAction)
    present(alert, animated: true, completion: nil)
    return 0
    }
}

