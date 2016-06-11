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

    func didChangePageControlValue(view: IntroductionPageControlView)

    func didTapCloseButton(view: IntroductionPageControlView)

    func didTapNextButton(view: IntroductionPageControlView)
}

// MARK: - IntroductionPageControlView

final class IntroductionPageControlView: UIView {

    private static let NibName = "IntroductionPageControlView"

    weak var delegate: IntroductionPageControlViewDelegate?

    @IBOutlet private(set) weak var pageControl: UIPageControl!

    @IBOutlet private(set) weak var closeButton: UIButton!

    @IBOutlet private(set) weak var nextButton: UIButton!

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

    // MARK: IBAction

    @IBAction func onChangePageControlValue(sender: UIPageControl) {
        delegate?.didChangePageControlValue(self)
    }

    @IBAction func onTapCloseButton(sender: UIButton) {
        delegate?.didTapCloseButton(self)
    }

    @IBAction func onTapNextButton(sender: UIButton) {
        delegate?.didTapNextButton(self)
    }
}
