//
//  NavigationBar.swift
//  RewardsiOS
//
//  Created by Tharaka Dushmantha on 10/09/23.
//

import SwiftUI

struct NavigationBar <Content: View> : View {
    let title: Text
    let leadingContent: Content?
    let trailingContent: Content?
    var backgroundColor: UIColor?
    var titleColor: UIColor?
    
    init(title: Text, @ViewBuilder leadingContent: @escaping () -> Content? = { nil }, @ViewBuilder trailingContent: @escaping () -> Content? = { nil }, backgroundColor: UIColor? = BaseColours.primary, titleColor: UIColor? = BaseColours.secondary) {
        self.title = title
        self.leadingContent = leadingContent()
        self.trailingContent = trailingContent()
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
    
    var body: some View {
            VStack{}
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle(title, displayMode: .large)
                .navigationBarItems(leading: leadingContent, trailing: trailingContent)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(Color(self.backgroundColor ?? BaseColours.primary), for: .navigationBar)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: Text("Rewards")
                      ,leadingContent: {
            BarButton(barButtonType: .back)
        },trailingContent: {
            BarButton(barButtonType: .close)
        },backgroundColor: BaseColours.primary, titleColor: BaseColours.secondary)
    }
}
