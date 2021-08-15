import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool obscurePassword = true;

  @observable
  bool isLoading = false;

  @observable
  bool isLoggedIn = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void togglePasswordVisible() { obscurePassword = !obscurePassword;
  print(obscurePassword);
   }

  @action
  void toggleLoadingState(bool state) => isLoading = state;

  @action
  Future<void> doLogin() async {
    if (!isEmailValid) return Future.error("Email inválido");
    if (password.isEmpty) return Future.error("A senha não pode ser vazia");

    toggleLoadingState(true);
    await Future.delayed(const Duration(seconds: 2));
    toggleLoadingState(false);
    isLoggedIn = true;    
    password = "";
  }

  @computed
  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  @action
  void logout() {
    isLoggedIn = false;
    email = "";
  }

}