//
//  ContentView.swift
//  SwiftUIBasic
//
//  Created by Burak AKCAN on 26.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight: Bool = false
    
    var body: some View {
        ZStack {
            BackgorundView(isNight: $isNight)
            VStack {
                CityTextView(isNight: $isNight, text: "Hava Durumu")
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temprature: isNight ? "19" : "28")
                 
                HStack(spacing: 20) {
                    WeatheDayView(dayOfWeek: "Pztesi", imageName: "cloud.sun.fill", temprature: 24)
                    WeatheDayView(dayOfWeek: "Salı", imageName: "sun.max.fill", temprature: 28)
                    WeatheDayView(dayOfWeek: "Çar", imageName: "wind.snow", temprature: 21)
                    WeatheDayView(dayOfWeek: "Per", imageName: "cloud.sun.fill", temprature: 22)
                    WeatheDayView(dayOfWeek: "Cuma", imageName: "sunset.fill", temprature: 27)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(buttonTitle: "change day time", backGroundColor: .white, radius: 14, tintColor: .gray, font: .system(size: 18, weight: .bold), height: 50, width: 250)
                }
                
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatheDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temprature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 18, weight: .regular, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width * 0.1,height: UIScreen.main.bounds.width * 0.1)
            Text("\(temprature) C")
                .font(.system(size: 24,weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgorundView: View {
    
   @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {
    @Binding var isNight: Bool
    var text: String
    var body: some View {
        Text(text)
            .font(.system(size: 32, weight: .bold, design: .default))
            .foregroundColor(isNight ? .red : .white)
            .padding()
    }
}

struct MainWeatherView: View {
    
    var imageName: String
    var temprature: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width * 0.45,height: UIScreen.main.bounds.width * 0.45)
            Text(temprature)
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 50)
    }
}

