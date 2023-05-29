//
//  ContentView.swift
//  ReminderApp
//
//  Created by Can Kanbur on 29.05.2023.
//

import SwiftUI

struct HomeView: View {
    @State var isPresented = false
    var body: some View {
        NavigationView {
            VStack {
                Text("hello world")
                Spacer()
                Button {
                    isPresented = true
                } label: {
                    Text("Add List")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                        .font(.headline)
                }.padding()
            }.sheet(isPresented: $isPresented) {
                NavigationView {
                    AddNewListView { name, color in
                        do {
                            try ReminderService.saveMyList(name, color)
                        } catch {
                            print("error")
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
