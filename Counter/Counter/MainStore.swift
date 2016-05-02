//
//  MainStore.swift
//  Counter
//
//  Created by to4iki on 5/2/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import Foundation
import ReSwift

let mainStore = Store<AppState>(
    reducer: AppReducer(),
    state: nil,
    middleware: []
)
