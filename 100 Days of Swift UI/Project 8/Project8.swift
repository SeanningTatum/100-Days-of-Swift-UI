//
//  Project8.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/30/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

struct Project8: View {
    private let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    private let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
        List(missions) { (mission: Mission) in
            NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)

                VStack(alignment: .leading) {
                    Text(mission.displayName)
                        .font(.headline)

                    Text(mission.formattedLaunchDate)
                }
            }
        }.navigationBarTitle("Moonshot")
    }
}

struct Project8_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Project8()
        }
    }
}
