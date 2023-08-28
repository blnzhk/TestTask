import Foundation

protocol TotalLossesMapperProtocol {
    func mapToTotalLosses(from personalLosses: [PersonalLosses], equipmentLosses: [EquipmentLosses]) -> [TotalLosses]
}

class TotalLossesMapper: TotalLossesMapperProtocol {
    
    func mapToTotalLosses(from personalLosses: [PersonalLosses], equipmentLosses: [EquipmentLosses]) -> [TotalLosses] {
        var totalLosses: [TotalLosses] = []
        
        for (personal, equipment) in zip(personalLosses, equipmentLosses) {
            let totalLoss = TotalLosses(
                date: DateFormatter.formattedDate(from: personal.date,
                                                  inputFormat: Constants.Validator.DateFormat.Input,
                                                  outputFormat: Constants.Validator.DateFormat.Output),
                day: personal.day,
                personnel: personal.personnel,
                aircraft: equipment.aircraft,
                helicopter: equipment.helicopter,
                tank: equipment.tank,
                apc: equipment.apc,
                fieldArtillery: equipment.fieldArtillery,
                mrl: equipment.mrl,
                militaryAuto: equipment.militaryAuto,
                fuelTank: equipment.fuelTank,
                drone: equipment.drone,
                navalShip: equipment.navalShip,
                antiAircraftWarfare: equipment.antiAircraftWarfare,
                specialEquipment: equipment.specialEquipment,
                mobileSRBMSystem: equipment.mobileSRBMSystem,
                greatestLossesDirection: equipment.greatestLossesDirection,
                vehiclesAndFuelTanks: equipment.vehiclesAndFuelTanks,
                cruiseMissiles: equipment.cruiseMissiles
            )
            
            totalLosses.append(totalLoss)
        }
        return totalLosses
    }
}
