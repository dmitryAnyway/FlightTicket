//
//  FlightNumberModule2View.swift
//  PocketTicket
//
//  Created by Vasiliy on 10.11.2022.
//

import SwiftUI

struct FlightNumberModule2View: View {
    
    @AppStorage("_shouldShowOnBoarding") var shouldShowOnBoarding: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, world!")
                    .padding()
            }
            .navigationTitle("Home")
        }
        .fullScreenCover(isPresented: $shouldShowOnBoarding) {
            OnboardingView(shouldShowOnBoarding: $shouldShowOnBoarding)
        }
    }
}

// OnBoarding - TabView
struct OnboardingView: View {
    
    @Binding var shouldShowOnBoarding: Bool
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView (selection: $selectedTab) {
            // Страница 1
            ZStack{
                Image("OnBoarding")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    Text("А Вы боитесь летать?")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top,60)
                    
                    Text("Поможем Вам не опоздать на рейс, покажем самую важную информацию по вылету. Предупредим, если время рейса изменится")
                        .padding()
                        .foregroundColor(Color(.secondaryLabel))
                    
                    Spacer()
                    
                }
                
                VStack {
                    Spacer()
                    
                    Button {
                        selectedTab = 1
                    } label: {
                        Text("Нет, не боюсь!")
                            .frame(width: 280, height: 50)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .padding(.bottom, 90)
                    }
                }
            }
            .tag(0)
            
            // Страница 2
            ZStack{
                
                Image("OnBoarding")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    Text("Запрос геолокации для отслеживания")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top,60)
                    
                    Text("Для корректной работы приложения необходимо предеить локацию")
                        .padding()
                        .foregroundColor(Color(.secondaryLabel))
                    
                    Spacer()
                    
                    VStack{
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Button {
                            LocationManager.shared.requestLocation()
                            selectedTab = 2
                        } label: {
                            Text("Allow location")
                                .frame(width: 280, height: 50)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                        
                        Button  {
                            // Кнопка должна отправлять на Страницу 3
                            selectedTab = 2
                        } label: {
                            Text("Maybe later")
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                }
            }
            .tag(1)
            
            // Страница 3
            ZStack{
                Image("OnBoarding")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    Text("Показ 1 раз")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top,60)
                    
                    Text("После нажатия кнопки будет осуществлен переход на Modul3 и Welcom меню больше не будет показываться")
                        .padding()
                        .foregroundColor(Color(.secondaryLabel))
                    
                    Spacer()
                    
                    VStack {
                        // реализовать через NavigationLink
                        let showsDismissButton: Bool = true
                        if showsDismissButton {
                            Button {
                                shouldShowOnBoarding.toggle()
                                
                            } label: {
                                Text("Get Started")
                                    .frame(width: 280, height: 50)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(15)
                                    .padding()
                            }
                        }
                        Spacer()
                        
                    }
                }
            }
            .tag(2)
        }
        .tabViewStyle(PageTabViewStyle()) // - добавляет переключения касанием
        .onAppear { // красит точки в черный
            UIPageControl.appearance().currentPageIndicatorTintColor = .black
            UIPageControl.appearance().pageIndicatorTintColor = .gray
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FlightNumberModule2View()
    }
}


