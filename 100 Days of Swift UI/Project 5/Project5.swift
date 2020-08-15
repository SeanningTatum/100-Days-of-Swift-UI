//
//  Project5.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/14/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//
// Resources
// https://www.hackingwithswift.com/books/ios-swiftui/working-with-strings

import SwiftUI

struct Project5: View {
    //MARK: - Variables
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    //MARK: - Methods
    func checkIfWordExists(word: String) -> Bool {
        let checker = UITextChecker()

        // utf16 is needed so obj-c can understand it
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(
            in: word,
            range: range,
            startingAt: 0,
            wrap: false,
            language: "en"
        )

        return misspelledRange.location == NSNotFound
    }
    
    func removeWhiteSpace(text paragraph: String) -> String {
        let words = paragraph.components(separatedBy: "\n")
        let word = words.randomElement() ?? ""
        let trimmed = word.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return trimmed
    }
    
    //MARK: - Body
    var body: some View {
        List {
            Section(header: Text("Section 1")) {
                Text("Static row 1")
                Text("Static row 2")
            }

            Section(header: Text("Section 2")) {
                ForEach(people, id: \.self) {
                    Text($0)
                }
            }

            Section(header: Text("Section 3")) {
                Text("Static row 3")
                Text("Static row 4")
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Word Scramble")
    }
}

struct Project5_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Project5()
        }

    }
}
