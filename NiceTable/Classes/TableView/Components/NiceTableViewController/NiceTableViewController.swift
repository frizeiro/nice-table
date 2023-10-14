//
//  NiceTableViewController.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 25/04/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

open class NiceTableViewController: UIViewController {
    
    // MARK: - Private Variables
    
    // MARK: Outlets
    
    @IBOutlet public var tableView: NiceTableView?
    
    // MARK: - Life Cycle
    
    public init() {
        super.init(nibName: NiceTableViewController.nNibName, bundle: NiceTableViewController.nBundle)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView?.deselectRows(animated: animated)
    }
    
}
