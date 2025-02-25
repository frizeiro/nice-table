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
                segmentedItems,
                title: "Segmented Item"
            ),
            NiceTableSection(
                inputTextItems,
                title: "Input Text Item"
            ),
            NiceTableSection(
                switchItems,
                title: "Switch Item"
            )
        ]
    }()
    
    private lazy var contentCellIcon: [NiceTableItem] = {
        [
            NiceContentItem(Description(
                label: "Dogs",
                text: "A dog is a domestic mammal of the family Canidae and the order Carnivora.",
                image: image("dog.fill")
            )),
            NiceContentItem(Description(
                label: "Cats",
                text: "Cats are graceful, carnivorous (meat-eating) mammals with sharp teeth and claws.",
                image: image("cat.fill")
            ))
        ]
    }()
    
    private lazy var contentCell: [NiceTableItem] = {
        [
            NiceContentItem(Description(
                label: "Aves",
                subtitle: "Warm-blooded vertebrates",
                text: "Birds are a group of warm-blooded vertebrates constituting the class Aves. Which is further divided into orders.",
                title: "Birds",
                footer: "Orders are groups of birds with similar characteristics"
            ))
        ]
    }()
    
    private lazy var segmentedItems: [NiceTableItem] = {
        let options1: [SegmentedOption] = [
            .title(id: "car", title: "Car"),
            .title(id: "bus", title: "Bus"),
            .title(id: "lightrail", title: "Light rail")
        ]
        
        let options2: [SegmentedOption] = [
            .image(id: "airplane", image: image("airplane")!),
            .image(id: "bus", image: image("bus")!),
            .image(id: "motorcycle", image: image("motorcycle")!),
            .image(id: "lightrail", image: image("lightrail")!),
            .image(id: "car", image: image("car")!),
            .image(id: "bicycle", image: image("bicycle")!)
        ]
        
        let segmented1 = NiceSegmentedControlItem(
            label: "Preferred vehicle",
            options: options1,
            footer: "Select your preferred transportation vehicle by title"
        )
        
        let segmented2 = NiceSegmentedControlItem(
            options: options2,
            footer: "An image that represents the selected vehicle"
        )
        
        segmented1.indexChangedHandler = { [weak self] index, option in
            segmented2.selectedIndex = options2.firstIndex(where: { $0.id == option }) ?? -1
        }
        
        segmented2.indexChangedHandler = { [weak self] index, option in
            segmented1.selectedIndex = options1.firstIndex(where: { $0.id == option }) ?? -1
        }
        
        return [segmented1, segmented2]
    }()
    
    private lazy var inputTextItems: [NiceTableItem] = {
        var item2: NiceInputTextItem!
        
        let item1 = NiceInputTextItem(
            label: "Vehicle name",
            placeholder: "Vehicle's full name",
            footer: "For example: Ford Mustang Shelby GT500"
        ) {
            item2.setTextWithoutNotify($0)
        }
        
        item2 = NiceInputTextItem(
            label: "Vehicle name clone",
            footer: "Should be able to set text from the first field without looping"
        )
        
        let item3 = NiceInputTextItem(
            label: "Integer only",
            inputType: .integer
        )
        
        let item4 = NiceInputTextItem(
            label: "Decimal only",
            inputType: .decimal
        )
        
        return [item1, item2, item3, item4]
    }()
    
    private lazy var switchItems: [NiceTableItem] = {
        [
            NiceSwitchItem(Description(
                label: "Car",
                text: "Do you have a car?",
                image: image("car"),
                footer: "A vehicle that has wheels, carries a small number of passengers, and is moved by an engine or a motor."
            )),
            NiceSwitchItem(Description(
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
