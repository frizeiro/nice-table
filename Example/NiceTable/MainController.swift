//
//  MainController.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 10/13/2023.
//  Copyright (c) 2023 Felipe Frizeiro. All rights reserved.
//

import UIKit
import NiceTable

class MainController: NiceTableViewController {
    
    // MARK: - Private Variables
    
    private lazy var sections: [NiceTableSection] = {
        [
            NiceTableSection(
                contentCellIcon,
                title: "Content Item with icon"
            ),
            NiceTableSection(
                contentCell,
                title: "Content Item without icon"
            ),
            NiceTableSection(
                switchItems,
                title: "Switch Item"
            )
        ]
    }()
    
    private lazy var contentCellIcon: [NiceTableItem] = {
        [
            NiceContentItem(.description(
                label: "Dogs",
                text: "A dog is a domestic mammal of the family Canidae and the order Carnivora.",
                image: image("dog.fill")
            )),
            NiceContentItem(.description(
                label: "Cats",
                text: "Cats are graceful, carnivorous (meat-eating) mammals with sharp teeth and claws.",
                image: image("cat.fill")
            ))
        ]
    }()
    
    private lazy var contentCell: [NiceTableItem] = {
        [
            NiceContentItem(.description(
                label: "Aves",
                subtitle: "Warm-blooded vertebrates",
                text: "Birds are a group of warm-blooded vertebrates constituting the class Aves. Which is further divided into orders.",
                title: "Birds",
                footer: "Orders are groups of birds with similar characteristics"
            ))
        ]
    }()
    
    private lazy var switchItems: [NiceTableItem] = {
        [
            NiceSwitchItem(.description(
                label: "Car",
                text: "Do you have a car?",
                image: image("car"),
                footer: "A vehicle that has wheels, carries a small number of passengers, and is moved by an engine or a motor."
            )),
            NiceSwitchItem(.description(
                label: "Bus",
                text: "Do you go work by bus?",
                image: image("bus")
            ))
        ]
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Examples"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView?.sections = sections
    }
    
    // MARK: - Private Methods
    
    private func image(_ named: String) -> UIImage? {
        if #available(iOS 13.0, *) {
            return UIImage(systemName: named)
        } else {
            return nil
        }
    }
    
}
