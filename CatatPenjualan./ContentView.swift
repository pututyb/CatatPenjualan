//
//  ContentView.swift
//  CatatPenjualan.
//
//  Created by Putut Yusri Bahtiar on 11/03/23.
//

import SwiftUI

struct ContentView: View {
    let currentDate = Date()
    var body: some View {
        NavigationView {
            ZStack{
                Rectangle()
                    .fill(Color("bg"))
                
                GeometryReader { geometry in
                    Rectangle()
                        .fill(.blue)
                        .frame(maxWidth: .infinity, maxHeight: geometry.size.height * 0.4)
                }
                
                VStack(alignment: .leading) {
                    GeometryReader { geometry in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Welcom Back 👋")
                                    .font(.system(size: 18, weight: .semibold))
                                Text(DateFormatter.localizedString(from: currentDate, dateStyle: .medium, timeStyle: .none))
                            }
                                Spacer()
                            NavigationLink(destination: AddDataView()) {
                                Image(systemName: "doc.badge.plus")
                                    .resizable()
                            }
                            .frame(width: 25, height: 25)
                                
                        }
                        .foregroundColor(.white)
                        .padding(.all, geometry.size.width * 0.05)
                        .padding(.top, geometry.size.height * 0.05)
                        
                        Text("Total Data")
                            .padding(.all, geometry.size.width * 0.05)
                            .padding(.top, geometry.size.height * 0.15)
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                        
                        DashboardView()
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.width * 0.25)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.all, geometry.size.width * 0.05)
                        .padding(.top, geometry.size.height * 0.2)
                        
                        ScrollDataView()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.trailing)
                        .frame(width: geometry.size.width * 0.95, height: geometry.size.width * 1)
                        .padding(.all, geometry.size.width * 0.05)
                        .padding(.top, geometry.size.height * 0.4)
                    }
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
