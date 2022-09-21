part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}
class GetUserId extends UserEvent{
  String? name;
  String? password;
  GetUserId(this.name,this.password);
}