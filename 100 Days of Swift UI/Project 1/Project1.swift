//
//  Project1.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/13/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

struct Project1: View {
    //MARK: - Variables
    @State private var checkAmount: String = ""
    @State private var amountOfPeople: Int = 2
    @State private var tipPercentage: Int = 2
    private let tipPercentages = [10, 15, 20, 25, 0]
    
    //MARK: - Computed
    var totalPerPerson: Double {
        let checkAmount = Double(self.checkAmount) ?? 0
        let amountOfPeople = Double(self.amountOfPeople)
        let tipPercentage = Double(self.tipPercentages[self.tipPercentage])
        
        let tipValue = checkAmount / 100 * tipPercentage
        let grandTotal = checkAmount + tipValue
        
        return grandTotal / amountOfPeople
    }
    
    var total: Double {
        return Double(self.checkAmount) ?? 0
    }
    
    var tipValue: Double {
        return total / 100 * Double(self.tipPercentages[self.tipPercentage])
    }
    
    //MARK: - Body
    var body: some View {
        Form {
            TextField("Check Amount", text: $checkAmount)
                .keyboardType(.decimalPad)
            
            Picker(selection: $amountOfPeople, label: Text("Amount of people")) {
                ForEach(2 ..< 100, id: \.self) {
                    Text("\($0) people")
                }
            }
            
            Section(header: Text("How much would you like to tip?")) {
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(0 ..< tipPercentages.count, id: \.self) {
                        Text("\(self.tipPercentages[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Breakdown")) {
                Text("Total: \(total, specifier: "%.2f")")
                Text("Tip: \(tipValue, specifier: "%.2f")")
                Text("Total with tip: \(total + tipValue, specifier: "%.2f")")
            }
            
            Section(header: Text("Total cost per person")) {
                Text("\(totalPerPerson, specifier: "%.2f")")
            }
            
            
            
        }
        .navigationBarTitle("WeSplit", displayMode: .inline)
        
        
    }
}

struct Project1_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Project1()
        }
    }
}
