// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SystemServices",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SystemServices",
            targets: ["SystemServices"]
        )
    ],
    targets: [
        .target(
            name: "SystemServices",
            path: "System Services",
            publicHeadersPath: ".",
            cSettings: [
                // The public umbrella header (SystemServices.h) imports the
                // category headers that live alongside it in Utilities/.
                .headerSearchPath("Utilities")
            ]
        )
    ]
)
