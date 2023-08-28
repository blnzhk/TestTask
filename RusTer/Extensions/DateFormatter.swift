import Foundation

extension DateFormatter {
    static func formattedDate(from inputDateString: String, inputFormat: String, outputFormat: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = inputFormat
        
        if let date = inputFormatter.date(from: inputDateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = outputFormat
            let formattedDateString = outputFormatter.string(from: date)
            return formattedDateString
        } else {
            return nil
        }
    }
}
