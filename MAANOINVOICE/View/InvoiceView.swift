//
//  InvoiceView.swift
//  MAANOINVOICE
//
//  Created by Mashael Alghunaim on 22/05/1444 AH.
//

import SwiftUI
struct Invoice: Identifiable {
  let id: Int
  let invoiceNumber: Int
  let date: Date
  let items: [InvoiceeItem]
  let total: Double
}

struct InvoiceeItem: Identifiable {
  let id: String
  let name: String
  let quantity: Int
  let price: Double
}
struct InvoiceView: View {
  let invoice: Invoice

  private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
  }()

  var body: some View {
    VStack {
      HStack {
          Text("\(invoice.invoiceNumber)")
          Text("فاتورة رقم #:").padding(.leading, 250)
      }.padding()
     
      HStack {
        Text("\(invoice.date, formatter: dateFormatter)")
          Text("التاريخ:").padding(.leading, 145)
      }
        ForEach(invoice.items) { item in
          HStack {
            Text(item.name)
            Text("\(item.quantity)")
            Text("\(item.price)")
            Text("\(Double(item.quantity) * item.price)")
          }
        }

      }
     
    }
  }
let invoiceModel = Invoice(id: 0, invoiceNumber: 0, date: Date(), items: [], total: 0.0)

struct InvoiceView_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceView(invoice: invoiceModel)
    }
}
