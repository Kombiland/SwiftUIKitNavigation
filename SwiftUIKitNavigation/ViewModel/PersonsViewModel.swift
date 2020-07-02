//
//  Person.swift
//  SwiftUIKitNavigation
//
//  Created by Johansson, Thomas on 2020-07-02.
//  Copyright © 2020 Johansson, Thomas. All rights reserved.
//

import SwiftUI

struct Person {
    let name: String
    let fullName: String
}

class PersonsListViewModel: ObservableObject {
    
    @Published var goToDetail = Bool()
    @Published var person: Person? = nil
    @Published var persons = [Person(name: "Holly", fullName: "Holly Golightly"),
                              Person(name: "Sabrina", fullName: "Sabrina Fairchild")]

    func goTo(person: Person) {
        self.person = person
        self.goToDetail.toggle()
    }
}
