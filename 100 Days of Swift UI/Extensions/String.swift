//
//  String.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/15/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
