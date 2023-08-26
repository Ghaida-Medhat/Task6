abstract class AppStateA {}

class MyAppInitial extends AppStateA {}

class LoginLoadingState extends AppStateA {}

class LoginErrorState extends AppStateA {
  final String error;

  LoginErrorState(this.error);
}

class LoginDoneState extends AppStateA {}

/////////////////////////

class SignUpLoadingState extends AppStateA {}

class SignUpErrorState extends AppStateA {
  final String error;

  SignUpErrorState(this.error);
}

class SignUpDoneState extends AppStateA {}

/////////////////////////

class GetDataLoadingState extends AppStateA {}

class GetDataErrorState extends AppStateA {
  final String error;

  GetDataErrorState(this.error);
}

class GetDataDoneState extends AppStateA {}

///////////////////////////

class PickImageState extends AppStateA {}