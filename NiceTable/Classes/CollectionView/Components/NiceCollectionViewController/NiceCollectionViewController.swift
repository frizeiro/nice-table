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
        super.init(nibName: String(describing: NiceCollectionViewController.self), bundle: Bundle(for: NiceCollectionViewController.self))
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
