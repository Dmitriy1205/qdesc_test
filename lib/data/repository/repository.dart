import 'package:qdesc_test/data/models/customer.dart';
import 'package:qdesc_test/data/network/api_client.dart';

import '../local_storage.dart';

class Repository {
  var ls = LocalStorage.instance;
  var api = ApiClient();

  Future<AuthSuccess> login(String email, String password) async {
    final result = await api.getToken(email, password);
    await ls.writeToken(result.token);
    return result;
  }

  Future<List<Customer>> getCustomers() async {
    final token = await ls.readToken();
    final headers = {
      'Authorization': token,
      'content-type': 'application/json',
      'accept': 'application/json',
    };
    final result = await api.getData(headers: headers);
    return result;
  }
}
