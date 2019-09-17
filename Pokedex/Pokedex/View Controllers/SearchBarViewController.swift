//
//  SearchBarViewController.swift
//  Pokedex
//
//  Created by Lambda_School_Loaner_101 on 9/16/19.
//  Copyright © 2019 Ife Banire. All rights reserved.
//

import UIKit

class SearchBarViewController: UIViewController {
    
    

    private let pokedexController = PokedexController()
    
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            
            guard let searchTerm = searchBar.text else { return }
            
            pokedexController.searchForPokedex(with: searchTerm) {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
    }
}
