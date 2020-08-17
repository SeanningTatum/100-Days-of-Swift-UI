//
//  Project 6 View Transitions.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/17/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

struct Project_6_View_Transitions: View {
    @State private var show: Bool = false

    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    self.show.toggle()
                }

            }

            if self.show {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }

        }
        .navigationBarTitle("View Transitions", displayMode: .inline)
    }
}

struct Project_6_View_Transitions_Previews: PreviewProvider {
    static var previews: some View {
        Project_6_View_Transitions()
    }
}
