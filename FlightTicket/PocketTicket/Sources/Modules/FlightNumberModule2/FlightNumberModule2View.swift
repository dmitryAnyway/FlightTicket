//
//  FlightNumberModule2View.swift
//  PocketTicket
//
//  Created by Vasiliy on 10.11.2022.
//

import SwiftUI


// MARK: VIEW
struct FlightNumberModule2View: View {
    
    @AppStorage("shouldShowOnBoarding") var shouldShowOnBoarding: Bool = true
    @State var selectedTab: Int = 0
    
    var body: some View {
        
            TabView (selection: $selectedTab) {
                
                FirstScreenView(selectedTab: $selectedTab)
                    .tag(0)
                SecondScreenView(selectedTab: $selectedTab)
                    .tag(1)
                ThirdScreenView()
                    .tag(2)
                
            }
        
        .tabViewStyle(PageTabViewStyle()) // Выбор стиля прокрутки TabView с точками
        .onAppear { // красит точки в черный
            UIPageControl.appearance().currentPageIndicatorTintColor = .black
            UIPageControl.appearance().pageIndicatorTintColor = .gray
        }
    }
}

// MARK: PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FlightNumberModule2View()
    }
}


//MARK: Первый экран
struct FirstScreenView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            // background
            Image("OnBoarding")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
            // fontground
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
    }
}


//MARK: Второй экран
struct SecondScreenView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View{
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
                        FlightNumberViewModule2Model.shared.requestLocation()
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
    }
}

// MARK: Третий экран

struct ThirdScreenView: View {
    
    @AppStorage("shouldShowOnBoarding") var shouldShowOnBoarding: Bool = false
    
    var body: some View{
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
    }
}

