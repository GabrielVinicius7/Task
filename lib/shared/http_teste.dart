import 'package:erpecommerce/shared/http_service.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserRegister {
  final String email;
  final String username;
  final String senha;
  final String role;

  UserRegister({
    required this.email,
    required this.username,
    required this.senha,
    required this.role,
  });
}

void test_http() async {
  // var response =
  //     await HttpService.post("http://192.168.3.43:8080/auth/register", {
  //   "email": "gabriel@gmail.com",
  //   "username": "Gabriel vinicius",
  //   "password": "123456",
  //   "role": "ADMIN"
  // });
  // print(response.body);

  var response2 = await HttpService.post("http://192.168.3.43:8080/auth/login",
      {"email": "gabriel@gmail.com", "password": "123456"});
  print(response2.body);
}
