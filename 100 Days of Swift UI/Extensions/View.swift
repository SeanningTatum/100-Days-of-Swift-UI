//
//  View.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/13/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication
            .shared
            .sendAction(
                #selector(UIResponder.resignFirstResponder),
                    to: nil,
                    from: nil,
                    for: nil
            )
    }
}
#endif
