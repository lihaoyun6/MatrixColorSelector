<p align="center">
<img src="./img/preview.png#gh-light-mode-only" width="273" />
<img src="./img/preview_dark.png#gh-dark-mode-only" width="273" />
<h1 align="center">MatrixColorSelector</h1>
<h3 align="center">适用于 macOS 矩阵式颜色选择器<br><a href="./README.md">[English Version]</a></h3>
</p>

## 简介
利用此扩展包, 你可以在 macOS 上使用类似 iOS 的矩阵式颜色选择器  

## 系统要求
macOS 11.0+

## 安装
使用 Xcode 内置的 [Swift Package Manager](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) 将 `https://github.com/lihaoyun6/MatrixColorSelector` 添加到你的项目中  

## Usage

添加完成后首先引入 `MatrixColorSelector`:  

```swift
import MatrixColorSelector
```

然后可以这样创建一个颜色选择器按钮:

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
当用户点击此按钮时, 将会弹出包含颜色选择界面的气泡卡片 (popover). 如果你想自定义按钮样式的话, 也可以调用 `MatrixColorSelectorView()` 作为内容视图, 并自行编写触发按钮.  

如果你不想在颜色选择器中显示 "Show Colors..." 按钮的话 (点击此按钮将会打开系统内置的颜色选择面板), 可以添加参数 `noMoreColors`:  

```swift
...
MatrixColorSelector("some-text",selection: $color, noMoreColors: false)
...
```  
