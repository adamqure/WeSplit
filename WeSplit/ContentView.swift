//
//  ContentView.swift
//  WeSplit
//
//  Created by Adam Ure on 6/6/22.
//

import SwiftUI

// MARK: Content View
struct ContentView: View {

    // MARK: States
    @FocusState private var amountIsFocused: Bool
    @State var checkAmount: Double = 0.0
    @State var numberOfPeople: Int = 2
    @State var tipPercentage = 0

    // MARK: Computed Variables

    /**
        Type of currency needed by the system
        - Returns: currency style based on the user's current locale
     */
    var currencyType: FloatingPointFormatStyle<Double>.Currency {
        return FloatingPointFormatStyle<Double>.Currency(code:         Locale.current.currencyCode ?? "USD")
    }

    /**
        Cost per person after the check is split
        - Precondition: numberOfPeople >= 2
        - Returns: The cost per person
        - Throws: CheckSplitter.CheckSplitterError.invalidSplitCount
     */
    var totalPerPerson: Double {
        return try! CheckSplitter.splitCheck(balance: totalCheck, into: numberOfPeople + 2)
    }

    /**
        The total cost of the check after the tip is calculated
        - Returns: The check amount and tip combined
     */
    var totalCheck: Double {
        return checkAmount + totalTip
    }

    /**
        The total cost of the tip based on the percentage selected
        - Precondition: tipPercentage > 0
        - Returns: The total cost of the tip
        - Throws: TipCalculator.CalculatorError.invalidPercentage
     */
    var totalTip: Double {
        try! TipCalculator.calculateTip(of: checkAmount, withPercent: Double(tipPercentage))
    }

    // MARK: Private Variables
    private let tipPercentages = [10, 15, 20, 25, 0]

    // MARK: Body
    var body: some View {
        NavigationView {
            Form {
                // MARK: Check Description
                Section {
                    TextField("amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD")).keyboardType(.decimalPad).focused($amountIsFocused)

                    Picker("numberOfPeople", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text(String.localizedStringWithFormat(NSLocalizedString("peopleField", comment: "$0 people"), $0))
                        }
                    }
                }

                // MARK: Tip Selection
                Section {
                    Text("howMuchTip")
                    Picker("tipPercentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("tip")
                }

                // MARK: Totals
                Section {
                    HStack {
                        Text("totalTip")
                        Spacer()
                        Text(totalTip, format: currencyType)
                    }

                    HStack {
                        Text("subtotal")
                        Spacer()
                        Text(totalCheck, format: currencyType)
                    }

                    HStack {
                        Text("totalPerPerson")
                        Spacer()
                        Text(totalPerPerson, format: currencyType)
                    }

                } header: {
                    Text("totals")
                }
            }.navigationTitle("wesplit")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("done") {
                            amountIsFocused = false
                        }
                    }
                }
        }
    }
}

// MARK: Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
