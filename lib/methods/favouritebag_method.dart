import 'package:flutter/material.dart';
import 'package:semec_task/methods/custom_snackbar.dart';

import '../data/product_list.dart';
import '../screens/Home Page View/home_page_view.dart';

class FavouriteBagMethod{
  void addToFavourite(context,data){
    if(favouriteBag.contains(data)){
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBarForFavouriteBag().failedSnackBar(),);
    }
    else{
      favouriteBag.add(data);
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBarForFavouriteBag().successSnackBar(),);
    }
  }
}
