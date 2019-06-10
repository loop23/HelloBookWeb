// swift-tools-version:4.0
// Una prova di loop di accedere alla risorsa Book di TheFactory, per capire
// quanto fosse complesso (un po') e quanto fosse performante (abbastanza, ma 2x
// rispetto a rails, non il 20x che mi aspettavo!)
import PackageDescription

let package = Package(
    name: "HelloBookWeb",
    dependencies: [
        // A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        // Non-blocking, event-driven Swift client for PostgreSQL.
        .package(url: "https://github.com/vapor/fluent-postgresql.git", from: "1.0.0"),
        // An expressive, performant, and extensible templating language built for Swift.
        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.0"),
    ],
    targets: [
        .target(name: "App", dependencies: ["FluentPostgreSQL", "Leaf", "Vapor"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)
