// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Burritos",
    platforms: [
    .macOS(.v10_10),
            .iOS(.v8),
            .tvOS(.v9),
            .watchOS(.v2)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Burritos",
            targets: [
                .target(
                    name: "AtomicWrite",
                    path: "Sources",
                    sources: ["AtomicWrite"]),
                .target(
                    name: "Clamping",
                    path: "Sources",
                    sources: ["Clamping"]),
                .target(
                    name: "Copying",
                    path: "Sources",
                    sources: ["Copying"]),
                .target(
                    name: "DefaultValue",
                    path: "Sources",
                    sources: ["DefaultValue"]),
                .target(
                    name: "DynamicUIColor",
                    path: "Sources",
                    sources: ["DynamicUIColor"]),
                .target(
                    name: "EnvironmentVariable",
                    path: "Sources",
                    sources: ["EnvironmentVariable"]),
                .target(
                    name: "Expirable",
                    path: "Sources",
                    sources: ["Expirable"]),
                .target(
                    name: "LateInit",
                    path: "Sources",
                    sources: ["LateInit"]),
                .target(
                    name: "Lazy",
                    path: "Sources",
                    sources: ["Lazy"]),
                .target(
                    name: "LazyConstant",
                    path: "Sources",
                    sources: ["LazyConstant"]),
                .target(
                    name: "Trimmed",
                    path: "Sources",
                    sources: ["Trimmed"]),
                .target(
                    name: "UndoRedo",
                    path: "Sources",
                    sources: ["UndoRedo"]),
                .target(
                    name: "UserDefault",
                    path: "Sources",
                    sources: ["UserDefault", "UserDefaultTypes.swift"]),
                .target(
                    name: "UserDefaultOptional",
                    path: "Sources",
                    sources: ["UserDefaultOptional", "UserDefaultTypes.swift"]),
            ]),
    ],
    dependencies: [], // No dependencies
    targets: [
        // Template to add a new propert wrapped called {Wrap}:
        // .target(name: "{Wrap}", dependencies: []),
        // .testTarget(name: "{Wrap}Tests", dependencies: ["{Wrap}"]),
        //
        // Please add the target in alphabetical order.
        // Also add "{Wrap}" to the products library targets list.
        .target(name: "AtomicWrite", dependencies: []),
        .testTarget(name: "AtomicWriteTests", dependencies: ["AtomicWrite"]),
        .target(name: "Clamping", dependencies: []),
        .testTarget(name: "ClampingTests", dependencies: ["Clamping"]),
        .target(name: "Copying", dependencies: []),
        .testTarget(name: "CopyingTests", dependencies: ["Copying"]),
        .target(name: "DefaultValue", dependencies: []),
        .testTarget(name: "DefaultValueTests", dependencies: ["DefaultValue"]),
        .target(name: "DynamicUIColor", dependencies: []),
        .testTarget(name: "DynamicUIColorTests", dependencies: ["DynamicUIColor"]),
        .target(name: "EnvironmentVariable", dependencies: []),
        .testTarget(name: "EnvironmentVariableTests", dependencies: ["EnvironmentVariable"]),
        .target(name: "Expirable", dependencies: []),
        .testTarget(name: "ExpirableTests", dependencies: ["Expirable"]),
        .target(name: "LateInit", dependencies: []),
        .testTarget(name: "LateInitTests", dependencies: ["LateInit"]),
        .target(name: "Lazy", dependencies: []),
        .target(name: "LazyConstant", dependencies: []),
        .testTarget(name: "LazyTests", dependencies: ["Lazy", "LazyConstant"]),
        .target(name: "Trimmed", dependencies: []),
        .testTarget(name: "TrimmedTests", dependencies: ["Trimmed"]),
        .target(name: "UndoRedo", dependencies: []),
        .testTarget(name: "UndoRedoTests", dependencies: ["UndoRedo"]),
        .target(name: "UserDefault", dependencies: []),
        .testTarget(name: "UserDefaultTests", dependencies: ["UserDefault"]),
        .target(name: "UserDefaultOptional", dependencies: []),
        .testTarget(name: "UserDefaultOptionalTests", dependencies: ["UserDefaultOptional"]),
    ],
    swiftLanguageVersions: [.v5]
)
