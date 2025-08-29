// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "buddyChatGPT",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .executable(name: "buddyChatGPT", targets: ["buddyChatGPT"])
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "buddyChatGPT",
            dependencies: [],
            path: "Sources",
            resources: [.copy("Resources")]
        )
    ]
)