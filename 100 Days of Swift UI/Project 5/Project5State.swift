//
//  Project5State.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/15/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

struct Project5State {
    // MARK: - Variables
    var usedWords = [String]()
    var rootWord = ""
    var newWord = ""

    // For Alert
    var alertTitle = ""
    var alertMessage = ""
    var showAlert = false

    // MARK: - Methods
    mutating func startGame() {
        let words: [String] = self.loadFile(fileName: "start") ?? []
        self.rootWord = words.randomElement() ?? "Silkworm"
    }

    mutating func addNewWord() {
        let answer = removeWhiteSpace(text: self.newWord).lowercased()

        guard answer.count > 0 else {
            // Word does not exist
            return
        }

        guard isOriginal(word: self.newWord) else {
            self.alertTitle = "Be original"
            self.alertMessage = "Word has already been submitted"

            return
        }

        guard isPossible(word: self.newWord) else {
            self.alertTitle = "Not possible"
            self.alertMessage = "Word can't be made from the root word"

            return
        }

        guard isReal(word: self.newWord) else {
            self.alertTitle = "Not real"
            self.alertMessage = "Word doesn't even exist"

            return
        }

        self.usedWords.insert(answer, at: 0)
        self.newWord = ""
    }

    // MARK: - Private Methods

    /// Loads file from bundle and if it doesn't exist
    /// close the application.
    mutating private func loadFile(fileName: String) -> [String]? {
        if let fileURL = Bundle.main.url(forResource: fileName, withExtension: "txt") {
            // we found the file in our bundle!

            if let fileContents = try? String(contentsOf: fileURL) {
                // We got the file content
                return fileContents.components(separatedBy: "\n")
            }
        }

        fatalError("Could not load start.txt from bundle.")
    }

    mutating private func removeWhiteSpace(text paragraph: String) -> String {
        let words = paragraph.components(separatedBy: "\n")
        let word = words.randomElement() ?? ""
        let trimmed = word.trimmingCharacters(in: .whitespacesAndNewlines)

        return trimmed
    }

    /// Checks if a word exists in the dictionary
    mutating private func isReal(word: String) -> Bool {
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

    /// Checks if word has already been submitted
    mutating private func isOriginal(word: String) -> Bool {
        !self.usedWords.contains(word)
    }

    /// Checks if a word can be created from the root word
    mutating private func isPossible(word: String) -> Bool {
        var tempWord = self.rootWord

        // Check if each letter of the word exists in rootWord
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
}

struct Project5State_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
