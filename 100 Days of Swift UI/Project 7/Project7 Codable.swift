//
//  Project7_Codable.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/18/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

private struct User: Codable {
    var firstName: String
    var lastName: String
}

struct Project7_Codable: View {
    @State private var user = User(firstName: "Sean", lastName: "Urgel")

    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()

            if let data = try? encoder.encode(self.user) {
                UserDefaults.standard.set(data, forKey: "User")
            }
        }
    }
}

struct Project7_Codable_Previews: PreviewProvider {
    static var previews: some View {
        Project7_Codable()
    }
}
