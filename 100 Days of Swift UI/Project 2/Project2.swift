//
//  Project2.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/13/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

struct Project2: View {
    // MARK: - Variables
    @State private var showScore: Bool = false
    @State private var scoreTitle = ""
    @State private var correctAnswer = Int.random(in: 0 ..< 2)
    @State private var currentScore = (corrects: 0, questionsAsked: 0)
    @State private var countries = [
        "Germany",
        "Ireland",
        "Italy",
        "Monaco",
        "Nigeria",
        "Poland",
        "Russia",
        "Spain",
        "UK",
        "US"
    ]

    // MARK: - Computed
    private var scoreString: String {
        "Score is \(String(self.currentScore.corrects)) / \(String(self.currentScore.questionsAsked))"
    }

    // MARK: - Methods
    func onTapFlag(_ number: Int) {
        if number == correctAnswer {
            self.scoreTitle = "Correct"
            self.currentScore.corrects += 1
        } else {
            self.scoreTitle = "Wrong Answer"
        }

        self.currentScore.questionsAsked += 1
        self.showScore = true
    }

    func askQuestion() {
        self.countries.shuffle()
        correctAnswer = Int.random(in: 0 ..< 2)
    }

    // MARK: - Body
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [.blue, .black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .font(.title)
                        .foregroundColor(Color.white)

                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(Color.white)
                }

                VStack {
                    ForEach(0 ..< 3, id: \.self) { ndx in
                        Button(action: { self.onTapFlag(ndx) }) {
                            self.makeFlag(self.countries[ndx])
                        }
                    }
                }

                Spacer()
            }
            .padding(.top, 20)
        }
        .alert(isPresented: $showScore) {
            Alert(
                title: Text(self.scoreTitle),
                message: Text(self.scoreString),
                dismissButton: .cancel() {
                    self.askQuestion()
                }
            )
        }
        .navigationBarTitle("Guess the Flag", displayMode: .inline)

    }

    // MARK: - View Methods
    func makeFlag(_ imageName: String) -> some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct Project2_Previews: PreviewProvider {
    static var previews: some View {
        Project2()
    }
}
