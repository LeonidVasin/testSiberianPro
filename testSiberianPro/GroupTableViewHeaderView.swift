//
//  GroupTableViewHeaderView.swift
//  testSiberianPro
//
//  Created by Leonid on 06.08.17.
//  Copyright © 2017 Leonid. All rights reserved.
//

import UIKit

protocol GroupHeaderDelagate {
    func longPress(at single: Bool)
}

class GroupTableViewHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var separatorTopHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var separatorHeightConstraint: NSLayoutConstraint!

    @IBOutlet weak var titleLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleTrailingConstraint: NSLayoutConstraint!
    var delegate: GroupHeaderDelagate!
    var sectionIndex: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        separatorHeightConstraint.constant = 0.5
        separatorTopHeightConstraint.constant = 0.5
        title.font = Style.sectionHeaderTitleFont
        title.textColor = Style.sectionHeaderTitleTextColor
        title.textAlignment = Style.sectionHeaderTitleTexHorizontaltAlignment
        title.contentMode = Style.sectionHeaderTitleTextVerticalAlignment
        contentView.backgroundColor = Style.sectionHeaderBackgroundColor
        titleLeadingConstraint.constant = Style.sectionHeaderTitleLeftEdge
        titleTrailingConstraint.constant = Style.sectionHeaderTitleRightEdge
        title.numberOfLines = Style.sectionHeaderTitleLines
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        longPressGesture.minimumPressDuration = 0.5
        self.addGestureRecognizer(longPressGesture)
    }
    
    func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            delegate.longPress(at: sectionIndex%2 == 0)
            changeBackgroundColor(at: true)
        } else if gesture.state == .ended {
            changeBackgroundColor(at: false)
        }
    }
    
    func changeBackgroundColor(at select: Bool) {
        if select {
            contentView.backgroundColor = Style.sectionHeaderSelectBackgroundColor
        } else {
            contentView.backgroundColor = Style.sectionHeaderBackgroundColor
        }
    }
    
    func setup(at title: String) {
        self.title.text = title
    }
}
