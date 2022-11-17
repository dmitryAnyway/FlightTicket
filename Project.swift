import ProjectDescription

let project = Project(
  name: "PocketTicket",
  organizationName: "PocketTicket",
  packages: [
    .remote(url: "https://github.com/Alamofire/Alamofire", requirement: .upToNextMinor(from: "5.6.0")),
    .remote(url: "https://github.com/Swinject/Swinject.git", requirement: .upToNextMinor(from: "2.8.0"))
  ],
  settings: .settings(configurations: [
    .debug(name: "Debug", xcconfig: "PocketTicket.xcconfig"),
    .release(name: "Release", xcconfig: "PocketTicket.xcconfig")]),
  targets: [
    Target(
      name: "PocketTicket",
      platform: .iOS,
      product: .app,
      bundleId: "DMZ3030.PocketTicket",
      sources: ["FlightTicket/PocketTicket/Sources/**"],
      resources: ["FlightTicket/PocketTicket/Resources/**"],
      
      dependencies: [
        .package(product: "Alamofire"),
        .package(product: "Swinject")
        ],
      settings: .settings(configurations: [
        .debug(name: "Debug", xcconfig: "PocketTicket.xcconfig"),
        .release(name: "Release", xcconfig: "PocketTicket.xcconfig")]),
    coreDataModels: [CoreDataModel("FlightTicket/PocketTicket/Sources/Services/CoreDataService/PocketTicket.xcdatamodeld")]),
    
    Target(
      name: "PocketTicketTests",
      platform: .iOS,
      product: .unitTests,
      bundleId: "DMZ3030.PocketTicketTests",
      sources: ["FlightTicket/**"],
      dependencies: [
        .target(name: "PocketTicket")
      ]),
    
    Target(
      name: "PocketTicketUITests",
      platform: .iOS,
      product: .uiTests,
      bundleId: "DMZ3030.PocketTicketUITests",
      sources: ["FlightTicket/**"],
      dependencies: [
        .target(name: "PocketTicket")
      ])

  ],
  
  schemes: [
    Scheme(name: "Debug"),
    Scheme(name: "Release")
  ],

  additionalFiles: [".gitignor"])
