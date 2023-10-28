import 'package:flutter/material.dart';

import 'data_fetch.dart';
import 'model/Product.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductsPage(),
    );
  }
}

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late Future<List<Product>> futureProducts;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts(); // Initial fetch
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              setState(() {
                futureProducts = searchProducts(
                    _searchController.text); // Fetch with search query
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search products...',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                setState(() {
                  futureProducts = searchProducts(
                      value); // Fetch when user submits the search
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Product>>(
              future: futureProducts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Product product = snapshot.data![index];
                      return Dismissible(
                        key: Key(product.id
                            .toString()), // Unique key for Dismissible
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          // Remove the item from the data source.
                          setState(() {
                            snapshot.data!.removeAt(index);
                          });

                          // Optionally, inform the user with a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Deleted ${product.title}')),
                          );
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        child: ListTile(
                          leading: Image.network(product.thumbnail),
                          title: Text(product.title),
                          subtitle: Text(product.description),
                          trailing:
                              Text('\$${product.price.toStringAsFixed(2)}'),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
