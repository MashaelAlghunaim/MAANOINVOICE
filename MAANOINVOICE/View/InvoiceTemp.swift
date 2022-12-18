//
//  InvoiceTemp.swift
//  MAANOINVOICE
//
//  Created by Mashael Alghunaim on 24/05/1444 AH.
//

import SwiftUI

struct InvoiceTemp: View {
    @State private var name = ""
    @State private var address = ""
    @State private var item1 = ""
    @State private var item1Price = 0.0
    @State private var item2 = ""
    @State private var item2Price = 0.0
    @State private var item3 = ""
    @State private var item3Price = 0.0
    @State private var quantity = ""
    @State private var items = [Itemm]()
    @State private var newItemName = ""
    @State private var newItemQuantity = 1
    @State private var newItemPrice = 0.0
    @State private var phoneNumber = ""
    @State private var email = ""
    @State private var customerName = ""
    @State private var customerAddress = ""
    @State private var customerPhoneNumber = ""
    @State private var customerEmail = ""
    
    
    var body: some View {
        VStack{
            InvoiceView(invoice: invoiceModel)
            Form {
                Section(header: Text("المعلومات الشخصية")) {
                    TextField("الاسم", text: $name)
                    TextField("العنوان", text: $address)
                    TextField(" رقم الهاتف", text: $phoneNumber)
                    TextField("الإيميل", text: $email)
                }.padding(.leading, 250)
                
                Section(header: Text("حررت الفاتورة إلى:")){
                    TextField("اسم العميل", text: $name)
                    TextField("العنوان", text: $customerAddress)
                    TextField(" رقم الهاتف", text: $customerPhoneNumber)
                    TextField("الإيميل", text: $customerEmail)
                }.padding(.leading , 250)
                
                
                Section(header: Text("وصف الفاتورة").padding(.leading, 240)) {
                    HStack {
                        TextField("السعر", value: $item1Price, formatter: NumberFormatter())
                        TextField("الكمية", text: $quantity)
                        //                            Spacer()
                        TextField("الغرض", text: $item1)
                    }.padding(.leading, 240)
                    HStack {
                        TextField("السعر", value: $item2Price, formatter: NumberFormatter())
                        TextField("الكمية", text: $quantity)
                        Spacer()
                        TextField("الغرض", text: $item2)
                    }.padding(.leading, 240)
                    HStack {
                        TextField("السعر", value: $item3Price, formatter: NumberFormatter())
                        TextField("الكمية", text: $quantity)
                        Spacer()
                        TextField("الغرض", text: $item3)
                    }.padding(.leading, 250)
                    
                    
                }
                
                
                Section(header: Text("المجموع")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                }.padding(.leading, 250)
                
            }
        }
    }
    
    var totalAmount: Double {
        get {
            return item1Price + item2Price + item3Price + newItemPrice
        }
        set {
            newItemPrice = newValue - item1Price - item2Price - item3Price
        }
    }
}

struct InvoiceTemp_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceTemp()
    }
}


