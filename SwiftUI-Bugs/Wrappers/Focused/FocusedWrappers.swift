//
//  FocusedWrappers.swift
//  SwiftUI-Bugs
//
//  Created by Ilya Cherkasov on 16.07.2022.
//

import SwiftUI

struct FocusedWrappers: View {
    @State var text = "Tap here to unfocuse"
    var body: some View {
        Group {
            NoteEditor()
            NotePreview()
            TextField("", text: $text)
                .border(.black, width: 0.5)
                .padding()
        }.border(Color.red)
    }
}

struct NoteEditor: View {
    @State private var note = "text"

    var body: some View {
        TextEditor(text: $note)
            .frame(width: 300, height: 300)
            .focusedValue(\.noteValue, note)
    }
}

struct NotePreview: View {
    @FocusedValue(\.noteValue) var note

    var body: some View {
        Text(note ?? "Note is not focused")
    }
}

struct FocusedNoteValue: FocusedValueKey {
    typealias Value = String
}

extension FocusedValues {
    var noteValue: FocusedNoteValue.Value? {
        get { self[FocusedNoteValue.self] }
        set { self[FocusedNoteValue.self] = newValue }
    }
}

struct FocusedWrappers_Previews: PreviewProvider {
    static var previews: some View {
        FocusedWrappers()
    }
}
