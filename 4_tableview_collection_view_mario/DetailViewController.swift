//
//  DetailViewController.swift
//  4_tableview_collection_view_mario
//
//  Created by David Granado Jordan on 6/6/22.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var characterImageView: UIImageView!
    
    @IBOutlet weak var characterNameLabel: UILabel!
    
    @IBOutlet weak var characterDesLabel: UILabel!

    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }

    
    func setupViews() {
        if let character = character {
            title = character.name
            characterImageView.image = UIImage(named: character.imageName)
            characterNameLabel.text = character.name
            characterDesLabel.text = character.description
        }
    }

}
