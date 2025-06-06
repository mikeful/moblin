import SwiftUI

struct CreateButtonView: View {
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Spacer()
                Text("Create")
                Spacer()
            }
        }
    }
}
