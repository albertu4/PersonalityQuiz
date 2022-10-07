//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var resultTitle: UILabel!
    @IBOutlet var resultDescription: UILabel!
    
    //MARK: - Public property
    var answersChosen: [Answer]!
    
    //MARK: - Private properties
    private var animals: [Animal : Int] = [:]
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        
        answersChosen.forEach() { answer in
            if animals.keys.contains(answer.animal) {
                animals[answer.animal]! += 1
                
                print("contains \(answer.animal)")
            } else {
                animals.updateValue(1, forKey: answer.animal)
                print("contains \(answer.animal)")
            }
        }
        
        print(animals)
        
        let sortedAnimals = animals.sorted { firstAnimal, secondAnimal in
            return firstAnimal.value > secondAnimal.value
        }
        
        resultTitle.text = "\(sortedAnimals.first?.key.rawValue ?? " ")"
        resultDescription.text = sortedAnimals.first?.key.definition
        }
    
}
