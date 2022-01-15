//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Aiden.Youkhana on 1/14/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(firstColor: isNight ? .black: .cyan,
                           secondColor: isNight ? .black: .blue,
                           thirdColor: isNight ? .black: .blue,
                           fourthColor: isNight ? .black: .cyan,
                           fifthColor: isNight ? .black: .cyan)
            
            VStack {
                CityTextView(cityName: "Phoenix, Arizona")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                    .padding(.bottom, 29)
                

                
                HStack (spacing: 24){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 49)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 59)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 45)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 50)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "cloud.sun.fill",
                                   temperature: 51)
                    WeatherDayView(dayOfWeek: "SUN",
                                   imageName: "snow",
                                   temperature: 32)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
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

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    //create two different colours schemas: night and day mode for the user
    //.cyan, .blue , .blue, .cyan, .cyan
    var firstColor: Color
    var secondColor: Color
    var thirdColor: Color
    var fourthColor: Color
    var fifthColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [firstColor,
                                                   secondColor,
                                                   thirdColor,
                                                   fourthColor,
                                                   fifthColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    //pass in the name of the city
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    //declare the name of the images depending on the weather status
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack (spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70 , weight: .medium))
                .foregroundColor(.white)
        }
        .padding (.bottom, 40)
    }
}
