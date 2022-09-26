import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rootcart/api/ProductApi.dart';
import 'package:rootcart/model/ProductModel.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductApi productApi=ProductApi();
  late List<ProductModel> productModel;
  ProductBloc() : super(ProductInitial()) {
    on<getProduct>((event, emit) => getProductView(event, emit));
  }

  void getProductView(ProductEvent userEvent, Emitter<ProductState> emit )async{
    emit(ProductLoading());
    try{productModel=await productApi.Product();
    emit(ProductLoaded());
    }catch(e){
      emit(ProductError());
      print("Erorr>>>>>>>>>>>>"+e.toString());
    }
}
}
