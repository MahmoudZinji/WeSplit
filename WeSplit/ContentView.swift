//
//  ContentView.swift
//  WeSplit
//
//  Created by User on 10/17/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalPerPerson : Double {
        //calculate here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = tipValue + orderAmount
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    var grandTotal: Double {
        let orderAmount = Double(checkAmount) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let tipValue = orderAmount / 100 * tipSelection
        
        return tipValue + orderAmount
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    TextField("Check Amount", text : $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of People" , selection : $numberOfPeople) {
                        ForEach (2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tips do you want to leave")) {
                    Picker("Tip Percentage" , selection : $tipPercentage) {
                        
                        ForEach ( 0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
                Section(header: Text("Total amount paid")) {
                    Text("$\(grandTotal, specifier: "%.2f")") 
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
