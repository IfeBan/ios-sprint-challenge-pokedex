//
//  PokedexViewController.swift
//  Pokedex
//
//  Created by Lambda_School_Loaner_101 on 9/16/19.
//  Copyright © 2019 Ife Banire. All rights reserved.
//

import UIKit

class PokedexTableViewController: UIViewController {

    
        private let pokedexController = PokedexController()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.dataSource = self
        }
    
        
    }
    
    extension PokedexSearchTableViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return pokedexController.pokedex.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokedexCell", for: indexPath) as? PersonTableViewCell else {
                return UITableViewCell()
            }
            
            let person = pokedexController.pokedex[indexPath.row]
            cell.pokedex = pokedex
        
            return cell
        }
    }

        
}


   
