//
//  SlidingSegmentedControl.swift
//  SlidingSegmentedControl
//
//  Created by Alex on 11/06/2018.
//  Copyright © 2018 Alex. All rights reserved.
//

import UIKit

class SlidingSegmentedControl: UISegmentedControl {
    
    var controlHeight: CGFloat = 41
    var underlineHeight: CGFloat = 2
    var underlineColor = UIColor.blue
    
    var selectedFont: UIFont?
    var unselectedFont: UIFont?
    var selectedTextColor = UIColor.blue
    var unselectedTextColor = UIColor.gray
    
    private let underline = UIView()
    private var underlineWidth: CGFloat = 0
    private var token: NSKeyValueObservation?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    private func setUp() {
        removeDefaultStyles()
        heightAnchor.constraint(equalToConstant: controlHeight).isActive = true
        configureFonts()
        addUnderline()
        
        token = observe(\.selectedSegmentIndex) { (_, _) in
            self.moveUnderline(to: self.selectedSegmentIndex)
        }
    }
    
    deinit {
        token = nil
    }
    
    private func addUnderline() {
        underlineWidth = bounds.size.width / CGFloat(numberOfSegments)
        let startY = controlHeight - underlineHeight
        underline.backgroundColor = underlineColor
        underline.frame = CGRect(x: 0, y: startY, width: underlineWidth, height: underlineHeight)
        addSubview(underline)
    }
    
    private func moveUnderline(to index: Int) {
        let newX = underlineWidth * CGFloat(index)
        let y = controlHeight - underlineHeight
        
        UIView.animate(withDuration: 0.25) {
            self.underline.frame = CGRect(x: newX, y: y, width: self.underlineWidth, height: self.self.underlineHeight)
        }
    }
    
    private func configureFonts() {
        guard let selectedFont = selectedFont, let unselectedFont = unselectedFont else { return }
        setTitleTextAttributes([
            NSAttributedStringKey.font: selectedFont,
            NSAttributedStringKey.foregroundColor: selectedTextColor,
            ], for: .selected)
        
        setTitleTextAttributes([
            NSAttributedStringKey.font: unselectedFont,
            NSAttributedStringKey.foregroundColor: unselectedTextColor,
            ], for: .normal)
    }
    
    private func removeDefaultStyles() {
        setBackgroundImage(imageWithColor(color: .clear), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: .clear), for: .highlighted, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: .clear), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: .clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
    
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }
        context.setFillColor(color.cgColor);
        context.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return image ?? UIImage()
        
    }
}
