//
//  ButtonsContainer.swift
//  RewardsiOS
//
//  Created by Tharaka Dushmantha on 10/09/23.
//

import SwiftUI

struct ButtonsContainer: View {
    let buttonTitle: String
    let buttonSubTitle: String
    
    var body: some View {
        VStack {
                HStack {
                    VStack {}.frame(width: 5, height: 50).background(Color.black).cornerRadius(5).padding(.trailing)
                    
                    VStack(alignment: .leading) {
                        Text(buttonTitle)
                            .font(.system(.title2))
                        Text(buttonSubTitle)
                            .font(.system(.title2)).bold()
                    }
                    Spacer()
                    Image("arrow").resizable().renderingMode(.template).frame(width: 30, height: 40)
                        .imageScale(.large)
                }.padding(.horizontal)
            }
            .foregroundColor(.white)
            .padding().frame(maxWidth: .infinity)
            .background(Color(BaseColours.darkGrey))
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(BaseColours.primary), lineWidth: 2))
            .cornerRadius(25).shadow(radius: 10)
            .padding()
    }
}

struct ButtonsContainer_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsContainer(buttonTitle: "Save", buttonSubTitle: "$323.34 balance")
    }
}
