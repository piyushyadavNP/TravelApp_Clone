import 'package:http/http.dart' as http;
import 'package:travel_app/models/data_model.dart';

class DataService {
  Future<List<DataModel>?> getInfo() async {
    var client = http.Client();

    var uri = Uri.parse('http://mark.bslmeiyu.com/api/getplaces');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return dataFromJson(json);
    }
    return null;
  }
}
