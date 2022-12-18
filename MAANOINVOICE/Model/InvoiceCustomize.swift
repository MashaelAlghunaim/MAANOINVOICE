//
//  InvoiceCustomize.swift
//  MAANOINVOICE
//
//  Created by Mashael Alghunaim on 22/05/1444 AH.
//

import SwiftUI
struct InvoiceCustomize: View {
    @State private var invoiceNumber = ""
    @State private var customerName = ""
    @State private var items = [InvoiceItem]()
    @State private var totalAmountDue: Double = 0
    @State private var showAddItemSheet = false
    @State private var newItemName = ""
    @State private var newItemQuantity = 1
    @State private var newItemPrice = 0.0

    var body: some View {
        Form {
            Section {
                TextField("Invoice Number", text: $invoiceNumber)
                TextField("Customer Name", text: $customerName)
            }

            Section {
                List {
                    ForEach(items, id: \.self) { item in
                        InvoiceItemRow(item: item)
                    }
                    .onDelete(perform: deleteItem)
                }

                Button(action: {
                    self.showAddItemSheet = true
                }) {
                    Text("Add Item")
                }
            }

            Section {
                Text("Total Amount Due: $\(totalAmountDue, specifier: "%.2f")")
                    .font(.headline)
            }
        }
        .sheet(isPresented: $showAddItemSheet) {
            VStack {
                TextField("Item Name", text: self.$newItemName)
                Stepper("Quantity: \(self.newItemQuantity)", value: self.$newItemQuantity)
                Slider(value: self.$newItemPrice, in: 0...100)
                Button(action: {
                    let newItem = InvoiceItem(name: self.newItemName, quantity: self.newItemQuantity, price: self.newItemPrice)
                    self.items.insert(newItem, at: 0)
                    self.showAddItemSheet = false
                }) {
                    Text("Add Item")
                }
            }
        }
    }

    func deleteItem(at offsets: IndexSet) {
        // code to delete the selected items from the list
        updateTotalAmountDue()
    }

    func updateTotalAmountDue() {
        let itemTotal = items.reduce(0) { $0 + $1.total }
        totalAmountDue = itemTotal
    }
}


struct InvoiceItem: Hashable {
    let name: String
    let quantity: Int
    let price: Double
    var total: Double {
        return Double(quantity) * price
    }
}

struct InvoiceItemRow: View {
    let item: InvoiceItem

    var body: some View {
        HStack {
            Text(item.name)
            Spacer()
            Text("$\(item.total, specifier: "%.2f")")
        }
    }
}



struct InvoiceCustomize_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceCustomize()
    }
}
