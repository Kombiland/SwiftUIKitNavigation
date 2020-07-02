//
//  PersonsVCRepresentable.swift
//  SwiftUIKitNavigation
//
//  Created by Johansson, Thomas on 2020-07-02.
//  Copyright © 2020 Johansson, Thomas. All rights reserved.
//

import SwiftUI

struct PersonsListViewControllerRepresentable: UIViewControllerRepresentable {
    
    @ObservedObject var personsListVM = PersonsListViewModel()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PersonsListViewControllerRepresentable>) -> PersonsViewController {
        return PersonsViewController(delegate: makeCoordinator())
    }

    func updateUIViewController(_ uiViewController: PersonsViewController, context: UIViewControllerRepresentableContext<PersonsListViewControllerRepresentable>) {
    }
    
    class Coordinator: NSObject, PersonsDelegate {
        
        var personsListViewControllerRepresentable: PersonsListViewControllerRepresentable
        
        init(_ personsListViewControllerRepresentable: PersonsListViewControllerRepresentable) {
            self.personsListViewControllerRepresentable = personsListViewControllerRepresentable
        }
        
        func open(person: Person) {
            personsListViewControllerRepresentable.personsListVM.goTo(person: person)
        }
        
        func persons() -> [Person] {
            return personsListViewControllerRepresentable.personsListVM.persons
        }
    }
}
