//
//  ScrollDataView.swift
//  CatatPenjualan.
//
//  Created by Putut Yusri Bahtiar on 13/03/23.
//

import SwiftUI

struct ScrollDataView: View {
    @Environment(\.managedObjectContext) var db
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.nama),
        SortDescriptor(\.jumlah),
        SortDescriptor(\.harga)
    ], predicate: NSPredicate(value: true)) var catatan: FetchedResults<Catatan>
    
    @State private var searchText = ""
    @State private var predicate: NSPredicate = NSPredicate(value: true)
    
    let itemData = ["Bakso", "Otak-Otak", "Sosis", "Fishcake", "Sotong", "Sempol"]
    var body: some View {
        VStack {
            TextField("Cari Produk", text: $searchText) {
                if !searchText.isEmpty {
                    predicate = NSPredicate(format: "nama CONTAINS[cd] %@", searchText)
                } else {
                    predicate = NSPredicate(value: true)
                }
            }
                .padding()
                .background(.white)
            List {
                ForEach(catatan.filter { predicate.evaluate(with: $0)}, id: \.self) { item in
                    HStack {
                        Text(item.nama ?? "Uknown Item")
                            .font(.system(size: 14, weight: .medium))
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("\(item.jumlah) Pcs")
                                .font(.system(size: 14, weight: .medium))
                            
                            Text("Rp.\(item.harga)")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(item.harga > 0 ? .green : .red)
                        }
                    }
                    .padding()
                }
                .onDelete(perform: deleteCatatan)
            }
        }.preferredColorScheme(.light)
    }
    
    func deleteCatatan(at offsets: IndexSet) {
        for offset in offsets {
            let catatans = catatan[offset]
            db.delete(catatans)
        }
        
        try? db.save()
    }
}

struct ScrollDataView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollDataView()
    }
}
