//
//  FlightNumberModule2View.swift
//  PocketTicket
//
//  Created by Vasiliy on 10.11.2022.
//

import SwiftUI

struct FlightNumberModule2View: View {
    
    @AppStorage("shouldShowOnBoarding") var shouldShowOnBoarding: Bool = true
    @ObservedObject var goToModel3: FlightNumberViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, world!")
                    .padding()
            }
            .navigationTitle("Home")
        }
    }
}

// OnBoarding - TabView
struct OnboardingView: View {
    
    @AppStorage("shouldShowOnBoarding123") var shouldShowOnBoarding: Bool = true
    @State private var selectedTab: Int = 0
    @State var areYouGoingToSecondView: Bool
    @ObservedObject var goToModel3: FlightNumberViewModel
    
    var body: some View {
        NavigationView{
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
                            NavigationLink(destination: FlightNumberView(viewModel: goToModel3 ).navigationBarBackButtonHidden(), isActive: $areYouGoingToSecondView) { EmptyView() }
                            // реализовать через NavigationLink
                            let showsDismissButton: Bool = true
                            if showsDismissButton {
                                Button {
                                    shouldShowOnBoarding.toggle()
                                    self.areYouGoingToSecondView = true
                                    
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
}
