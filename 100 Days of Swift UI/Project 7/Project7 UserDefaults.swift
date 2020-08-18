//
//  Project7 UserDefaults.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/18/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

struct Project7_UserDefaults: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")

    var body: some View {
        VStack {
            Text("Tap Count: \(tapCount)")

            Button("Tap") {
                UserDefaults.standard.set(self.tapCount, forKey: "Tap")
                self.tapCount += 1
            }
        }
    }
}

struct Project7_UserDefaults_Previews: PreviewProvider {
    static var previews: some View {
        Project7_UserDefaults()
    }
}
