//
//  Project 6 Animation Stack.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/17/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
// https://www.hackingwithswift.com/books/ios-swiftui/controlling-the-animation-stack

import SwiftUI

struct Project_6_Animation_Stack: View {
    @State private var enabled = true

    var body: some View {
        Button("Hello") {
            self.enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.blue : Color.red)
        .foregroundColor(.white)
        .animation(.default)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60.0 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
//        .animation(nil)
        .navigationBarTitle("Animation Stack", displayMode: .inline)

    }
}

struct Project_6_Animation_Stack_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
           Project_6_Animation_Stack()
        }
    }
}
