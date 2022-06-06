# CellCustomRegistration
[![Swift Version][swift-image]][swift-url] 
![Issues](https://img.shields.io/github/issues/mark-kebo/CellCustomRegistration)
![Forks](https://img.shields.io/github/forks/mark-kebo/CellCustomRegistration)
![Stars](https://img.shields.io/github/stars/mark-kebo/CellCustomRegistration)
![License](https://img.shields.io/github/license/mark-kebo/CellCustomRegistration) 

Package for custom register and use cells and views with UITableView and UICollectionView

## Version

1.0.0

## Installing
CellCustomRegistration support [Swift Package Manager](https://www.swift.org/package-manager/).

### Swift Package Manager
``` swift
// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "CellCustomRegistration",
  platforms: [
       .iOS(.v12),
  ],
  dependencies: [
    .package(name: "CellCustomRegistration", url: "https://github.com/mark-kebo/CellCustomRegistration", from: "1.0.0")
  ],
  targets: [
    .target(name: "YourTestProject", dependencies: ["CellCustomRegistration"])
  ]
)
```
And then import wherever needed: ```import CellCustomRegistration```

#### Adding it to an existent iOS Project via Swift Package Manager

1. Using Xcode 11 go to File > Swift Packages > Add Package Dependency
2. Paste the project URL: https://github.com/mark-kebo/CellCustomRegistration
3. Click on next and select the project target
4. Don't forget to set `DEAD_CODE_STRIPPING = NO` in your `Build Settings` (https://bugs.swift.org/plugins/servlet/mobile#issue/SR-11564)

If you have doubts, please, check the following links:

[How to use](https://developer.apple.com/videos/play/wwdc2019/408/)

[Creating Swift Packages](https://developer.apple.com/videos/play/wwdc2019/410/)

After successfully retrieved the package and added it to your project, just import `CellCustomRegistration` and you can get the full benefits of it.

## Usage example

``` swift
import CellCustomRegistration

final class YourViewController: UIViewController {
    @IBOutlet weak var collectionView: EmptybleCollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCustomNibForCell(YourNibCollectionViewCell.self)
        collectionView.registerCustomClassForCell(YourClassCollectionViewCell.self)
        collectionView.registerCustomHeader(YourHeaderCollectionReusableView.self)
    }
}

extension YourViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let defaultCell = self.collectionView.emptyCell(for: indexPath)
        guard let item = viewModel?.tableData[indexPath.row] else { return defaultCell }
        let cell = collectionView.dequeueCustomReusableCell(for: indexPath, YourNibCollectionViewCell.self)
        cell.cellItem = item
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueCustomHeader(for: indexPath, YourHeaderCollectionReusableView.self)
        header.title = "Title"
        return header
    }
    
    // Extension methods...
}
```

[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
