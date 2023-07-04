//
//  WeatherButton.swift
//  SwiftUIBasic
//
//  Created by Burak AKCAN on 2.07.2023.
//

import SwiftUI

struct WeatherButton: View {
    
    var buttonTitle: String
    var backGroundColor: Color
    var radius: CGFloat
    var tintColor: Color
    var font: Font
    var height: CGFloat
    var width: CGFloat
    
    /**
     burada bir hiyerarşi söz konusudur eğer frame özelliğini en alta alırsak background color sadece yazı kadar kalacak ama text in asıl kapladığı alan frame kadar olacaktır.
     Spesifik özellikler başta yazılmalıdır .body() gibi
     */
    var body: some View {
        // Button looks like
        Text(buttonTitle)
            .frame(width: width, height: height)
            .background(backGroundColor)
            .font(font)
            .cornerRadius(radius)
            .tint(tintColor)
    }
}
