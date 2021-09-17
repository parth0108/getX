import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_listview_wishlist/controller/product_controller.dart';
import 'package:get_x_listview_wishlist/ui%20/wishlist.dart';


class HomeScreen extends StatelessWidget {
  // Instantiate our Products class using Get.put()
  final Products _p = Get.put(Products());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parth Demo '),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          // This button also shows you how many items in the wish list
          // It lets you go to the WishListScreen
          InkWell(
            child: Container(
              width: 300,
              height: 80,
              color: Colors.red,
              alignment: Alignment.center,
              // Use Obx(()=> to update Text() whenever _wishList.items.length is changed
              child: Obx(() => Text(
                'Wish List: ${_p.wishListItems.length}',
                style: TextStyle(fontSize: 28, color: Colors.white),
              )),
            ),
            onTap: (){
              Get.to(WishListScreen());
            },
                // Navigator.push(context,
                // MaterialPageRoute(builder: (context) => WishListScreen())),
          ),

          SizedBox(
            height: 20,
          ),

          Expanded(
            // Display all products in home screen
              child: ListView.builder(
                  itemCount: _p.items.length,
                  // List item widget
                  itemBuilder: (context, index) {
                    final product = _p.items[index];
                    return Card(
                      key: ValueKey(product.id),
                      margin: EdgeInsets.all(5),
                      color: Colors.amberAccent,
                      child: ListTile(
                        title: Text(product.name),
                        subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
                        // Use Obx(()=> to update icon color when product.inWishList change
                        trailing: Obx(() => IconButton(
                          onPressed: () {
                            if (product.inWishList.value == false) {
                              _p.addItem(product.id);
                            } else {
                              _p.removeItem(product.id);
                            }
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: product.inWishList.value == false
                                ? Colors.white
                                : Colors.red,
                          ),
                        )),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}