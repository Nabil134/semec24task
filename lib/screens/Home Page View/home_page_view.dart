import 'package:flutter/material.dart';
import 'package:semec_task/constant/App_Colors.dart';
import 'package:semec_task/data/product_list.dart';
import 'package:semec_task/methods/custom_snackbar.dart';
import 'package:semec_task/screens/cart_bag_screen.dart';
import 'package:semec_task/screens/wishlist_screen.dart';

import '../../models/product_model.dart';
import '../Product Detail Screen/product_detail_screen.dart';
List<ProductModel> favouriteBag = [];
class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  String searchText='';
  int categoryIndex=0;
  late List<ProductModel> filterProduct;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filterProduct=categorizeList();
  }
  /*toggleFavourite start here*/
  void toggleFavourite(ProductModel product) {
    setState(() {
      if (favouriteBag.contains(product)) {
        favouriteBag.remove(product);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You have already added this item before'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        favouriteBag.add(product);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully added to your Wishlist'),
            backgroundColor: Colors.teal,
          ),
        );
      }
    });
  }
/*toggleFavourite end here*/


  /*_filteredProducts method start here*/
  void _filterProducts(String value) {
    setState(() {
      searchText = value.toLowerCase();
      filterProduct = categorizeList()
          .where((product) => product.name.toLowerCase().contains(searchText))
          .toList();
    });
  }
  /*_filteredProducts end here*/
  /*categoriesList() start here*/
  List<ProductModel> categorizeList(){
    switch(categoryIndex){
      case 0: return AdidasList;
      case 1: return NikeList;
      case 2: return FilaList;
      case 3: return PumaList;
      default:return [];
    }

  }
/*categoriesList() end here*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 45,
            backgroundColor: Color(0xFFF5F6FA),
            child: Icon(Icons.menu),
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 45,
            backgroundColor: Color(0xFFF5F6FA),
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
          CircleAvatar(
            radius: 45,
            backgroundColor: Color(0xFFF5F6FA),
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 10) ,
                child: IconButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WishListScreen(),),
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
   body:Padding(
     padding: const EdgeInsets.all(8.0),
     child: SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
         /*first portion start here*/
         Text('Hello',style: TextStyle(
           color: AppColors.black,
           fontWeight: FontWeight.w600,
           fontSize: 28,
         ),),
         /*first portion end here*/
         /*second portion start here*/
         Text('Welcome to Laza.',style: TextStyle(
           color: Color(0xFf8F959E),
           fontWeight: FontWeight.w400,
           fontSize: 15,
         ),),
         /*second portion end here*/
           /*third portion start here*/
           Container(
             height: 50,
             width: 334,
             padding: const EdgeInsets.only(top: 10,left: 10),
             decoration: BoxDecoration(
               color: AppColors.kPrimaryColor,
               borderRadius: BorderRadius.circular(10),
               border: Border.all(
                 color: AppColors.white,
                 width: 1,
               ),
             ),
             child: Row(children: [
               Icon(Icons.search,size: 24,color: AppColors.white,),
               const SizedBox(width: 10,),

               Expanded(child: TextField(
                 onChanged: _filterProducts,
                 decoration: InputDecoration(
                   hintText: "Search ...",
                   border: InputBorder.none,
                   hintStyle: TextStyle(
                     color: Color(0xFFFFFFFF),
                   ),
                   contentPadding: const EdgeInsets.all(12),
                 ),
               ),),
             ],),
           ),
           /*third portion end here*/
           const SizedBox(height: 8,),
           /*four portion start here*/
           Text('Choose Brand',style: TextStyle(
             color: AppColors.black,
             fontWeight: FontWeight.w500,
             fontSize: 17,
           ),),
           /*four portion end here*/
           /*five portion start here*/

           SizedBox(
             height: 70,
             child: ListView.separated(
               scrollDirection: Axis.horizontal,
                 itemBuilder: (context,index){
               return   InkWell(
                 onTap: (){
                   setState(() {
categoryIndex=index;
filterProduct=categorizeList();
                   });
                 },
                 child: Container(
                   height: 50,
                   width: 115,
                   decoration: BoxDecoration(
                     color:categoryIndex==index?AppColors.kPrimaryColor: Color(0xffF5F6FA),
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Container(
                         height: 40,
                         width: 40,
                         decoration:BoxDecoration(
                           color: AppColors.white,
                           borderRadius: BorderRadius.circular(10),
                         ),
                         child: Image.asset(categorys[index].image),
                       ),
                       Text(categorys[index].text,style: TextStyle(
                         color: AppColors.black,
                         fontWeight: FontWeight.w500,
                         fontSize: 15,
                       ),),
                     ],),
                 ),
               );
             }, separatorBuilder: (context,index){
               return SizedBox(width: 10,);
             }, itemCount: categorys.length),
           ),
       /*five portion end here*/
           const SizedBox(height: 10,),
           /*six portion start here*/
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
             Text('New Arraival',style: TextStyle(
               color: AppColors.black,
               fontWeight: FontWeight.w500,
               fontSize: 17,
             ),),
             Text('View All',style: TextStyle(
               color:Color(0xFf8F959E),
               fontWeight: FontWeight.w400,
               fontSize: 13,
             ),),
           ],),
           /*six portion end here*/
           const SizedBox(height: 20,),
           /*last portion start here*/

           SingleChildScrollView(
             child: Expanded(
               child: GridView.builder(
                 itemCount:filterProduct.length,
                   shrinkWrap: true,
                   physics:  NeverScrollableScrollPhysics(),
                   gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                     mainAxisSpacing: 20,
                     crossAxisSpacing: 20,
                     mainAxisExtent: MediaQuery.of(context).size.height * 0.3,
                   ), itemBuilder:(context,index){
                 var product = filterProduct[index];
                 bool isFavorite = favouriteBag.contains(product);
                 return InkWell(
                   key: ValueKey(product.name),
                   onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => ProductDetailScreen(
                        product: product,
                       ),),
                     );
                   },
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Container(height: MediaQuery.of(context).size.height * 0.2, // Adjust height
                         width: MediaQuery.of(context).size.width * 0.5, // Adjust width
                         decoration: BoxDecoration(
                           color:Color(0xffF5F6FA),
                           borderRadius: BorderRadius.circular(15),
                         ),
                         child: Stack(children: [
                           Positioned.fill(
                             child: Image.asset(
                               product.image,
                               fit: BoxFit.contain,
                             ),
                           ),
                           Positioned(
                             top: 10,
                             right: 10,
                             child: IconButton(
                               onPressed: () {
                                 toggleFavourite(product);
                                 print(favouriteBag[index].name);
                               },
                               icon: Icon(
                                 isFavorite ? Icons.favorite : Icons.favorite_border,
                                 color: isFavorite ? Colors.red : Colors.grey,
                               ),
                             ),
                           ),

                         ],),
                       ),
                       SizedBox(height: 5),
                       Text(product.name,style: TextStyle(
                         color:AppColors.black,
                         fontWeight: FontWeight.bold,
                         fontSize: 11,
                       ),),
                       Text('\$${product.price.toString()}',style: TextStyle(
                         color:AppColors.black,
                         fontWeight: FontWeight.w600,
                         fontSize: 13,
                       ),),
                     ],
                   ),
                 );
               }),
             ),
           ),
           /*last portion end here*/
         ],),
     ),
   ),
    );
  }
}
