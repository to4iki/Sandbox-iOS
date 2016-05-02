//
//  AppReducer.swift
//  Counter
//
//  Created by to4iki on 5/2/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import Foundation
import ReSwift

struct AppReducer: Reducer {

    func handleAction(action: Action, state: AppState?) -> AppState {

        // logger handle
        print("\(action)")

        return AppState(
            counter: counterReducer(action, counter: state?.counter)
        )
    }
}

