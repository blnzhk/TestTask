import Foundation

struct Constants {
    
    struct TableViewCells {
        struct Identifiers {
            static let Detail = "DetailTableViewCell"
            static let TotalEquipmentLosses = "TotalEquipmentLossesTableViewCell"
            static let LossesList = "LossesListTableViewCell"
        }
    }
    
    struct ViewControllers {
        struct Identifiers {
            static let Detail = "DetailController"
        }
    }
    
    struct CollectionViewCells {
        struct Identifiers {
            static let CurrentLosses = "CurrentLossesCollectionViewCell"
        }
    }
    
    struct Storyboards {
        struct Names {
            static let Main = "Main"
            static let Detail = "Detail"
        }
    }
    
    struct Equipments {
        struct Names {
            static let Aircraft = "Aircraft"
            static let Helicopter = "Helicopter"
            static let Tank = "Tank"
            static let Apc = "APC"
            static let FieldArtillery = "Field Artillery"
            static let Mrl = "MRL"
            static let MilitaryAuto = "Military Auto"
            static let FuelTank = "Fuel Tank"
            static let Drone = "Drone"
            static let NavalShip = "Naval Ship"
            static let AntiAircraftWarfare = "Anti-Aircraft Warfare"
            static let SpecialEquipment = "Special Equipment"
            static let MobileSRBMSystem = "Mobile SRBM System"
            static let VehiclesAndFuelTanks = "Vehicles And Fuel Tanks"
            static let CruiseMissiles = "Cruise Missiles"
        }
    }
    
    struct Labels {
        static let Error = "Error"
        static let Day = "Day: "
    }
    
    struct Errors {
        static let TextLabel = "Something went wrong"
    }
    
    struct Validator {
        struct DateFormat {
            static let Input = "yyyy-MM-dd"
            static let Output = "dd.MM.yyyy"
        }
    }
    
    struct Queues {
        struct Label {
            static let TotalData = "fetchQueue"
        }
    }
    
    struct Json {
        struct FileName {
            static let Personnal = "rus_losses_personnel"
            static let TotalEquipmentLosses = "rus_losses_equipment_oryx"
            static let EquipmentLosses = "rus_losses_equipment"
        }
        
        static let OfType = "json"
    }
}
