//
//  CounterViewController.swift
//  Counter
//
//  Created by to4iki on 5/2/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit
import ReSwift

final class CounterViewController: UIViewController, StoreSubscriber {

    static let identifier = "CounterViewController"

    @IBOutlet private weak var counterLabel: UILabel!

    func newState(state: AppState) {
        counterLabel.text = "\(state.counter)"
    }
}

// MARK: LifeCycle

extension CounterViewController {

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        mainStore.subscribe(self)
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        mainStore.unsubscribe(self)
    }
}

// MARK: Action

extension CounterViewController {

    @IBAction func increaseButtonTapped(sender: UIButton) {
        mainStore.dispatch(
            CounterActionIncrease()
        )
    }
    
    @IBAction func decreaseButtonTapped(sender: UIButton) {
        mainStore.dispatch(
            CounterActionDecrease()
        )
    }
}
