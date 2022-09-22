import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rootcart/api/userApi.dart';
import 'package:rootcart/model/UserModel.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserApi userApi=UserApi();
  late UserModel userModel;
  late String loginResponse;
  UserBloc() : super(UserInitial()) {
    on<getSignup>((event, emit) =>getSignUp(event, emit,name: event.name,password:event.password,email: event.Email ));
    on<getLogin>((event, emit) => getloginbloc(event, emit, name: event.name,password:event.password,email: event.Email ));
  }
  void getSignUp(UserEvent userEvent, Emitter<UserState> emit ,{required String name,required String password, required String email})async{
    emit(UserLoading());
try{userModel=await userApi.signup(name: name, password:password, email: email);
  emit(UserLoaded());
  }catch(e){
emit(UserError());
print("Erorr>>>>>>>>>>>>"+e.toString());
  }
}
  void getloginbloc(UserEvent userEvent, Emitter<UserState> emit ,{required String name,required String password, required String email})async{
    emit(UserLoading());
    try{
      loginResponse =await userApi.Login(name: name, password:password, email: email);
    emit(UserLoaded());
    }catch(e){
      emit(UserError());
      print("Erorr>>>>>>>>>>>>"+e.toString());
    }
  }
}
