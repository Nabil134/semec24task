import 'package:flutter/material.dart';
import 'package:semec_task/methods/custom_snackbar.dart';

import '../data/product_list.dart';

class CartBagMethod{
void addToCart(context,data){
  if(cartBag.contains(data)){
    ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar().failedSnackBar(),);
  }
  else{
    cartBag.add(data);
    ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar().successSnackBar(),);
  }
}
}
/*calculateSubTotal start here*/
double calculateSubTotal(){
  return cartBag.fold(0.0, (subTotal, data) => subTotal+data.price*data.quantity);
}
/*calculateSubTotal end here*/
/*calculateShippingTotal start here*/
double calculateShippingTotal(){
  if(cartBag.isEmpty){
    return 0.0;
  }
  else{
    return 10;
  }
}
/*calculateShippingTotal end here*/
/*calculateTotal end here*/
double calculateTotal(){
  return calculateShippingTotal() + calculateSubTotal();
}
/*calculateTotal end here*/
double total(){
  return calculateSubTotal() + calculateTotal() + calculateShippingTotal() ;
}