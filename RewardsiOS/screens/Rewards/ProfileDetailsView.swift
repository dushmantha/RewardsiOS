//
//  ProfileDetailsView.swift
//  RewardsiOS
//
//  Created by Tharaka Dushmantha on 10/09/23.
//

import SwiftUI

struct ProfileDetailsView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Hello")
                Text("Elora Lang").bold()
            }.padding()
            Spacer()
            VStack {
                Image("profile")
                    .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                        .shadow(radius: 10)
            }.padding()
        }.padding(.vertical).background(Color(BaseColours.primary)).cornerRadius(20, corners: [.bottomLeft, .bottomRight])
    }
}

struct ProfileDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailsView()
    }
}
