//
//  NiceCollectionViewController.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 24/05/20.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import UIKit

open class NiceCollectionViewController: UIViewController {

    // MARK: - Private Variables

    @IBOutlet public var collectionView: NiceCollectionView?

    // MARK: - Life Cycle

    public init() {
        super.init(nibName: NiceCollectionViewController.nNibName, bundle: NiceCollectionViewController.nBundle)
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        NiceCollectionViewController.nNib.instantiate(withOwner: self)
    }

}
