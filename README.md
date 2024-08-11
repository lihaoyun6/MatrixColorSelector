<p align="center">
<img src="./img/preview.png#gh-light-mode-only" width="273" />
<img src="./img/preview_dark.png#gh-dark-mode-only" width="273" />
<h1 align="center">MatrixColorSelector</h1>
<h3 align="center">A simpler color picker for SwiftUI on macOS<br><a href="./README_zh.md">[中文版本]</a></h3>
</p>

## Introduction
This package lets you to add grid-style color picker on macOS (similar to the one on iOS)  

## Requirements
macOS 11.0+

## Install
Add `https://github.com/lihaoyun6/MatrixColorSelector` to your project using [Swift Package Manager](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) in Xcode  

## Usage

First, import `MatrixColorSelector` into your code:  

```swift
import MatrixColorSelector
```

Then you can:

```swift
import SwiftUI
import MatrixColorSelector

struct ContentView: View {
    @State var color: Color = .black
    
    var body: some View {
        MatrixColorSelector("Select Color:", selection: $color)
    }
}
```
This will generate a MatrixColorSelector button, and when you click it, it will bring up the popover. Or you can use `MatrixColorSelectorView()` as the content view and wrap it yourself, this will allow you to customize the style of the button.  

If you don't want the color picker to include the "Show Colors..." button (clicking it will open the macOS built-in color picker panel), you can do this:  

```swift
...
MatrixColorSelector(selection: $color, noMoreColors: false)
...
```  
