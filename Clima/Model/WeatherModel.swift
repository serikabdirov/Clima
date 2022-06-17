import UIKit

struct WeatherModel {
    let id: Int
    let cityName: String
    let temperature: Float

    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }

    var conditionName: String {
        switch id {
        case 200...232:
            return "cloud.bolt" //гроза
        case 300...321:
            return "cloud.drizzle" //дождь
        case 500...531:
            return "cloud.rain" //дождь
        case 600...622:
            return "cloud.snow" //снег
        case 701...781:
            return "cloud.fog" //туман
        case 800:
            return "sun.max" //солнечно
        case 801...804:
            return "cloud.sun" //облачно
        default:
            return "cloud"
        }
    }

    var conditionImage: String {
        switch id {
        case 200...232:
            return "thunderBackground" //гроза
        case 300...321:
            return "rainBackground" //дождь
        case 500...531:
            return "rainBackground" //дождь
        case 600...622:
            return "snowBackground" //снег
        case 701...781:
            return "fogBackground" //туман
        case 800:
            return "sunBackground" //солнечно
        case 801...804:
            return "cloudBackground" //облачно
        default:
            return "cloudBackground"
        }
    }

    var conditionColor: String {
        switch id {
        case 200...232:
            return "thunderWeatherColor" //гроза
        case 300...321:
            return "rainWeatherColor" //дождь
        case 500...531:
            return "rainWeatherColor" //дождь
        case 600...622:
            return "snowWeatherColor" //снег
        case 701...781:
            return "fogWeatherColor" //туман
        case 800:
            return "sunWeatherColor" //солнечно
        case 801...804:
            return "cloudWeatherColor" //облачно
        default:
            return "cloudWeatherColor"
        }
    }
}
