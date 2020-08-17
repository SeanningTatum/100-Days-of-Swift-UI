//
//  ContentView.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/13/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Project1()) {
                    makeNavigationItem(
                        title: "Project 1 (WeSplit)",
                        description: "TextField, Segmented Controls, Picker, State, Dismiss Keyboard",
                        finishDate: "August 13, 2020"
                    )
                }
                NavigationLink(destination: Project2()) {
                    makeNavigationItem(
                        title: "Project 2 (Guess the Flag)",
                        description: "Alerts, View Modifers, Gradients, Images",
                        finishDate: "August 13, 2020"
                    )
                }
                NavigationLink(destination: Project4()) {
                    makeNavigationItem(
                        title: "Project 4 (Better Rest)",
                        description: "CreateML, CoreML, Stepper, Datepicker, Dates",
                        finishDate: "August 14, 2020"
                    )
                }
                NavigationLink(destination: Project5()) {
                    makeNavigationItem(
                        title: "Project 5 (Word Scramble)",
                        description: "Files, Strings, Lists, UIKit, FatalError",
                        finishDate: "August 15, 2020"
                    )
                }
                NavigationLink(destination: Project6()) {
                    makeNavigationItem(
                        title: "Project 6 (Animations)",
                        description: "Explicit Animations, Implicit Animations, Animation Stack, Gestures, View Transitions, View Modifiers, Extensions",
                        finishDate: "August 16, 2020"
                    )
                }
            }
            .navigationBarTitle("Project List")
        }
    }

    func makeNavigationItem(
            title: String,
            description: String,
            finishDate: String
    ) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.headline)
                .fontWeight(.medium)
            Text(description)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(Color.gray)
            Text(finishDate)
                .font(.caption)
                .foregroundColor(Color.gray)
        }
        .padding(.vertical, 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
