//
//  AddNewListView.swift
//  ReminderApp
//
//  Created by Can Kanbur on 29.05.2023.
//

import SwiftUI

struct AddNewListView: View {
    @State var name = ""
    @State var selectedColor: Color = .yellow
    @Environment(\.dismiss) var dismiss
    var isFormValid: Bool {
        return !name.isEmpty
    }

    let onSave: (String, UIColor) -> Void
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "line.3.horizontal.circle.fill")
                    .foregroundColor(selectedColor)
                    .font(.system(size: 100))

                TextField("List Name", text: $name)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.characters)
            }.padding(30)
                .clipShape(RoundedRectangle(cornerRadius: 19, style: .continuous))
            ColorPickerView(selectedColor: $selectedColor)
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("New List")
                        .font(.headline)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Close")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        onSave(name,UIColor(selectedColor));
                        dismiss()
                    } label: {
                        Text("Done")
                    }.disabled(!isFormValid)
                }
            }
    }
}

struct AddNewListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddNewListView(onSave: { _, _ in })
        }
    }
}
