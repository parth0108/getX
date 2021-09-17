import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_listview_wishlist/controller/product_controller.dart';
import 'package:get_x_listview_wishlist/ui%20/home_Screen.dart';

class WishListScreen extends StatelessWidget {
  // Ask Get to find our "controller"
  final HomeScreen controller = Get.put(HomeScreen());

  final Products _p = Get.find<Products>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WishList'),
        ),
        body: Obx(
              () => ListView.builder(
            itemCount: _p.wishListItems.length,
            itemBuilder: (context, index) {
              final item = _p.wishListItems[index];
              return Card(
                key: ValueKey(item.id),
                margin: EdgeInsets.all(5),
                color: Colors.blue[200],
                child: ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  // This button use to remove )the item from wish list
                  trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      item.inWishList.value = false;
                      _p.removeItem(item.id);
                    },
                  ),
                ),
              );
            },
          ),
        ));
  }
}