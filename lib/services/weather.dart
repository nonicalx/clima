import 'package:clima/services/request_processor.dart';
import 'package:clima/services/location.dart';

class WeatherModel {
  Future getWeatherInLocation() async {
    Location local = new Location();
    await local.getCurrentLocation();
    const apiKey = '23fe94394ac9ddf520478bf3e3e6a7c4';
    RequestProcessor processor = new RequestProcessor();
    Map data = await processor.getData(
      url:
          "https://api.openweathermap.org/data/2.5/weather?lat=${local.latitude}&lon=${local.longitude}&appid=$apiKey&units=metric",
    );
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
