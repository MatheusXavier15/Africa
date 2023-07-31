//
//  MapAnnotationViw.swift
//  Africa
//
//  Created by Matheus Xavier on 30/07/23.
//

import SwiftUI

struct MapAnnotationViw: View {
    // MARK: - PROPERTIES
    
    var location: Location
    @State private var animation: Double = 0.0
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            .clipShape(Circle())
        }
        .onAppear{
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

struct MapAnnotationViw_Previews: PreviewProvider {
    static let locations: [Location] = Bundle.main.decode("locations.json")
    static var previews: some View {
        MapAnnotationViw(location: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
