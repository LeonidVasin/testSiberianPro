//
//  GroupsParser.swift
//  testSiberianPro
//
//  Created by Leonid on 06.08.17.
//  Copyright © 2017 Leonid. All rights reserved.
//

import Foundation
import SwiftyJSON

class GroupsParser {
    class func parse(at data: Data) -> [Group] {
        var groupsArray: [Group] = []
        guard let groupsJson = JSON(data: data).array else {
            return []
        }
        for groupJson in groupsJson {
            var itemsArray: [Item] = []
            if let itemsJson = groupJson["items"].array {
                for itemJson in itemsJson {
                    let item = Item(itemTitle: itemJson["itemTitle"].string ?? "")
                    itemsArray.append(item)
                }
            } else {
                continue
            }
            if itemsArray.count > 0 {
                let group = Group(groupTitle: groupJson["groupTitle"].string ?? "", items: itemsArray)
                groupsArray.append(group)
            }
        }
        
        return groupsArray
    }
}
