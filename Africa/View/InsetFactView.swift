//
//  InsetFactView.swift
//  Africa
//
//  Created by Matheus Xavier on 30/07/23.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: - PROPERTIES
    
    let animal: Animal
    
    // MARK: - BODY
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { fact in
                    Text(fact)
                        .font(.headline)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minWidth: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animals[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
