//
//  LoadingView.swift
//  RewardsiOS
//
//  Created by Tharaka Dushmantha on 10/09/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack( spacing: 8){
            ProgressView()
            Text(LocalizedStringKey("loading")).font(.title3)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
