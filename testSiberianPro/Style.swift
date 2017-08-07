//
//  Style.swift
//  testSiberianPro
//
//  Created by Leonid on 07.08.17.
//  Copyright © 2017 Leonid. All rights reserved.
//

import UIKit

struct Style {
    static let sectionHeaderTitleTextHeight: CGFloat = 16.0
    static let sectionHeaderTitleFont: UIFont = UIFont(name: "Roboto-Light", size: Style.sectionHeaderTitleTextHeight) ?? UIFont.systemFont(ofSize: Style.sectionHeaderTitleTextHeight)
    static let sectionHeaderTitleTextColor: UIColor = UIColor(hexString: "#333333")
    static let sectionHeaderTitleLeftEdge: CGFloat = 36.0
    static let sectionHeaderTitleRightEdge: CGFloat = 16.0
    static let sectionHeaderTitleTexHorizontaltAlignment: NSTextAlignment = .left
    static let sectionHeaderTitleTextVerticalAlignment: UIViewContentMode = .center
    static let sectionHeaderTitleLines: Int = 1
    static let sectionHeaderHeight: CGFloat = 48.0
    static let sectionHeaderBackgroundColor: UIColor = UIColor(hexString: "#FFFFFF")
    static let sectionHeaderSelectBackgroundColor: UIColor = UIColor(hexString: "#BABABA")
    
    static let cellTitleFont: UIFont = UIFont(name: "Roboto-Light", size: Style.cellTitleTextHeight) ?? UIFont.systemFont(ofSize: Style.cellTitleTextHeight)
    static let cellTitleTextHeight: CGFloat = 16.0
    static let cellTitleTextColor: UIColor = UIColor(hexString: "#333333")
    static let cellTitleTextLeftEdge: CGFloat = 36.0
    static let cellTitleTextRightEdge: CGFloat = 16.0
    static let cellTitleTexHorizontaltAlignment: NSTextAlignment = .left
    static let cellTitleTextVerticalAlignment: UIViewContentMode = .center
    static let cellTitleLines: Int = 1
    static let celleHeight: CGFloat = 48.0
    static let cellBackgroundColor: UIColor = UIColor(hexString: "#FFFFFF")
    static let cellSelectBackgroundColor: UIColor = UIColor(hexString: "#BABABA")
}
