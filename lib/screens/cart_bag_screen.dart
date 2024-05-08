import 'package:flutter/material.dart';
import 'package:semec_task/data/product_list.dart';
import 'package:semec_task/methods/cartbag_method.dart';
import 'package:semec_task/models/product_model.dart';
import 'package:semec_task/screens/confirm_order.dart';

import '../constant/App_Colors.dart';

class CartBagScreen extends StatefulWidget {
  const CartBagScreen({super.key});

  @override
  State<CartBagScreen> createState() => _CartBagScreenState();
}

class _CartBagScreenState extends State<CartBagScreen> {
  /*onDelete start here*/
  void onDelete(ProductModel data){
    setState(() {
      if(cartBag.length==1) {
        cartBag.clear();
      }
      else{
        cartBag.removeWhere((element) => element==data);
      }
    });
  }
  /*onDelete end here*/
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
            MaterialPageRoute(builder: (context) => ConfirmOrder(),),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right:15,bottom: 15,top: 15),
          child: Text('Check Out',style: TextStyle(
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
      title: Text('Cart',style: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),),
        centerTitle: true,
      ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      /*first portion start here*/

      Expanded(child:cartBag.isNotEmpty? ListView.separated(itemBuilder: (context,index){
 return Container(
   height: 120,
   width:335,
   padding: const EdgeInsets.all(4),
   decoration: BoxDecoration(
     color: AppColors.white,
     borderRadius: BorderRadius.circular(1),
   ),
   child:Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: [
       Image.asset(cartBag[index].image),
       Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(cartBag[index].name,style: TextStyle(
             color: AppColors.black,
             fontWeight: FontWeight.w500,
             fontSize: 13,
           ),),
           Text('\$45 (-\$4.00 Tax)',style: TextStyle(
             color:Color(0xFF8F959E),
             fontWeight: FontWeight.w400,
             fontSize: 11,
           ),),
           Row(
             children: [
               Row(children: [
                 IconButton(onPressed: (){
                   setState(() {
                     if(cartBag[index].quantity>=1){
                       cartBag[index].quantity++;
                     }
                     else{
                       cartBag[index].quantity==1;
                     }
                   });
                 }, icon: Icon(Icons.keyboard_arrow_down),),
                 Text(cartBag[index].quantity.toString(),style: TextStyle(
                   color:AppColors.black,
                   fontWeight: FontWeight.w600,
                   fontSize: 13,
                 ),),
                 IconButton(onPressed: (){
                   setState(() {
                     if(cartBag[index].quantity>1){
                       cartBag[index].quantity--;
                     }
                     else{
                       cartBag[index].quantity==1;
                     }
                   });
                 }, icon: Icon(Icons.keyboard_arrow_up),),
               ],),
               const SizedBox(width: 50,),
               IconButton(onPressed: (){
                 onDelete(cartBag[index]);
               }, icon: Icon(Icons.delete_outline,),),
             ],),
         ],),
     ],),
 );
      }, separatorBuilder: (context,index){
        return SizedBox(height: 10,);

      }, itemCount: cartBag.length):Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
              "https://cdn.dribbble.com/users/5107895/screenshots/14532312/media/a7e6c2e9333d0989e3a54c95dd8321d7.gif",

              height: MediaQuery.of(context).size.height*0.2,
            ),
          ),
          Text(
            "Your Cart is empty",
            style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
      ],),
      ),
      /*first portion end here*/
      /*second portion start here*/
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Delivery Address',style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),),
         IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
        ],),
      /*second portion end here*/
      /*third portion start here*/
      ListTile(
        leading: Image.asset('assets/images/Rectangle 584.png'),
        title:  Text('Chhatak, Sunamgonj 12/8AB',style: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),),
        subtitle:  Text('Sylhet',style: TextStyle(
          color: Color(0xFF8F959E),
          fontWeight: FontWeight.w400,
          fontSize: 13,
        ),),
        trailing: Image.asset('assets/images/Check.png'),
      ),
      /*third portion end here*/
      /* portion start here*/
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Payment Method',style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),),
          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios),),
        ],),
      /*four portion end here*/
      /*five portion start here*/
      ListTile(
        leading: Image.asset('assets/images/Frame.png'),
        title:  Text('Visa Classic',style: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),),
        subtitle:  Text('**** 7690',style: TextStyle(
          color: Color(0xFF8F959E),
          fontWeight: FontWeight.w400,
          fontSize: 13,
        ),),
        trailing: Image.asset('assets/images/Check.png'),
      ),
      /*five portion end here*/
/*six portion start here*/
      Text('Order Info',style: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 28,
      ),),
      /*seven portion end here*/
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SubTotal'),
            Text(calculateSubTotal().toString()),
          ],),
   /*seven portion end here*/
        /*eight portion end here*/
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping cost'),
            Text(calculateShippingTotal().toString()),
          ],),
        /*eight portion end here*/
        /*last portion start here*/
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total'),
            Text(calculateTotal().toString(),),
          ],),
        /*last portion end here*/
    ],),
    );
  }
}
