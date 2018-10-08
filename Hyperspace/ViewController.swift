//
//  ViewController.swift
//  Hyperspace
//
//  Created by Charles Moncada on 08/10/18.
//  Copyright © 2018 Charles Moncada. All rights reserved.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {

	@IBOutlet weak var enterpriseView: UIImageView!
	@IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!

	override func viewDidLoad() {
		super.viewDidLoad()
		view.addGestureRecognizer(tapGestureRecognizer)

		let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(jumpToHyperspace))
		swipeGestureRecognizer.direction = .left
		view.addGestureRecognizer(swipeGestureRecognizer)
	}

	@objc func jumpToHyperspace() {
		UIView.animate(withDuration: 0.2,
					   delay: 0,
					   options: .curveEaseIn,
					   animations: {
						self.enterpriseView.center.x += 1000
						self.enterpriseView.center.y += 50
						},
					   completion: nil)
	}

	@IBAction func userDidTap(_ sender: UITapGestureRecognizer) {
		let newCenter = tapGestureRecognizer.location(in: self.view)

		UIView.animate(
			withDuration: 1,
			delay: 0,
			options: [.curveEaseInOut, .beginFromCurrentState],
			animations: {
				self.enterpriseView.center = newCenter
			},
			completion: nil
		)

		UIView.animate(
			withDuration: 1,
			delay: 0,
			options: [.curveEaseInOut,.beginFromCurrentState],
			animations: {
				self.enterpriseView.transform = CGAffineTransform(rotationAngle: CGFloat(M_2_PI))
			},
			completion: { _ in
				UIView.animate(withDuration: 0.6,
							   delay: 0,
							   options: [.curveEaseInOut, .beginFromCurrentState],
							   animations: { self.enterpriseView.transform = CGAffineTransform.identity },
							   completion: nil
				)
			}
		)

	}

}

