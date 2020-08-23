//
//  Project7.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/18/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

struct Project7: View {

    var body: some View {
        List {
            NavigationLink(destination: Project7_Observable_Object()) {
                Text("Obseravable Object")
            }
            NavigationLink(destination: Project7_Sheets()) {
                Text("Sheets")
            }
            NavigationLink(destination: Project7_Deleting()) {
                Text("Deleting From List")
            }
            NavigationLink(destination: Project7_UserDefaults()) {
                Text("User Defaults")
            }
            NavigationLink(destination: Project7_UserDefaults()) {
                Text("Codable")
            }
            NavigationLink(destination: iExpense()) {
                Text("iExpense")
            }
        }
        .navigationBarTitle("Project 7")
    }
}

struct Project7_Previews: PreviewProvider {
    static var previews: some View {
        Project7()
    }
}
