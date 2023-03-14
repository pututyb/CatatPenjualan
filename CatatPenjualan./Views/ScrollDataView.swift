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
    ]) var catatan: FetchedResults<Catatan>
    
    
    let itemData = ["Bakso", "Otak-Otak", "Sosis", "Fishcake", "Sotong", "Sempol"]
    var body: some View {
        List {
            ForEach(catatan, id: \.self) { item in
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
