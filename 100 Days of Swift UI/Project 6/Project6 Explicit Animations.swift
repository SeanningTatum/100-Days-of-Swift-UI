//
//  Project6 Explicit Animations.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/16/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

struct Project6_Explicit_Animations: View {
    @State private var animationAmount: Double = 0.0

    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    self.animationAmount += 360
                }
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(Angle(degrees: animationAmount), axis: (x: 0, y: 0, z: 1))
        }
        .navigationBarTitle("Explicit Animations", displayMode: .inline)
    }
}

struct Project6_Explicit_Animations_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Project6_Explicit_Animations()
        }
    }
}
