//
//  Project7 Deleting.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/18/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

struct Project7_Deleting: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1

    var body: some View {
        VStack {
            List {
                ForEach(numbers, id: \.self) {
                    Text("\(String($0))")
                }
                .onDelete(perform: onDeleteItem)
            }

            Button("Add") {
                self.numbers.append(self.currentNumber)
                self.currentNumber += 1
            }
        }
        .navigationBarTitle("Deleting")
        .navigationBarItems(leading: EditButton())
    }

    func onDeleteItem(at offsets: IndexSet) {
        self.numbers.remove(atOffsets: offsets)
    }
}

struct Project7_Deleting_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Project7_Deleting()
        }
    }
}
