//
//  ContentView.swift
//  Africa
//
//  Created by Matheus Xavier on 29/07/23.
//

import SwiftUI

struct BrowseView: View {
    // MARK: - PROPERTIES
    
    @State private var isGridViewActive: Bool = false
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 330)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink {
                                AnimalDetailView(animal: animal)
                            } label: {
                                AnimalListItemView(animal: animal)
                            }
                        }
                        CreditsView()
                    }
                    .listStyle(PlainListStyle())
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink {
                                    AnimalDetailView(animal: animal)
                                } label: {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                            CreditsView()
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Africa")
            .toolbar {
                ToolbarItem {
                    HStack(spacing: 16) {
                        Button {
                            withAnimation {
                                isGridViewActive = false
                                haptics.impactOccurred()
                            }
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        Button {
                            withAnimation {
                                isGridViewActive = true
                                haptics.impactOccurred()
                            }
                        } label: {
                            Image(systemName: "square.grid.2x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}
