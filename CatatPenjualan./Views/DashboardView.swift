//
//  DashboardView.swift
//  CatatPenjualan.
//
//  Created by Putut Yusri Bahtiar on 13/03/23.
//

import SwiftUI

struct DashboardView: View {
    @Environment(\.managedObjectContext) var db
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.nama),
        SortDescriptor(\.jumlah),
        SortDescriptor(\.harga)
    ]) var catatan: FetchedResults<Catatan>
    
    var totalProduk: Int {
        catatan.reduce(0) { $0 + Int($1.jumlah) }
    }
    
    var totalNama: Int {
        Set(catatan.map {$0 .nama}).count
    }
    
    var totalHarga: Int {
        catatan.reduce(0) { $0 + Int($1.harga) }
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Group {
                    VStack(alignment: .leading) {
                        Text("Total Nama")
                            .font(.system(size: 10, weight: .light))
                        Text("\(totalNama)")
                            .font(.system(size: 12, weight: .semibold))
                    }
                    Spacer()
                    Rectangle()
                        .fill(.secondary)
                        .frame(width: 1, height: 60)
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Total Penjualan")
                            .font(.system(size: 10, weight: .light))
                        Text("\(totalProduk)")
                            .font(.system(size: 12, weight: .semibold))
                    }
                    Spacer()
                    Rectangle()
                        .fill(.secondary)
                        .frame(width: 1, height: 60)
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Total Pendapatan")
                            .font(.system(size: 10, weight: .light))
                        Text("Rp.\(totalHarga)")
                            .font(.system(size: 12, weight: .semibold))
                    }
                    Spacer()
                }
            }
            .foregroundColor(.black)//ditambahkan karena di real device biar muncul
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
