//
//  GradientView.swift
//  VMF
//
//  Created by Jimmy McCaughey on 7/29/20.
//  Copyright © 2020 Jimmy McCaughey. All rights reserved.
//

import UIKit

class GradientView: UIView {

    @IBInspectable var topColor: UIColor = UIColor.blue {
        didSet {//updates the layout of the view as we change things
            self.setNeedsLayout()
        }
        }
            @IBInspectable var bottomColor: UIColor = UIColor.green {
            didSet {//updates the layout of the view as we change things
                self.setNeedsLayout()
        }
    }
        //This will be the gradient layer function: All you need to get the gradient layer running is have the two colors (Coded above) and a size to be filled (below)
        override func layoutSubviews() {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
            gradientLayer.frame = self.bounds
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
    }

