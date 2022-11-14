//
//  UIApplication+Extension.swift
//  WASP 13
//
//  Created by Jose Barroso on 11/9/22.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
