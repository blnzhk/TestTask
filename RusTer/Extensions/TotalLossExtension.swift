import Foundation

extension TotalLosses {
    func convertToDetailLossItems() -> [DetailLossesItem] {
        var detailLossItems: [DetailLossesItem] = []
        
        addDetailLossItemIfNeeded(&detailLossItems, name: Constants.Equipments.Names.Aircraft, value: self.aircraft)
        addDetailLossItemIfNeeded(&detailLossItems, name: Constants.Equipments.Names.Helicopter, value: self.helicopter)
        addDetailLossItemIfNeeded(&detailLossItems, name: Constants.Equipments.Names.Tank, value: self.tank)
        addDetailLossItemIfNeeded(&detailLossItems, name: Constants.Equipments.Names.Apc, value: self.apc)
        addDetailLossItemIfNeeded(&detailLossItems, name: Constants.Equipments.Names.FieldArtillery, value: self.fieldArtillery)
        addDetailLossItemIfNeeded(&detailLossItems, name: Constants.Equipments.Names.Mrl, value: self.mrl)
        addDetailLossItemIfNeeded(&detailLossItems, name: Constants.Equipments.Names.MilitaryAuto, value: self.militaryAuto)
        addDetailLossItemIfNeeded(&detailLossItems, name: Constants.Equipments.Names.FuelTank, value: self.fuelTank)
        addDetailLossItemIfNeeded(&detailLossItems, name: Constants.Equipments.Names.Drone, value: self.drone)
        addDetailLossItemIfNeeded(&detailLossItems, name: Constants.Equipments.Names.NavalShip, value: self.navalShip)
        addDetailLossItemIfNeeded(&detailLossItems, name: Constants.Equipments.Names.AntiAircraftWarfare, value: self.antiAircraftWarfare)
        addDetailLossItemIfNeeded(&detailLossItems, name: Constants.Equipments.Names.SpecialEquipment, value: self.specialEquipment)
        addDetailLossItemIfNeeded(&detailLossItems, name: Constants.Equipments.Names.MobileSRBMSystem, value: self.mobileSRBMSystem)
        addDetailLossItemIfNeeded(&detailLossItems, name: Constants.Equipments.Names.VehiclesAndFuelTanks, value: self.vehiclesAndFuelTanks)
        addDetailLossItemIfNeeded(&detailLossItems, name: Constants.Equipments.Names.CruiseMissiles, value: self.cruiseMissiles)
        
        return detailLossItems
    }
    
    func calculateTotalCount() -> Int {
        var totalCount = 0
        let detailLossItems = self.convertToDetailLossItems()
        for item in detailLossItems {
            if let count = Int(item.count) {
                totalCount += count
            }
        }
        return totalCount
    }
    
    private func addDetailLossItemIfNeeded(_ items: inout [DetailLossesItem], name: String, value: Int?) {
        guard let unwrappedValue = value else { return }
        if unwrappedValue != 0 {
            items.append(DetailLossesItem(name: name, count: "\(unwrappedValue)"))
        }
    }
}
