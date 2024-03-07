//
//  ConfigureNibView.swift
//  canva
//
//  Created by Muhammad Salman on 5/13/22.
//

import UIKit

public protocol ConfigureNibView {
    func configureView()
}

extension ConfigureNibView where Self: UIView {
    
    public func configureView() {
        guard let view = loadNibView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
    }
    
}

extension UIView: ConfigureNibView { }
