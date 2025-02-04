import 'package:blocsample/blocs/cart_bloc.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepet"),
      ),
      body: StreamBuilder(
          stream: cartBloc.getStream,
          initialData: cartBloc.getCart(),
          builder: (context, snapshot) {
            return snapshot.data != null ? buildCart(snapshot) : buildCenter();
          }
          /*
          Diger stil
          {
                        if (snapshot.data != null) {
                          return buildCart(snapshot);
                        } else {
                          return Center(
                            child: Text("Sepet Boş"),
                          );
                        }*/
          ),
    );
  }

  Widget buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, index) {
        final cart = snapshot.data;
        return ListTile(
            title: Text(cart[index].product.name),
            subtitle: Text(cart[index].product.price.toString()),
            trailing: IconButton(
                icon: Icon(Icons.remove_shopping_cart),
                onPressed: () => cartBloc.removeFromCart(cart[index])));
      },
    );
  }

buildCenter() {
    Center(
      child: Text("Sepet Boş"),
    );
  }
}
