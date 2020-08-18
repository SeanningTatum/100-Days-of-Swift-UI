//
//  Project7 Sheets.swift
//  100 Days of Swift UI
//
//  Created by Sean Stuart C Urgel on 8/18/20.
//  Copyright © 2020 Sean Urgel. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct Project7_Sheets: View {
    @State private var showSheet = false

    var body: some View {
        Button("Show Sheet") {
            self.showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            SecondView()
        }
    }
}

struct Project7_Sheets_Previews: PreviewProvider {
    static var previews: some View {
        Project7_Sheets()
    }
}
