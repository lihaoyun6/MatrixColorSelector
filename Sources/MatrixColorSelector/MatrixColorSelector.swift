// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct MatrixColorSelector: View {
    @Binding var selection: Color
    @State private var popover: Bool = false
    var titleKey: LocalizedStringKey
    var noMoreColors: Bool
    
    public init(_ titleKey: LocalizedStringKey, selection: Binding<Color>, noMoreColors: Bool = false) {
        self.titleKey = titleKey
        self._selection = selection
        self.noMoreColors = noMoreColors
    }
    
    public var body: some View {
        HStack {
            if titleKey != "" { Text(titleKey) }
            Button(action: {
                popover = true
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(popover ? Color(NSColor(white: 0.8, alpha: 1)) : Color(NSColor.controlColor))
                    .shadow(radius: 1, y: 0.5)
                    RoundedRectangle(cornerRadius: 2, style: .continuous)
                    .fill(selection)
                    .frame(width: 38, height: 17)
                    .overlay(
                        RoundedRectangle(cornerRadius: 2, style: .continuous)
                        .stroke(lineWidth: 1)
                        .opacity(0.25)
                    )
                    .mask(RoundedRectangle(cornerRadius: 2, style: .continuous))
                    //.padding([.leading, .trailing], -5).padding([.top, .bottom], 2)
                }
                
            })
            .buttonStyle(.plain)
            .frame(width: 44, height: 23)
            .popover(isPresented: $popover, arrowEdge: .bottom) {
                MatrixColorSelectorView(selection: $selection, noMoreColors: noMoreColors).padding(10)
            }
        }
    }
}

public struct MatrixColorSelectorView: View {
    @Binding var selection: Color
    var noMoreColors: Bool
    private var colorPreset: [Color] = [.red, Color(.orange), Color(.yellow), Color(.green), Color(.cyan), Color(.blue), Color(NSColor.magenta), Color(.purple), Color(.brown), .white, .gray, .black]
    private var colorMatrix: [[Color?]] = [
        [.clear, "133648".color, "1f4d62".color, "2f6c8c".color, "3c8ab1".color, "48a0d2".color, "59c4f7".color, "79d2f8".color, "a6e2fa".color, "d2f0fd".color],
        [.white, "071d54".color, "0f2d77".color, "1942a3".color, "2255ce".color, "285ff6".color, "4e86f6".color, "7fa6f7".color, "aec4f9".color, "d6e2fc".color],
        [Color(NSColor(white: 0.9, alpha: 1)), "0f0639".color, "180b4f".color, "281371".color, "331b8f".color, "4724ac".color, "5832e2".color, "7f52f5".color, "ab8ef6".color, "d6cafa".color],
        [Color(NSColor(white: 0.8, alpha: 1)), "2a093b".color, "3f1256".color, "591e78".color, "702899".color, "8d32b7".color, "b042eb".color, "c55ff6".color, "d796f8".color, "eacbfb".color],
        [Color(NSColor(white: 0.7, alpha: 1)), "370c1b".color, "4e162a".color, "6f223e".color, "8e2e4f".color, "aa395d".color, "d54a7a".color, "de789d".color, "e8a6c0".color, "f2d4df".color],
        [Color(NSColor(white: 0.6, alpha: 1)), "541107".color, "771e0e".color, "a72c18".color, "d13a20".color, "ea512e".color, "ed6c59".color, "ef9286".color, "f4b8b1".color, "f9dcd8".color],
        [Color(NSColor(white: 0.5, alpha: 1)), "532009".color, "722f10".color, "a0451a".color, "c95b24".color, "ed742e".color, "ef8d55".color, "f2a984".color, "f6c7af".color, "fae4d8".color],
        [Color(NSColor(white: 0.4, alpha: 1)), "53360e".color, "734b17".color, "a06a23".color, "c9882f".color, "f3ae3c".color, "f4b757".color, "f6c882".color, "f9daae".color, "fcedd7".color],
        [Color(NSColor(white: 0.3, alpha: 1)), "523e0f".color, "735919".color, "a07d27".color, "caa035".color, "f5c944".color, "f7cd5b".color, "f9da85".color, "fbe5af".color, "fcf2d7".color],
        [Color(NSColor(white: 0.2, alpha: 1)), "65611c".color, "8c8628".color, "c2bd3c".color, "f3ec4e".color, "fefc66".color, "fff781".color, "fefaa1".color, "fffcc0".color, "fdfde0".color],
        [Color(NSColor(white: 0.1, alpha: 1)), "505518".color, "707624".color, "9da537".color, "c6d046".color, "dceb5c".color, "e6ef79".color, "edf29b".color, "f3f6bf".color, "f8fadf".color],
        [.black, "2b3d16".color, "3f5623".color, "587933".color, "729b45".color, "86b954".color, "a3d16e".color, "badd95".color, "d2e6b9".color, "e3ecd6".color]]
    
    public init(selection: Binding<Color>, noMoreColors: Bool = false) {
        self._selection = selection
        self.noMoreColors = noMoreColors
    }
    
    public var body: some View {
        VStack(spacing: 6) {
            HStack(spacing: 1) {
                ForEach(colorPreset, id: \.self) { color in
                    ColorCellButton(color: color, selection: $selection)
                        .focusable(false)
                }
            }
            HStack(spacing: 1) {
                ForEach(colorMatrix, id: \.self) { colors in
                    VStack(spacing:1) {
                        ForEach(colors, id: \.self) { color in
                            if let color = color {
                                ColorCellButton(color: color, selection: $selection)
                                    .focusable(false)
                            }
                        }
                    }
                }
            }
            if !noMoreColors {
                Button(action: {}, label: { Text("Show Colors...").frame(width: 165) })
                    .focusable(false)
                    .overlay(
                        ColorPicker("", selection: $selection)
                            .scaleEffect(x: 4.2, y: 1)
                            .focusable(false)
                            .offset(x: -17)
                            .mask(
                                Rectangle()
                                    .frame(height: 1)
                                    .offset(y: 15)
                            )
                    )
                    .mask(Rectangle().frame(width: 184, height: 24))
            }
        }
    }
}

struct ColorCellButton: View {
    var color: Color
    @Binding var selection: Color
    @State var mouseOver: Bool = false
    
    var body: some View {
        Button(action: {
            selection = color
        }, label: {
            ZStack {
                ZStack {
                    if color == .clear {
                        Color.white
                            .overlay(
                                Rectangle()
                                    .fill(.red)
                                    .frame(height: 1)
                                    .rotationEffect(Angle(degrees: -45))
                            )
                        if mouseOver {
                            Rectangle()
                                .stroke(.black.opacity(0.25), lineWidth: 1)
                                .padding(0.5)
                        }
                    } else {
                        color
                            .overlay(
                                Rectangle()
                                    .stroke((mouseOver ? .black.opacity(0.25) : .primary.opacity(0.3)), lineWidth: 1)
                                    .padding(0.5)
                            )
                    }
                }.frame(width: mouseOver ? 10: 14, height: mouseOver ? 10: 14)
                if mouseOver {
                    ZStack {
                        RoundedRectangle(cornerRadius: 2, style: .continuous)
                            .fill(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2, style: .continuous)
                                    .stroke(lineWidth: 1)
                                    .opacity(0.4)
                            )
                        Rectangle()
                            .fill(.black)
                            .frame(width: 10, height: 10)
                            .blendMode(.destinationOut)
                    }
                    .compositingGroup()
                    .frame(width: 15, height: 15)
                }
            }
        })
        .buttonStyle(.plain)
        .onHover { hovering in mouseOver = hovering }
        .frame(width: 14, height: 14)
    }
}

extension String {
    var color: Color? {
        var hexSanitized = self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexSanitized.hasPrefix("#") { hexSanitized.remove(at: hexSanitized.startIndex) }
        
        guard hexSanitized.count == 6 else { return nil }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        return Color(NSColor(displayP3Red: red, green: green, blue: blue, alpha: 1.0))
    }
}
