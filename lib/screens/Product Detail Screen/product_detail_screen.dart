import 'package:flutter/material.dart';
import 'package:semec_task/data/product_list.dart';
import 'package:semec_task/methods/cartbag_method.dart';
import 'package:semec_task/screens/cart_bag_screen.dart';
import 'package:semec_task/screens/wishlist_screen.dart';

import '../../constant/App_Colors.dart';
import '../../models/product_model.dart';
import '../Home Page View/home_page_view.dart';
class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key,required this.product});
  final ProductModel product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _showFullText = false;
  /*_toggleReadMore start here*/
  void _toggleReadMore() {
    setState(() {
      _showFullText = !_showFullText;
    });
  }
  /*_toggleReadMore end here*/
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
CartBagMethod().addToCart(context,widget.product);

        },
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right:15,bottom: 15,top: 15),
          child: Text('Add TO Cart',style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),),
        ),
      ),
      /*bottomNavigation Bar end here*/
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children:[
          /*first portion start here*/
          Container(
            alignment: Alignment.topRight,
            height: 290,
            width:double.infinity,
padding: const EdgeInsets.all(8),
decoration: BoxDecoration(
  color: Color(0xFFF5F6FA),
  image: DecorationImage(
        image:AssetImage(
widget.product.image,
        ),
  ),
),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.white,
                  child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
              Row(
                children: [
                  CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.white,
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10) ,
                      child: IconButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartBagScreen(),
                          ),
                        );

                        setState(() {
                        });

                      }, icon:const Icon(Icons.shopping_bag_outlined,size: 28,),),
                    ),
                    Positioned(
                      right: 6,
                      top: 15,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.amber,
                        ),
                        child: Center(child: Text(cartBag.length.toString(),style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),),
                      ),
                    ),
                  ],),
            ),
                  const SizedBox(width: 10,),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.white,
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10) ,
                        child: IconButton(onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WishListScreen(),
                            ),
                          );

                        }, icon:const Icon(Icons.favorite_border_outlined,size: 28,),),
                      ),
                      Positioned(
                        right: 6,
                        top: 15,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.amber,
                          ),
                          child: Center(child: Text(favouriteBag.length.toString(),style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),),),
                        ),
                      ),
                    ],),
                  ),
                ],
              ),

            ],),
          ),
/*first portion end here*/
        const SizedBox(height: 10,),
          /*second portion start here*/
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Men\'s Printed Pullover Hoodie',style: TextStyle(
                  color: Color(0XFF8F959E),
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),),
                Text('Price',style: TextStyle(
                  color:Color(0xFf8F959E),
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),),
              ],),
          ),
          /*second portion end here*/
          const SizedBox(height: 10,),
          /*third portion start here*/
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(widget.product.name,style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),),
                ),
                Text('\$${widget.product.price.toString()}',style: TextStyle(
                  color:AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),),
              ],),
          ),
          /*third portion end here*/
          const SizedBox(height: 10,),
          /*four portion start here*/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Evenly space the images
            crossAxisAlignment: CrossAxisAlignment.center,    // Align the images vertically
            children: List.generate(4, (index) {
              return Image.asset(
                widget.product.image,
                height: 77,
                width: 77,
              );
            }),
          ),

          /*four portion end here*/
          const SizedBox(height: 10,),
          /*five portion start here*/
          Text('Description',style: TextStyle(
            color:AppColors.black,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),),
          /*five portion end here*/
              /*six portion start here*/
              Text(widget.product.description,style: TextStyle(
                color:Color(0xFF8F959E),
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
                maxLines: _showFullText ? null : 2, // Unlimited lines when true
                overflow: _showFullText ? null : TextOverflow.ellipsis, // Ellipsis when false
              ),
              TextButton(
                onPressed: _toggleReadMore,
                child: Text(_showFullText ? "Read Less" : "Read More",style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),),
              ),
              /*six portion end here*/
              const SizedBox(height: 10,),
              /*seven portion start here*/
              Text('Total Price',style: TextStyle(
                color:AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),),
              /*seven portion end here*/
              const SizedBox(height: 10,),
              /*last portion start here*/
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('with VAT,SD',style: TextStyle(
                    color:Color(0xFF8F959E),
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                  ),),
                  Text('\$${widget.product.price.toString()}',style: TextStyle(
                    color:AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),),
                ],
              ),
              /*last portion end here*/

        ]),
      ),
    );
  }
}
