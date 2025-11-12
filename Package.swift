//swift-tools-version:6.2
import PackageDescription

let package = Package(
    name: "ICTMDBDetailModule",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "ICTMDBDetailModule",
            targets: ["ICTMDBDetailModule"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.1"),
        .package(url: "https://github.com/engingulek/GenericCollectionViewKit",from:"0.0.2"),
        .package(url: "https://github.com/engingulek/ICTMDBModularProtocols", from: "0.0.1"),
        .package(url: "https://github.com/engingulek/ICTMDBNetworkManagerKit", from: "0.0.2"),
        .package(url: "https://github.com/engingulek/ICTMDBViewKit", from: "0.0.2"),
        .package(url: "https://github.com/engingulek/HPDependencyKit", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "ICTMDBDetailModule",
            dependencies: [
                .product(name: "SnapKit", package: "SnapKit"),
                .product(name: "GenericCollectionViewKit", package: "GenericCollectionViewKit"),
                .product(name: "ICTMDBModularProtocols", package: "ICTMDBModularProtocols"),
                .product(name: "ICTMDBNetworkManagerKit", package: "ICTMDBNetworkManagerKit"),
                .product(name: "ICTMDBViewKit", package: "ICTMDBViewKit"),
                .product(name: "DependencyKit", package: "HPDependencyKit")
            ],
            path: "ICTMDBDetailModule"
        )
    ]
)
