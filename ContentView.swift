import SwiftUI

struct ContentView: View {
    @StateObject private var passportReader = PassportReader()
    @State private var passportNumber = ""
    @State private var dateOfBirth = ""
    @State private var expiryDate = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    if let photo = passportReader.passportPhoto {
                        Image(uiImage: photo)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(10)
                    }
                    
                    VStack(spacing: 15) {
                        TextField("Passport Number", text: $passportNumber)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Date of Birth (YYMMDD)", text: $dateOfBirth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                        
                        TextField("Expiry Date (YYMMDD)", text: $expiryDate)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                        
                        Button(action: {
                            passportReader.scanPassport(
                                passportNumber: passportNumber,
                                dateOfBirth: dateOfBirth,
                                expiryDate: expiryDate
                            )
                        }) {
                            Text("Scan Passport")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                    
                    if let error = passportReader.error {
                        Text(error)
                            .foregroundColor(.red)
                            .padding()
                    }
                }
            }
            .navigationTitle("Passport Photo Reader")
            .overlay(
                Group {
                    if passportReader.isScanning {
                        ProgressView("Scanning...")
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    }
                }
            )
        }
    }
} 