//
//  AlertBuilder.swift
//  JuiceMaker
//
//  Copyright (c) 2023 Minii All rights reserved.

import UIKit

protocol AlertBuilder: AnyObject {
    var alert: UIAlertController { get }
    
    func setTitle(with title: String) -> Self
    func setMessage(with message: String) -> Self
    func setAction(
        title: String,
        style: UIAlertAction.Style,
        handler: ((UIAlertAction) -> Void)?
    ) -> Self
    
    func build() -> UIAlertController
}

class AlertConcreteBuilder: AlertBuilder {
    var alert: UIAlertController
    
    init() {
        self.alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
    }
    
    func setTitle(with title: String) -> Self {
        alert.title = title
        
        return self
    }
    
    func setMessage(with message: String) -> Self {
        alert.message = message
        
        return self
    }
    
    func setAction(
        title: String,
        style: UIAlertAction.Style = .default,
        handler: ((UIAlertAction) -> Void)? = nil
    ) -> Self {
        let action = UIAlertAction(
            title: title,
            style: style,
            handler: handler
        )
        alert.addAction(action)
        
        return self
    }
    
    func build() -> UIAlertController {
        return alert
    }
}
