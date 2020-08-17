//
//  Project 6 Implicit Animations.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/17/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

struct Project_6_Implicit_Animations: View {
    @State private var animationAmount: CGFloat = 1

    var body: some View {
        print(self.animationAmount)

        return VStack(alignment: .center) {
            Stepper(value: $animationAmount.animation(
                Animation.easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10) {
                Text("Animation Amount")
            }

            Spacer()

            Button(action: { self.animationAmount += 0.2 }) {
                Text("Scale")
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(self.animationAmount)
            //            .blur(radius: (animationAmount - 1) * 3)
            //            .animation(.default)

            Spacer()
        }
        .padding()
        .navigationBarTitle("Implicit Animations", displayMode: .inline)
    }
}

struct Project_6_Implicit_Animations_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Project_6_Implicit_Animations()
        }
    }
}
