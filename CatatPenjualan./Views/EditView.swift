//
//  EditView.swift
//  CatatPenjualan.
//
//  Created by Putut Yusri Bahtiar on 18/03/23.
//

import CoreData
import SwiftUI


struct EditView: View {
    @Environment(\.managedObjectContext) var db
    @Environment(\.dismiss) var dismiss
    @State private var nama: String
    @State private var jumlah: Int
    @State private var harga: Int
    
    var catatan: Catatan
    
    init(catatan: Catatan) {
        self.catatan = catatan
        _nama = State(initialValue: catatan.nama ?? "")
        _jumlah = State(initialValue: Int(catatan.jumlah))
        _harga = State(initialValue: Int(catatan.harga))
    }
    
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
                
                Button("Update") {
                    catatan.nama = nama
                    catatan.jumlah = Int32(jumlah)
                    catatan.harga = Int32(harga)
                    
                    try? db.save()
                    dismiss()
                }
            }
            .navigationTitle("Edit Produk")
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        let catatan = Catatan(context: context)
        EditView(catatan: catatan)
    }
}
