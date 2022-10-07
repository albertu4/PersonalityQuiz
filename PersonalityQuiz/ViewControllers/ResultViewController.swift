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
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        updateResult()
    }
    
    private func updateResult() {
        
        var animals: [Animal : Int] = [:]
        let animalsArray = answersChosen.map { $0.animal }
        
        for animal in animalsArray {
            if let animalTypeCount = animals[animal] {
                animals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                animals[animal] = 1
            }
        }
        
        let sortedAnimals = animals.sorted { $0.value > $1.value }
        guard let mostOftenChosenAnimal = sortedAnimals.first?.key else { return }
        
        updateUI(mostOftenChosenAnimal)
    }
    
    private func updateUI(_ animal: Animal) {
        resultTitle.text = String(animal.rawValue)
        resultDescription.text = animal.definition
        
    }
    
}
