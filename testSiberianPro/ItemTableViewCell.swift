//
//  ItemTableViewCell.swift
//  testSiberianPro
//
//  Created by Leonid on 06.08.17.
//  Copyright © 2017 Leonid. All rights reserved.
//

import UIKit

protocol ItemCellDelegate {
    func longPressOn(_ cell: ItemTableViewCell)
}

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var title: UILabel!
    var delegate: ItemCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLeadingConstraint.constant = Style.cellTitleTextLeftEdge
        titleTrailingConstraint.constant = Style.cellTitleTextRightEdge
        title.font = Style.cellTitleFont
        title.textColor = Style.cellTitleTextColor
        title.textAlignment = Style.cellTitleTexHorizontaltAlignment
        title.contentMode = Style.cellTitleTextVerticalAlignment
        title.numberOfLines = Style.cellTitleLines
        contentView.backgroundColor = Style.cellBackgroundColor
        separatorInset = UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 0)
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        longPressGesture.minimumPressDuration = 0.5
        self.addGestureRecognizer(longPressGesture)
    }
        
    func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            delegate.longPressOn(self)
            changeBacgroundColor(at: true)
        } else if gesture.state == .ended || gesture.state == .cancelled {
            changeBacgroundColor(at: false)
        }
    }
    
    func changeBacgroundColor(at select: Bool) {
        if select {
            contentView.backgroundColor = Style.cellSelectBackgroundColor
        } else {
            contentView.backgroundColor = Style.cellBackgroundColor
        }
    }
    
    func setup(at item: Item) {
        title.text = item.itemTitle
    }
}
