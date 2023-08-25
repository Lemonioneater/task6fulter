
abstract class AccountsState {}

class AccountsInitial extends AccountsState {}

//login
class Loginbar extends AccountsState {
}

class Logindone extends AccountsState{
}

class Loginerror extends AccountsState {
  final String error ;
  Loginerror(this.error);
}



// signup
class Signupbar extends AccountsState {
}

class Signupdone extends AccountsState {
}

class Signuperror extends AccountsState {
  final String error ;
  Signuperror(this.error);
}