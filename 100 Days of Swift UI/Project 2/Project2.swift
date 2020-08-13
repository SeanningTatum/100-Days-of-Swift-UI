//
//  Project2.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/13/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

struct Project2: View {
    @State var showAlert: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, World!")
            Button(action: { self.showAlert.toggle() }) {
                Text("Toggle Alert")
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("This is an alert"),
                message: Text("This is the description"),
                dismissButton: .cancel()
            )
        }
    }
}

struct Project2_Previews: PreviewProvider {
    static var previews: some View {
        Project2()
    }
}
