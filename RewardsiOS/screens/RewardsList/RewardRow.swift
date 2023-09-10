//
//  RewardRow.swift
//  RewardsiOS
//
//  Created by Tharaka Dushmantha on 10/09/23.
//

import SwiftUI

struct RewardRow: View {
    let source: String
    let date: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 8){
            Text(source).font(.title3) .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            Text(date).font(.title3) .frame(maxWidth: .infinity, alignment: .trailing)
        }.padding()
    }
}

struct RewardRow_Previews: PreviewProvider {
    static var previews: some View {
        RewardRow(source: "Promotion Bonus", date: "12-09-20")
    }
}
