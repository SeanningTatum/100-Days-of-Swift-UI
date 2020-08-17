//
//  Project6.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/16/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//  Resources
// https://www.hackingwithswift.com/books/ios-swiftui/customizing-animations-in-swiftui

import SwiftUI

struct Project6: View {
    @State private var animationAmount: CGFloat = 1

    var body: some View {
        List {
            NavigationLink(destination: Project_6_Implicit_Animations()) {
                Text("Implicit Animations")
            }
            NavigationLink(destination: Project6_Explicit_Animations()) {
                Text("Explicit Animations")
            }
            NavigationLink(destination: Project_6_Animation_Stack()) {
                Text("Animation Stack")
            }
            NavigationLink(destination: Project_6_Gestures()) {
                Text("Animating Gestures")
            }
            NavigationLink(destination: Project_6_View_Transitions()) {
                Text("View Transitions")
            }
            NavigationLink(destination: Project_6_View_Modifier()) {
                Text("View Modifier")
            }
        }
        .navigationBarTitle("Animations")
    }
}

struct Project6_Previews: PreviewProvider {
    static var previews: some View {
        Project6()
    }
}
