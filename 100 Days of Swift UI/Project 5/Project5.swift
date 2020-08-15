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
    // MARK: - Variables
    @State private var state = Project5State()

    // MARK: - Body
    var body: some View {

        VStack {
            TextField("Enter your word", text: $state.newWord, onCommit: { self.state.addNewWord() })
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            List(state.usedWords, id: \.self) {
                Image(systemName: "\($0.count).circle")
                Text($0)
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(state.rootWord.capitalizingFirstLetter())
        .alert(isPresented: $state.showAlert) {
            Alert(
                title: Text(state.alertTitle),
                message: Text(state.alertMessage),
                dismissButton: .default(Text("Okay"))
            )
        }
        .onAppear(perform: { self.state.startGame() })

    }
}

struct Project5_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Project5()
        }

    }
}
