//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответствии с этим животным
    // 4. Избавиться от кнопки возврата на предыдущий экран
    
    //MARK: - IBOutlets
    @IBOutlet var resultTitle: UILabel!
    @IBOutlet var resultDescription: UILabel!
    
    //MARK: - Public property
    var answersChosen: [Answer]!
    
    //MARK: - Private properties
    private var animals: [[Animal]] = []
    
    private var dogs: [Animal] = []
    private var cats: [Animal] = []
    private var rabbits: [Animal] = []
    private var turtles: [Animal] = []
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        
        answersChosen.forEach {
            switch $0.animal {
            case .dog:
                dogs.append($0.animal)
            case .cat:
                cats.append($0.animal)
            case .rabbit:
                rabbits.append($0.animal)
            default:
                turtles.append($0.animal)
            }
        }
        animals.append(dogs)
        animals.append(cats)
        animals.append(rabbits)
        animals.append(turtles)
        
        let maxChosenAnimal = animals.max { a, b in a.count < b.count}
        
        maxChosenAnimal?.forEach {
            if $0 == .dog {
                resultTitle.text = String(Animal.dog.rawValue)
                resultDescription.text = Animal.dog.definition
            } else if $0 == .cat {
                resultTitle.text = String(Animal.cat.rawValue)
                resultDescription.text = Animal.cat.definition
            } else if $0 == .rabbit {
                resultTitle.text = String(Animal.rabbit.rawValue)
                resultDescription.text = Animal.rabbit.definition
            } else {
                resultTitle.text = String(Animal.turtle.rawValue)
                resultDescription.text = Animal.turtle.definition
            }
        }
    }
    
}
