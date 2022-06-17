import UIKit

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWhitError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=aeee27106e326ab4eb89d633b6060470&units=metric"
    var delegate: WeatherManagerDelegate?

    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }

    func fetchWeather(lat: Double, lon: Double) {
        let urlString = "\(weatherURL)&lat=\(lat)&lon=\(lon)"
        performRequest(urlString: urlString)
    }

    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWhitError(error: error!)
                    return
                }

                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        
                            delegate?.didUpdateWeather(self, weather: weather)

                    }
                }
            }
            task.resume()
        }
    }

    func parseJSON(weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let cityName = decodedData.name

            let wheather = WeatherModel(id: id, cityName: cityName, temperature: temp)
            return wheather
        } catch {
            delegate?.didFailWhitError(error: error)
            return nil
        }
    }
}
