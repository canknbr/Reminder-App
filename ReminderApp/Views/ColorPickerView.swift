//
//  ColorPickerView.swift
//  ReminderApp
//
//  Created by Can Kanbur on 29.05.2023.
//

import SwiftUI

struct ColorPickerView: View {
    @Binding var selectedColor : Color
    let colors : [Color] = [.red,.green,.blue,.yellow,.orange,.purple]
    var body: some View {
        HStack{
            ForEach(colors,id: \.self) { color in
                ZStack{
                    Circle()
                        .fill()
                        .foregroundColor(color)
                        .padding(2)
                    Circle()
                        .strokeBorder(selectedColor == color ? .gray.opacity(0.4) : .clear ,lineWidth: 3)
                        .scaleEffect(CGSize(width: 1.2, height: 1.2))
                }.onTapGesture {
                    withAnimation(.linear){
                        selectedColor = color
                    }
                }
            }
        }.padding(.horizontal,10)
            .frame(maxWidth: .infinity,maxHeight: 100)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView(selectedColor: .constant(.purple))
    }
}
