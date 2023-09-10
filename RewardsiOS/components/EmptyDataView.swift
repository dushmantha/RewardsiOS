//
//  EmptyDataView.swift
//  RewardsiOS
//
//  Created by Tharaka Dushmantha on 10/09/23.
//

import SwiftUI

struct EmptyDataView: View {
    var body: some View {
        VStack{
            Text(LocalizedStringKey("emptydata.title")).font(.title3)
            VStack{
                Text(LocalizedStringKey("emptydata.description")).multilineTextAlignment(.center)
            }.padding()
        }
    }
}

struct EmptyDataView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyDataView()
    }
}
