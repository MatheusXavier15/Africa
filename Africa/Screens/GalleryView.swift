//
//  GalleryView.swift
//  Africa
//
//  Created by Matheus Xavier on 29/07/23.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    
    @State private var selectedAnimal: String = "lion"
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColum: Double = 3.0
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - FUNCTIONS
    
    func gridSwitch() {
        withAnimation {
            gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColum))
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center, spacing: 30) {
                    // MARK: - SELECTED ANIMAL IMAGE
                    Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    // MARK: - SLIDER
                    
                    Slider(value: $gridColum, in: 2...4, step: 1)
                        .padding(.horizontal)
                        .onChange(of: gridColum) { newValue in
                            gridSwitch()
                        }

                    // MARK: - GRID
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach(animals) { animal in
                            Image(animal.image)
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .onTapGesture {
                                    withAnimation {
                                        selectedAnimal = animal.image
                                        haptics.impactOccurred()
                                    }
                                }
                        }
                    }
                    .onAppear {
                        gridSwitch()
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 80)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(MotionAnimationView())
            .edgesIgnoringSafeArea(.top)
            .navigationTitle("Gallery")
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
