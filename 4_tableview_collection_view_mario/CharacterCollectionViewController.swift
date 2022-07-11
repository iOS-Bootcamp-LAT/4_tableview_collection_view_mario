//
//  CharacterCollectionViewController.swift
//  4_tableview_collection_view_mario
//
//  Created by David Granado Jordan on 6/6/22.
//

import UIKit

class CharacterCollectionViewController: UIViewController {

    
    @IBOutlet weak var collectionViewCell: UICollectionView!
    
    var characters: [Character] = []
    
    var charactersSectionTwo: [Character] = []
    var currentCharacter: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        loadDataTwo()
        collectionViewCell.dataSource = self
        collectionViewCell.delegate = self
        
        let uiNib = UINib(nibName: "CharacterCollectionViewCell", bundle: nil)
        collectionViewCell.register(uiNib, forCellWithReuseIdentifier: "CharacterCollectionViewCell")
        
        
    }

    func loadData() {
        characters = [
            Character(name: "Donkey Kong", description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words", imageName: "Donkey Kong"),
            
            Character(name: "Wario", description: "There are many variations of", imageName: "Wario"),
            
            Character(name: "Toad", description: "There are many variations of", imageName: "Toad"),
            
            Character(name: "Mario", description: "There are many variations of", imageName: "Mario"),
            
            Character(name: "Luigi", description: "There are many variations of", imageName: "Luigi"),
            
            Character(name: "Waluigi", description: "There are many variations of", imageName: "Waluigi"),
            
            Character(name: "Pink Gold Peach", description: "There are many variations of", imageName: "Pink Gold Peach"),
            Character(name: "Bowser", description: "There are many variations of", imageName: "Bowser"),
        ]
    }
    
    func loadDataTwo() {
        charactersSectionTwo = [
            Character(name: "Donkey Kong 2", description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words", imageName: "Donkey Kong"),
            
            Character(name: "Wario 2", description: "There are many variations of", imageName: "Wario"),
            
            Character(name: "Toad 2", description: "There are many variations of", imageName: "Toad"),
            
            Character(name: "Mario 2", description: "There are many variations of", imageName: "Mario"),
            
            Character(name: "Luigi 2", description: "There are many variations of", imageName: "Luigi"),
            
            Character(name: "Waluigi 2", description: "There are many variations of", imageName: "Waluigi"),
            
            Character(name: "Pink Gold Peach 2", description: "There are many variations of", imageName: "Pink Gold Peach"),
            Character(name: "Bowser 2", description: "There are many variations of", imageName: "Bowser"),
        ]
    }
}


extension CharacterCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewCell.dequeueReusableCell(withReuseIdentifier: "CharacterCollectionViewCell", for: indexPath) as? CharacterCollectionViewCell ?? CharacterCollectionViewCell()
        
        var character: Character!
        character = characters[indexPath.row]
        
        /*switch indexPath.section {
        case 0:
            character = characters[indexPath.row]
        case 1:
            character = charactersSectionTwo[indexPath.row]
        default:
            character = characters[indexPath.row]
        }*/
        
        cell.characterImageView.image = UIImage(named: character.imageName)
        cell.characterNameLabel.text = character.name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentCharacter = characters[indexPath.row]
        
        /*switch indexPath.section {
        case 0:
            currentCharacter = characters[indexPath.row]
        case 1:
            currentCharacter = charactersSectionTwo[indexPath.row]
        default:
            currentCharacter = characters[indexPath.row]
        }*/
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1 // 2
    }

    

    
    // FOR THIS TO WORK IT IS NECESSARY TO GO TO
     // DETAIL OF THE SIZE OF THE COLLECTION VIEW
     // AND CHANGE ITS "ESTIMATE SIZE" TO "NONE"
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width/4
        let height = collectionView.frame.width/4
        return CGSize(width: width, height: height)
    }
    
}
