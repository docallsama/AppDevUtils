# AppDevUtils

<p>

  [![Swift Version Compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FSaik0s%2FAppDevUtils%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/Saik0s/AppDevUtils)

  [![Swift Platform Compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FSaik0s%2FAppDevUtils%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/Saik0s/AppDevUtils)

</p>


<p>
    <img src="https://img.shields.io/badge/License-MIT-blue.svg" />
    <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" />
    </a>
    <a href="https://twitter.com/sa1k0s">
        <img src="https://img.shields.io/badge/Contact-@sa1k0s-lightgrey.svg?style=flat" alt="Twitter: @sa1k0s" />
    </a>
</p>


<p align="center">

Helpers and extensions for app development

</p>


## Installation

### Xcode Projects

Select `File` -> `Swift Packages` -> `Add Package Dependency` and enter `https://github.com/Saik0s/AppDevUtils`.

### Swift Package Manager Projects

You can add `AppDevUtils` as a package dependency in your `Package.swift` file:

```swift
let package = Package(
    //...
    dependencies: [
        .package(
            url: "https://github.com/Saik0s/AppDevUtils",
            exact: "0.0.1"
        ),
    ],
    //...
)
```

From there, refer to `AppDevUtils` as a "target dependency" in any of _your_ package's targets that need it.

```swift
targets: [
    .target(
        name: "YourLibrary",
        dependencies: [
          "AppDevUtils",
        ],
        ...
    ),
    ...
]
```

Then simply `import AppDevUtils` wherever you’d like to use it.

**📝 Note:** To make the library available to your entire project, you could also leverage the [functionality of the `@_exported` keyword](https://forums.swift.org/t/package-manager-exported-dependencies/11615) by placing the following line somewhere at the top level of your project:

```swift
@_exported import AppDevUtils
```
## 🏷 License

`AppDevUtils` is available under the MIT license. See the [LICENSE file](./LICENSE) for more info.
