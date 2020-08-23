//
//  iExpense AddView.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/19/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

struct iExpense_AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""

    static var types: [String] = ["Personal", "Business"]

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }

                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add Expense")
            .navigationBarItems(trailing: Button("Add") {
                self.addExpense()
            })
        }
    }

    func addExpense() {
        if let actualAmount = Int(self.amount) {
            let item = ExpenseItem(
                name: self.name,
                type: self.type,
                amount: actualAmount
            )
            self.expenses.items.append(item)
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct iExpense_AddView_Previews: PreviewProvider {
    static var previews: some View {
        iExpense_AddView(
            expenses: Expenses()
        )
    }
}
