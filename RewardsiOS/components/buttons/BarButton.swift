//
//  BarButton.swift
//  RewardsiOS
//
//  Created by Tharaka Dushmantha on 10/09/23.
//

import SwiftUI

import SwiftUI

struct BarButton: View {
    var action: () -> Void
    var titleColor: Color
    var barButtonType: BarButtonType?
    var buttonTitleColor: Color
    
    init(action: @escaping () -> Void = {}, titleColor: Color = Color(BaseColours.secondary), barButtonType: BarButtonType?, buttonTitleColor: Color = Color(BaseColours.secondary) ){
        self.action = action
        self.titleColor = titleColor
        self.barButtonType = barButtonType
        self.buttonTitleColor = buttonTitleColor
    }
    
    var body: some View {
        VStack {
            Button() {
                action()
            }label: {
                VStack(spacing: 0) {
                    if let image = barButtonType?.imageName{
                        Image(systemName:image).renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: barButtonType?.buttonSize.0 , height: barButtonType?.buttonSize.1)
                            .accessibility(identifier: image)
                    }
                    if let title = barButtonType?.buttonTitle {
                        Text(title)
                            .foregroundColor(buttonTitleColor)
                    }
                }.frame(maxHeight: 50)
            }
        }
    }
}

extension BarButton {
    enum BarButtonType {
        case back
        case close
        
        var imageName: String? {
            switch self {
                case .back:
                    return "chevron.backward"
                case .close:
                    return nil
            }
        }
        
        var buttonTitle: String? {
            switch self {
                case .back:
                    return nil
                case .close:
                    return "CLOSE"
            }
        }
        
        var buttonSize: (CGFloat, CGFloat) {
            switch self {
                case .back:
                    return  (35, 35)
                case .close:
                    return (50, 50)
            }
        }
    }
}

struct BarButton_Previews: PreviewProvider {
    static var previews: some View {
        BarButton(barButtonType: nil)
    }
}
