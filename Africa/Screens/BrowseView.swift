//
//  ContentView.swift
//  Africa
//
//  Created by Matheus Xavier on 29/07/23.
//

import SwiftUI

struct BrowseView: View {
    // MARK: - PROPERTIES
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack{
                CoverImageView()
                    .frame(height: 325)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                List {
                    ForEach(animals) { animal in
                        AnimalListItemView(animal: animal)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Africa")
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
