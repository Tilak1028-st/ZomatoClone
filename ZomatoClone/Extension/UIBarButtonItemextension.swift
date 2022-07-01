//
//  UIBarButtonItemextension.swift
//  ZomatoClone
//
//  Created by PCS213 on 01/07/22.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    public convenience init(title: String?, style: UIBarButtonItem.Style, action: @escaping ()->()) {
        let handle = Closure(action)
        self.init(title: title, style: style, target: handle, action: #selector(Closure.action))
        objc_setAssociatedObject(self, "ex_action", handle, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    public convenience init(image: UIImage?, style: UIBarButtonItem.Style, action: @escaping ()->())
    {
        let handle = Closure(action)
        self.init(image: image, style: style, target: handle, action: #selector(Closure.action))
        objc_setAssociatedObject(self, "ex_action", handle, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}

class Closure {
    let closure: ()->()

    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }

    @objc func action () {
        closure()
    }
}
