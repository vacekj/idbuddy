import Foundation
import NFCPassportReader
import CoreNFC

class PassportReader: ObservableObject {
    @Published var passportPhoto: UIImage?
    @Published var isScanning = false
    @Published var error: String?
    
    private var passportReader: NFCPassportModel?
    
    func scanPassport(passportNumber: String, dateOfBirth: String, expiryDate: String) {
        isScanning = true
        error = nil
        
        let mrzKey = NFCPassportModel.getMRZKey(passportNumber: passportNumber,
                                               dateOfBirth: dateOfBirth,
                                               expiryDate: expiryDate)
        
        passportReader = NFCPassportModel()
        passportReader?.readPassport(mrzKey: mrzKey) { [weak self] (error) in
            DispatchQueue.main.async {
                self?.isScanning = false
                if let error = error {
                    self?.error = error.localizedDescription
                    return
                }
                
                // Get the passport photo
                if let photoData = self?.passportReader?.passportDataGroup2?.faceImageData {
                    self?.passportPhoto = UIImage(data: photoData)
                }
            }
        }
    }
} 