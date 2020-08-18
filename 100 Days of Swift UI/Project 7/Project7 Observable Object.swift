//
//  Project7 Observable Object.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/18/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

private class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct Project7_Observable_Object: View {
    @ObservedObject private var user = User()

    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

struct Project7_Observable_Object_Previews: PreviewProvider {
    static var previews: some View {
        Project7_Observable_Object()
    }
}
