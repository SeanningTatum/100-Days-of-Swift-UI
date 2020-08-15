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
                        description: "TextField, Segmented Controls, Picker, State, Dismiss Keyboard"
                    )
                }
                NavigationLink(destination: Project2()) {
                    makeNavigationItem(
                        title: "Project 2 (Guess the Flag)",
                        description: "Alerts, View Modifers, Gradients, Images"
                    )
                }
                NavigationLink(destination: Project4()) {
                    makeNavigationItem(
                        title: "Project 4 (Better Rest)",
                        description: "CreateML, CoreML, Stepper, Datepicker, Dates"
                    )
                }
                NavigationLink(destination: Project5()) {
                    makeNavigationItem(
                        title: "Project 5 (Word Scramble)",
                        description: "Files, Strings, Lists"
                    )
                }
            }
            .navigationBarTitle("Project List")
        }
    }

    func makeNavigationItem(title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.headline)
                .fontWeight(.medium)
            Text(description)
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
