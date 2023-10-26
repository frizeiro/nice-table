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
    
    private lazy var sections: [NiceTableSection] = {
        [
            NiceTableSection(
                animals,
                title: "Animals"
            ),
            NiceTableSection(
                transportation,
                title: "Transportation"
            )
        ]
    }()
    
    private lazy var animals: [NiceTableItem] = {
        [
            NiceContentItem(.description(
                label: "Birds",
                text: "Birds are a group of warm-blooded vertebrates constituting the class Aves.",
                image: image("bird.fill")
            )),
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
    
    private lazy var transportation: [NiceTableItem] = {
        [
            NiceContentItem(.description(
                label: "Car",
                text: "A vehicle that has wheels, carries a small number of passengers, and is moved by an engine or a motor.",
                image: image("car")
            )),
            NiceContentItem(.description(
                label: "Bus",
                text: "A large motor vehicle, having a long body, equipped with seats or benches for passengers, usually operating as part of a scheduled service.",
                image: image("bus")
            )),
            NiceContentItem(.description(
                label: "Cablecar",
                text: "Cable railway, in which the vehicle rests on rails or a road. Cable car (railway), a type of cable transportation used for mass transit.",
                image: image("cablecar")
            ))
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Examples"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView?.sections = sections
    }
    
    private func image(_ named: String) -> UIImage? {
        if #available(iOS 13.0, *) {
            return UIImage(systemName: named)
        } else {
            return nil
        }
    }
    
}
