//
//  ItemReadDto.swift
//  Carousel
//
//  Created by to4iki on 4/13/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

final class ItemReadDto {

    let title: String

    let color: UIColor

    init(title: String, color: UIColor) {
        self.title = title
        self.color = color
    }
}

extension ItemReadDto {

    static func fromItem(item: Item) -> ItemReadDto {
        return ItemReadDto(title: item.title, color: UIColor.hexColor(item.colorCode))
    }
}
