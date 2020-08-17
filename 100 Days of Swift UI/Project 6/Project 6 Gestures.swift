//
//  Project 6 Gestures.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/17/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

struct Project_6_Gestures: View {
    @State private var dragPosition: CGSize = .zero
    @State private var dragPosition2: CGSize = .zero
    @State private var enabled: Bool = false
    @State private var showExample1: Bool = true
    let letters = Array("Hello Swift")

    var body: some View {
        VStack(spacing: 50.0) {
            VStack(alignment: .leading) {
                Text("Example 1")
                    .font(.title)
                    .fontWeight(.bold)
                LinearGradient(
                    gradient: Gradient(
                        colors: [.yellow, .red]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(width: 300, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(dragPosition)
                    .gesture(
                        DragGesture()
                        .onChanged {
                            self.dragPosition = $0.translation
                        }
                        .onEnded { _ in
                            self.dragPosition = .zero
                        }
                    )
                    .animation(.spring())
            }

            VStack(alignment: .leading) {
                Text("Example 2")
                    .font(.title)
                    .fontWeight(.bold)
                HStack(spacing: 0) {
                    ForEach(0..<letters.count) { num in
                        Text(String(self.letters[num]))
                            .padding(5)
                            .font(.title)
                            .background(self.enabled ? Color.blue : Color.red)
                            .offset(self.dragPosition2)
                            .animation(Animation.default.delay(Double(num) / 20))
                    }
                }
            }
            .gesture(
                DragGesture()
                    .onChanged {
                        self.dragPosition2 = $0.translation
                        self.enabled = true
                    }
                    .onEnded { _ in
                        self.dragPosition2 = .zero
                        self.enabled = false
                    }
            )

            Spacer()
        }

    }
}

struct Project_6_Gestures_Previews: PreviewProvider {
    static var previews: some View {
        Project_6_Gestures()
    }
}
