
abstract class ProfileState {}

class ProfileInitial extends ProfileState {

}

class UDatabar extends ProfileState {
}

class UDatadone extends ProfileState {
}

class UDataerror extends ProfileState {
  final String error ;
  UDataerror(this.error);

}

class Pickimg extends ProfileState {
}
