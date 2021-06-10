//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Scott Bowen on 6/3/21.
//

import SwiftUI

struct ContentView: View {
    
    let locationFetcher = LocationFetcher()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]),            startPoint:.topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 10) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("76°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
           
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 88)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 55)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 60)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 25)
         
                }
                    
                Spacer()
                
                Button("Location") {
                    self.locationFetcher.start()
                    if let location = self.locationFetcher.lastKnownLocation {
                        print("Your location is \(location)")
                    } else {
                        print("Your location is unknown")
                    }
                }
                
//                Button("Start Tracking Location") {
//                    self.locationFetcher.start()
//                }
//
//                Button("Read Location") {
//                    if let location = self.locationFetcher.lastKnownLocation {
//                        print("Your location is \(location)")
//                    } else {
//                        print("Your location is unknown")
//                    }
//                }
//                Button {
//                    print("Latitude: \(locationViewModel.userLatitude)")
//                    print("Longitude: \(locationViewModel.userLongitude)")
//                } label: {
//                    Text("Get Longitude and Latitude")
//                        .frame(width: 280, height: 50)
//                        .background(Color.white)
//                        .font(.system(size: 20, weight: .bold, design: .default))
//                        .cornerRadius(10)
//                }
//
                
                        
                
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
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
