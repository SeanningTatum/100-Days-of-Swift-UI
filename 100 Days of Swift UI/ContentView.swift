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
                    Text("Project 1 (WeSplit)")
                }
                NavigationLink(destination: Project2()) {
                    Text("Project 2")
                }
            }
            .navigationBarTitle("Project List")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
