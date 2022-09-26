part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}
class getLogin extends UserEvent{
  String name;
  String Email;
  String password;
  getLogin(this.Email,this.name,this.password);
}
class getSignup extends UserEvent{
String name;
String Email;
String password;
getSignup(this.Email,this.name,this.password);
}