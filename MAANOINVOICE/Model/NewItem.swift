//
//  NewItem.swift
//  MAANOINVOICE
//
//  Created by Mashael Alghunaim on 22/05/1444 AH.
//

import SwiftUI

//struct NewItem: View {
    //    @State private var items = [Itemm]()
    //    @State private var newItemName = ""
    //    @State private var newItemQuantity: Int = 0
    //    @State private var newItemPrice: Double = 0.0
    //    var body: some View {
    //        VStack {
    //            List {
    //                ForEach(items) { item in
    //                    HStack {
    //                        Text(item.name)
    //                        Spacer()
    //                        Text("$\(item.price)")
    //                    }
    //                }
    //            }
    //
    //
    //            Form {
    //                TextField("Item name", text: $newItemName)
    //                TextField("Quantity", value: $newItemQuantity, formatter: NumberFormatter())
    //                TextField("Price", value: $newItemPrice, formatter: NumberFormatter())
    //
    //                Button("Add item") {
    //                    let item = Itemm(name: newItemName, quantity: newItemQuantity, price: newItemPrice)
    //                      items.append(item)
    //                }
    //            }
    //        }
    //        .onAppear {
    //            // Refresh the list to display the newly added item
    //            self.items = self.items
    //        }
    //    }
    //}
    struct NewItem: View {
            @State private var items: [Itemm] = []
            @State private var total: Double = 0.0
            @State private var name: String = ""
            @State private var price: String = ""
        @State private var quantity: String = ""
            
            var body: some View {
                VStack {
                    List {
                        ForEach(items.indices, id: \.self) { index in
                            HStack {
                                Text(items[index].name)
                                Spacer()
                                Text("$\(items[index].price)")
                            }
                        }
                    }
                   
                    VStack {
                        HStack{
                            TextField("Item Name", text: $name)
                            TextField("Item Price", text: $price)
                            TextField("Item quantity", text: $quantity)
                        }.padding()
                        Button(action: {
                                      if let price = Double(self.price), let quantity = Int(self.quantity) {
                                          self.addItem(name: self.name, quantity: quantity, price: price)
                                      }
                                  })  {
                            Text("Add Item")
                        }
                    }
                }
            }
            
        func addItem(name: String, quantity: Int, price: Double) {
            let newItem = Itemm(name: name, quantity: quantity, price: price * Double(quantity))
               items.append(newItem)
               total += price * Double(quantity)
           }
//        func deleteItem(item: newItem) {
//            if let index = items.firstIndex(where: { $0.id == item.id }) {
//                items.remove(at: index)
//                total -= items.price
//            }
//        }
        }

    
    

    

struct NewItem_Previews: PreviewProvider {
    static var previews: some View {
        NewItem()
    }
}
