//
//  PokedexTableViewCell.swift
//  Pokedex
//
//  Created by Lambda_School_Loaner_101 on 9/16/19.
//  Copyright © 2019 Ife Banire. All rights reserved.
//

import UIKit

class PokedexTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    var pokedex: Pokedex? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let pokedex = pokedex else { return }
        
        nameLabel.text = pokedex.name
    }
}
