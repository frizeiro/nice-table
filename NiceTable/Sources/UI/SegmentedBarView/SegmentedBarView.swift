//
//  SegmentedBarView.swift
//  NiceTable
//
//  Created by Felipe Frizeiro on 07/04/24.
//  Copyright © 2020 Felipe Frizeiro. All rights reserved.
//

import Foundation

class SegmentedBarView: UIViewWithNib {
    
    // MARK: - Public Variables
    
    var title: String? {
        didSet {
            updateTitle()
        }
    }
    
    var detail: String? {
        didSet {
            updateDetail()
        }
    }
    
    var style: SegmentedBarStyle = .default {
        didSet {
            updateStyle()
        }
    }
    
    var entries: [BarDataEntry] = [] {
        didSet {
            reload()
        }
    }
    
    // MARK: - Private Variables
    
    // MARK: Outlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    @IBOutlet private weak var backgroundBarView: UIView!
    @IBOutlet private weak var contentBarStackView: UIStackView!
    @IBOutlet private weak var contentLabelsStackView: UIStackView!

    private var entriesRectView: [UIView] {
        backgroundBarView.setNeedsLayout()
        backgroundBarView.layoutIfNeeded()

        return entries.map {
            let view = UIView()
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.widthAnchor.constraint(equalToConstant: backgroundBarView.bounds.width * $0.value / 100).isActive = true
            view.backgroundColor = $0.color
            
            return view
        }
    }
    
    private var labelsBarView: [LabelBarView] {
        return entries.map {
            let view = LabelBarView()
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.colorView.backgroundColor = $0.color
            view.titleLabel.text = $0.label
            view.titleLabel.textColor = style.detailColor
            view.titleLabel.font = style.detailFont.font
            
            return view
        }
    }
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    convenience init(entries: [BarDataEntry]) {
        self.init(frame: .zero)
        self.entries = entries
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    deinit {
        Log.debug("\(type(of: self))", tag: "deinit")
    }

    // MARK: - Public Methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        reload()
    }
    
    public func reload() {
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        removeChartSubViews()
        updateTitle()
        updateDetail()
        
        contentBarStackView.addArrangedSubviews(entriesRectView)
        contentLabelsStackView.addArrangedSubviews(labelsBarView)
        
        updateStyle()
    }
    
    private func removeChartSubViews() {
        contentBarStackView.removeAllSubviews()
        contentLabelsStackView.removeAllSubviews()
    }
    
    private func updateTitle() {
        titleLabel.text = title
        titleLabel.isHidden = title?.isEmpty ?? true
    }

    private func updateDetail() {
        detailLabel.text = detail
        detailLabel.isHidden = detail?.isEmpty ?? true
    }

    private func updateStyle() {
        titleLabel.textColor = style.titleColor
        titleLabel.font = style.titleFont.font
        titleLabel.layoutIfNeeded()
        
        detailLabel.textColor = style.detailColor
        detailLabel.font = style.detailFont.font
        detailLabel.layoutIfNeeded()
        
        backgroundBarView.backgroundColor = style.backgroundColor
        
        contentLabelsStackView.subviews.forEach { view in
            if let labelBarView = view as? LabelBarView {
                labelBarView.titleLabel.textColor = style.labelColor
                labelBarView.titleLabel.font = style.labelFont.font
                labelBarView.layoutIfNeeded()
            }
        }
    }
}
