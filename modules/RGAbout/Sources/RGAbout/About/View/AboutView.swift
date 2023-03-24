//
//  AboutView.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import SwiftUI

public struct AboutView: View {
    public init() {}
    public var body: some View {
        ScrollView {
            VStack {
                Image("luthfiprofilepicture")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: 150,
                        height: 150
                    )
                    .clipShape(Circle())
                
                Text("Luthfi Abdur Rahim")
                    .font(.title)
                
                Text("luthfi.abdurrahim.2014@alumni.ui.ac.id")
                                
                Spacer(minLength: 30)
                
                Button(action: {
                    if let url = URL(string: "https://www.linkedin.com/in/luthfi-ar") {
                       UIApplication.shared.open(url)
                    }
                }) {
                    Text("My Linkedin").font(.title2)
                }
                
                Spacer(minLength: 30)
                
                Text("This is the app for showing all games in the world. I hope it will fun and add to your new knowledge. Thank you.")
            }
            .padding()
        }
    }
}
