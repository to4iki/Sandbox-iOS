//
//  CounterReducer.swift
//  Counter
//
//  Created by to4iki on 5/2/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import Foundation
import ReSwift

func counterReducer(action: Action, counter: Int?) -> Int {
    var counter = counter ?? 0

    switch action {
    case _ as CounterActionIncrease:
        counter += 1
    case _ as CounterActionDecrease:
        counter -= 1
    default:
        break
    }

    return counter
}
