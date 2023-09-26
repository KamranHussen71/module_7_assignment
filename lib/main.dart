import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List App',
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: "Product 1",price: 10.0),
    Product(name: "Product 2",price: 15.0),
    Product(name: "Product 3",price: 20.0),
    Product(name: "Product 4",price: 10.0),
    Product(name: "Product 5",price: 15.0),
    Product(name: "Product 6",price: 20.0),
    Product(name:"Product 7", price: 10.0),
    Product(name: "Product 8",price: 15.0),
    Product(name: "Product 9",price: 20.0),
    Product(name: "Product 10", price: 10.0),
    Product(name: "Product 11", price:15.0),
    Product(name: "Product 12", price: 20.0),
  ];

  int cartItemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(cartItemCount: cartItemCount),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: ListTile(
              title: Text(
                products[index].name,
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                "\$${products[index].price.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 10),
              ),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Count: ${products[index].counter}',
                    style: TextStyle(fontSize: 10),
                  ),
                  Container(
                    height: 35,
                    width: 60,
                    child: TextButton(
                      onPressed: () {
                        setState(
                              () {
                            products[index].incrementCounter();
                            if (products[index].counter == 5) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Congratulations!"),
                                    content: Text(
                                      "You've bought 5 ${products[index].name}!",
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                            cartItemCount++;
                          },
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        "Buy Now",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  int counter = 0;

  Product({required this.name, required this.price});

  void incrementCounter() {
    counter++;
  }
}

class CartPage extends StatelessWidget {
  final int cartItemCount;

  CartPage({required this.cartItemCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Total Items in Cart: $cartItemCount"),
      ),
    );
  }
}