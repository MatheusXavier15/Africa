//
//  Credits.swift
//  Africa
//
//  Created by Matheus Xavier on 30/07/23.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 128, height: 128)
                
                Text("""
      Copyright © Matheus Xavier
      All right reserved
      """)
                .font(.footnote)
                .multilineTextAlignment(.center)
            } //: VSTACK
            .padding()
            .opacity(0.4)
            Spacer()
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
