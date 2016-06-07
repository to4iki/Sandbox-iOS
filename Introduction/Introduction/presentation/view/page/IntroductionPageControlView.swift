//
//  IntroductionPageControlView.swift
//  Introduction
//
//  Created by to4iki on 6/7/16.
//  Copyright © 2016 to4iki. All rights reserved.
//

import UIKit

// MARK: - IntroductionPageControlViewDelegate

protocol IntroductionPageControlViewDelegate: class {

    func onChangePageControlValue()

    func onTapCloseButton()

    func onTapNextButton()
}

// MARK: - IntroductionPageControlView

final class IntroductionPageControlView: UIView {

    private static let NibName = "IntroductionPageControlView"

    weak var delegate: IntroductionPageControlViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        let nib = UINib(nibName: IntroductionPageControlView.NibName, bundle: nil)
        guard let view = nib.instantiateWithOwner(self, options: nil).first as? UIView else {
            fatalError()
        }

        addSubview(view)
    }

    @IBAction func onChangePageControlValue(sender: UIPageControl) {
        delegate?.onChangePageControlValue()
    }

    @IBAction func onTapCloseButton(sender: UIButton) {
        delegate?.onTapCloseButton()
    }

    @IBAction func onTapNextButton(sender: UIButton) {
        delegate?.onTapNextButton()
    }
}
