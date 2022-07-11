//
//  ViewController.swift
//  4_tableview_collection_view_mario
//
//  Created by David Granado Jordan on 6/3/22.
//

import UIKit

struct Character {
    public var name: String
    public var description: String
    public var imageName: String
}

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var characters: [Character] = []
    
    var charactersSectionTwo: [Character] = []
    var currentCharacter: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        loadDataSectionTwo()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        let uiNib = UINib(nibName: "CharacterTwoTableViewCell", bundle: nil)
        tableView.register(uiNib, forCellReuseIdentifier: "MyCellTest")
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
    
    
    func loadDataSectionTwo() {
        charactersSectionTwo = [
            Character(name: "Donkey Kong 2", description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words", imageName: "Donkey Kong"),
            
            Character(name: "Wario2 ", description: "There are many variations of", imageName: "Wario"),
            
            Character(name: "Toad2 ", description: "There are many variations of", imageName: "Toad"),
            
            Character(name: "Mario 2", description: "There are many variations of", imageName: "Mario"),
            
            Character(name: "Luigi 2", description: "There are many variations of", imageName: "Luigi"),
            
            Character(name: "Waluigi 2", description: "There are many variations of", imageName: "Waluigi"),
            
            Character(name: "Pink Gold Peach 2", description: "There are many variations of", imageName: "Pink Gold Peach"),
            Character(name: "Bowser 2", description: "There are many variations of", imageName: "Bowser"),
        ]
    }
    
    

}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    
    // ONE
    /*func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCellTest", for: indexPath) ?? UITableViewCell(style: .subtitle, reuseIdentifier: "MyCellTest")
        
        let character = characters[indexPath.row]
        
        
        cell.textLabel?.text = "Name: \(character.name)"
        cell.detailTextLabel?.text = "Desc: \(character.description)"
        cell.imageView?.image = UIImage(named: character.imageName)
        
        return cell
    }*/
    
    
    // Two
    /*func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // for: indexPath
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCellTest", for: indexPath) as? CharacterTableViewCell ?? CharacterTableViewCell(style: .subtitle, reuseIdentifier: "MyCellTest")
        
        let character = characters[indexPath.row]
        
        
        cell.characterImageView.image = UIImage(named: character.imageName)
        cell.characterNameLabel.text = "Name: \(character.name)"
        cell.characterDesLabel.text = "Desc: \(character.description)"

        
        return cell
    }*/
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // newer dequeue method guarantees a cell is returned and resized properly, assuming identifier is registered
        // for: indexPath
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCellTest", for: indexPath) as? CharacterTwoTableViewCell ?? CharacterTwoTableViewCell(style: .subtitle, reuseIdentifier: "MyCellTest")
    
        
        //let character = characters[indexPath.row]
        var character: Character!
        
        switch indexPath.section {
        case 0:
            character = characters[indexPath.row]
        case 1:
            character = charactersSectionTwo[indexPath.row]
        default:
            character = characters[indexPath.row]
        }
        
        
        
        cell.characterImageView.image = UIImage(named: character.imageName)
        cell.characterNameLabel.text = "Name: \(character.name)"
        cell.characterDesLabel.text = "Desc: \(character.description)"

        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentCharacter = characters[indexPath.row]
        
        performSegue(withIdentifier: "GoToDetailViewController", sender: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Section One"
        }
        return "Section Two"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "GoToDetailViewController",
           let destination = segue.destination as? DetailViewController,
           let currentCharacter = currentCharacter {
            

            destination.character = currentCharacter
        }
    }
    
}
