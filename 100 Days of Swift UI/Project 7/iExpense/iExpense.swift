//
//  iExpense.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/19/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

// MARK: - Data Structures
struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

// MARK: - Store
// https://www.hackingwithswift.com/books/ios-swiftui/making-changes-permanent-with-userdefaults
class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let jsonEncoder = JSONEncoder()
            if let encoded = try? jsonEncoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "iExpense_Items")
            }
        }
    }

    init() {
        if let items = UserDefaults.standard.data(forKey: "iExpense_Items") {
            let jsonDecoder = JSONDecoder()

            if let decoded = try? jsonDecoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }

        self.items = []
    }
}

// MARK: - View
struct iExpense: View {
    @ObservedObject private var expenses = Expenses()
    @State private var showAddExpense = false

    var body: some View {
        VStack {
            List {
                ForEach(expenses.items) { (expense: ExpenseItem) in
                    Text(expense.name)
                }
                .onDelete(perform: onDeleteItem)

            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button("Add") {
                    self.showAddExpense = true
                }
            )
            .sheet(isPresented: $showAddExpense) {
                iExpense_AddView(expenses: self.expenses)
            }
        }

    }

    func onDeleteItem(at offset: IndexSet) {
        self.expenses.items.remove(atOffsets: offset)
    }
}

struct iExpense_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            iExpense()
        }
    }
}
