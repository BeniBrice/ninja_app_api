import 'package:ninja_api/models/covid.dart';
import 'package:ninja_api/repository/covid_repository.dart';

class ModelView {
  final covidRepository = CovidRepository();
  Future<Covid> fetchCovidData(String country) async {
    final response = await covidRepository.fetchCategorieNewsApi(country);

    return response;
  }

  Future<Covid> fetchData(String country) async {
    final response = await covidRepository.fetchData();
    return response;
  }
}
