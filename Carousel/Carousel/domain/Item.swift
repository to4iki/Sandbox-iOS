//
//  Item.swift
//  Carousel
//
//  Created by to4iki on 4/13/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import Foundation

struct Item {

    let title: String

    let colorCode: Int
}

// MARK: - Factory

struct ItemFactory {

    static func dummy() -> [Item] {
        return [
            Item(title: "No.1", colorCode: 0xf39c12),
            Item(title: "No.2", colorCode: 0x1abc9c),
            Item(title: "No.3", colorCode: 0x2980b9),
            Item(title: "No.4", colorCode: 0xf1c40f),
            Item(title: "No.5", colorCode: 0x3498db),
            Item(title: "No.6", colorCode: 0x9b59b6),
            Item(title: "No.7", colorCode: 0xe74c3c),
            Item(title: "No.8", colorCode: 0xe67e22),
            Item(title: "No.9", colorCode: 0x2ecc71),
            Item(title: "No.10", colorCode: 0x34495e)

        ]
    }
}
