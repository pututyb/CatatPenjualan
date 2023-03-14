//
//  AddDataView.swift
//  CatatPenjualan.
//
//  Created by Putut Yusri Bahtiar on 13/03/23.
//

import SwiftUI

struct AddDataView: View {
    @Environment(\.managedObjectContext) var db
    @Environment(\.dismiss) var dismiss
    
    @State private var nama = ""
    @State private var jumlah = 0
    @State private var harga = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Nama Produk", text: $nama)
                }
                
                Section {
                    TextField("Jumlah Produk", value: $jumlah, formatter: NumberFormatter())
                }
                
                Section {
                    TextField("Total Pendapatan", value: $harga, formatter: NumberFormatter())
                }
                
                Button(action: {
                    let newCatatan = Catatan(context: db)
                    newCatatan.id = UUID()
                    newCatatan.nama = nama
                    newCatatan.jumlah = Int32(jumlah)
                    newCatatan.harga = Int32(harga)
                    
                    try? db.save()
                    dismiss()
                }) {
                    VStack {
                        Text("Simpan")
                    }
                }.disabled(nama.isEmpty)
            }
            .navigationTitle("Add Data")
        }
    }
}

struct AddDataView_Previews: PreviewProvider {
    static var previews: some View {
        AddDataView()
    }
}
