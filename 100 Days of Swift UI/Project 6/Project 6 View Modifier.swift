//
//  Project 6 View Modifier.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/18/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
// https://www.hackingwithswift.com/books/ios-swiftui/building-custom-transitions-using-viewmodifier

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct Project_6_View_Modifier: View {
    @State private var show: Bool = false

    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    self.show.toggle()
                }

            }

            if self.show {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }

        }
        .navigationBarTitle("View Transitions", displayMode: .inline)
    }
}

struct Project_6_View_Modifier_Previews: PreviewProvider {
    static var previews: some View {
        Project_6_View_Modifier()
    }
}
