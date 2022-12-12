//
//  FlightNumberWelcomeViewModel.swift
//  PocketTicket
//
//  Created by Vasiliy on 06.12.2022.
//

import SwiftUI
// MARK: VIEW
struct FlightNumberWelcomeViewModel: View {
    
    @AppStorage("shouldShowOnBoarding") var shouldShowOnBoarding: Bool = true
    @State var selectedTab: Int = 0
    
    var body: some View {
        
        NavigationView(content: {
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
        })
    }
}

// MARK: PREVIEW

struct FlightNumberWelcomeViewModel_Previews: PreviewProvider {
    static var previews: some View {
        FlightNumberWelcomeViewModel()
    }
}


// MARK: Первый экран
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
                
                Text("Are you afraid of flying?")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top,60)
                
                Text("We will help you not to be late for your flight, we will show you the most important information on departure. We will warn you if the flight time changes")
                    .padding()
                    .foregroundColor(Color(.secondaryLabel))
                
                Spacer()
                
            }
            
            VStack {
                
                Spacer()
                
                Button {
                    selectedTab = 1
                } label: {
                    Text("No, I'm not afraid!")
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


// MARK: Второй экран
struct SecondScreenView: View {
    
    @Binding var selectedTab: Int
    @ObservedObject var viewModel = FlightNumberWelcomeModel() // протягивает вызов геолокации
    
    
    var body: some View{
        ZStack{
            
            Image("OnBoarding")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Text("Geolocation request for tracking")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top,60)
                
                Text("For the correct operation of the application, it is necessary to determine the location")
                    .padding()
                    .foregroundColor(Color(.secondaryLabel))
                
                Spacer()
                
                VStack{
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Button {
                        viewModel.requestLocation()
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
    
    @Inject private var flightNumberAssembly: FlightNumberAssemblyProtocol
    
    var body: some View{
        
        ZStack{
            Image("OnBoarding")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Text("Showing 1 time")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top,60)
                
                Text("After pressing the button, the transition to Modul3 will be made and the Welcome menu will no longer be displayed")
                    .padding()
                    .foregroundColor(Color(.secondaryLabel))
                
                Spacer()
                
                VStack {
                    
                    NavigationLink {
                        FlightNumberView(viewModel: flightNumberAssembly.assemble())
                            .navigationBarBackButtonHidden(true)
                        
                    } label: {
                        Text("Get Started")
                            .frame(width: 280, height: 50)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .padding()
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

