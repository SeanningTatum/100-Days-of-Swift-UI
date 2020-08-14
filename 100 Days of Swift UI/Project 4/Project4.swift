//
//  Project4.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/13/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//
// Resources for date helper functions:
// https://www.hackingwithswift.com/books/ios-swiftui/working-with-dates

import SwiftUI

struct Project4: View {
    // MARK: - Variables
    @State private var sleepHours = 4.0
    @State private var wakeUp: Date = defaultWakeTime
    @State private var coffeeAmount: Int = 1

    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false

    // MARK: - Computed
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 8
        components.minute = 30

        return Calendar.current.date(from: components) ?? Date()
    }

    // MARK: - Methods
    func calculateBedTime() {
        let model = SleepCalculator()

        let dateComponent = DateComponents()
        let hours = (dateComponent.hour ?? 0) * 60
        let minutes = (dateComponent.minute ?? 0) * 60 * 60

        do {
            let prediction = try model.prediction(
                wake: Double(hours + minutes),
                estimatedSleep: self.sleepHours,
                coffee: Double(self.coffeeAmount)
            )

            let sleepTime = self.wakeUp - prediction.actualSleep

            let formatter = DateFormatter()
            formatter.timeStyle = .short

            alertMessage = formatter.string(from: sleepTime)
            alertTitle = "Your ideal sleep time is..."
        } catch {
            self.alertTitle = "Failed"
            self.alertMessage = "Something went wrong processing your request!"
        }

        self.showAlert = true
    }

    // MARK: - Body
    var body: some View {

         Form {
            VStack(alignment: .leading) {
                Text("Daily Coffee Intake")
                    .fontWeight(.bold)

                Stepper(value: $coffeeAmount) {
                    if coffeeAmount == 1 {
                        Text("1 Cup")
                    } else {
                        Text("\(coffeeAmount) Cups")
                    }

                }
            }

            VStack(alignment: .leading) {
                Text("Desired sleep hours:")
                    .fontWeight(.bold)
                Stepper(value: $sleepHours, in: 4...12, step: 0.25) {
                    Text("\(sleepHours, specifier: "%g") Hours")
                }
            }

            // We can use [in: Date()...] to select any date in the future
            VStack(alignment: .leading) {
                Text("When do you want to wake up?")
                    .fontWeight(.bold)
                DatePicker("", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
            }

        }
         .navigationBarTitle("Better Rest", displayMode: .inline)
         .navigationBarItems(trailing: Button(action: calculateBedTime) {
            Text("Calculate")
         })
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(self.alertTitle),
                message: Text(self.alertMessage),
                dismissButton: .default(Text("Done"))
            )
        }
    }
}

struct Project4_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Project4()
        }
    }
}
