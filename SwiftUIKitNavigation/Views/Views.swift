//
//  ContentView.swift
//  SwiftUIKitNavigation
//
//  Created by Johansson, Thomas on 2020-07-02.
//  Copyright © 2020 Johansson, Thomas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: ListView(personsListVM: PersonsListViewModel())) {
                Text("Persons")
            }
        }
    }
}

struct ListView: View {
    
    @ObservedObject var personsListVM = PersonsListViewModel()
    
    var body: some View {
        PersonsListViewControllerRepresentable(personsListVM: personsListVM)
        .navigationBarTitle(Text("Persons"), displayMode: .inline)
        .navigationBarItems(trailing:
            HStack {
                NavigationLink(destination: DetailView(personsListVM: personsListVM), isActive: self.$personsListVM.goToDetail) {
                    EmptyView()
                }
        })
    }
}

struct DetailView: View {
    
    @ObservedObject var personsListVM = PersonsListViewModel()
    
    var body: some View {
        Text(personsListVM.person!.fullName)
    }
}
