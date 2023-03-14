//
//  CatatPenjualan_App.swift
//  CatatPenjualan.
//
//  Created by Putut Yusri Bahtiar on 11/03/23.
//

import SwiftUI

@main
struct CatatPenjualan_App: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
