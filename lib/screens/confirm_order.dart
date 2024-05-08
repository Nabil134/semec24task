import 'package:flutter/material.dart';
import 'package:semec_task/constant/App_Colors.dart';
import 'package:semec_task/methods/cartbag_method.dart';
import 'package:semec_task/screens/Home%20Page%20View/home_page_view.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({super.key});

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*bottomNavigationBar start here*/
      bottomNavigationBar: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(375, 75),
          backgroundColor: AppColors.kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePageView(),),
          ) ;
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right:15,bottom: 15,top: 15),
          child: Text('Continue Shopping',style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),),
        ),
      ),
      /*bottomNavigation Bar end here*/
    appBar: AppBar(
      leading:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Color(0xffF5F6FA),
          child: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        /*first portion start here*/
        Center(child: Image.asset('assets/images/order.gif'),),
        /*first portion end  here*/
        const SizedBox(height: 10,),
        /*second portion start here*/
        Text('Order Confirmed!',style: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w600,
          fontSize:28,
        ),),
        /*second portion end here*/
        /*third portion start here*/
        Text('Your order has been confirmed, we will send\n you confirmation email shortly.',style: TextStyle(
          color: Color(0xFF8F959E),
          fontWeight: FontWeight.w400,
          fontSize:15,
        ),),
        /*third portion end here*/
        const SizedBox(height: 100,),
        /*last portion start here*/
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFF5F5F5),
          ),
          onPressed: (){}, child: Text('Your Total is: \$${total().toString()}',style: TextStyle(
          fontSize: 17,
          fontWeight:FontWeight.w700,
          color: AppColors.kPrimaryColor,
        ),),),
        /*last portion end here*/
      ],),
    ),
    );
  }
}
