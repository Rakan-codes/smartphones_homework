import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Listing Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Map<String, List<Map<String, dynamic>>> productsByBrand = {
    'Apple': [
      {
        "name": "iPhone",
        "description": "iPhone is the stylist phone ever",
        "price": 1000,
        "image": "iphone.png"
      },
      {
        "name": "Laptop",
        "description": "Laptop is most productive development tool",
        "price": 2000,
        "image": "laptop.png"
      },
      {
        "name": "Tablet",
        "description": "Tablet is the most useful device ever for meeting",
        "price": 1500,
        "image": "tablet.png"
      },
    ],
    'Google': [
      {
        "name": "Pixel",
        "description": "Pixel is the most featureful phone ever",
        "price": 800,
        "image": "pixel1.png"
      },
    ],
    'Technology': [
      {
        "name": "USB",
        "description": "USB is useful storage medium",
        "price": 100,
        "image": "usb.png"
      },
    ],
  };

  String selectedBrand = 'Apple';
  Map<String, dynamic>? selectedProduct;

  @override
  void initState() {
    super.initState();
  
    selectedProduct = productsByBrand[selectedBrand]![0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Listing")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            Text("اختر الماركة:", style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: selectedBrand,
              isExpanded: true,
              items: productsByBrand.keys.map((brand) => DropdownMenuItem(value: brand, child: Text(brand))).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedBrand = newValue!;
                  selectedProduct = productsByBrand[selectedBrand]![0];
                });
              },
            ),

            const SizedBox(height: 15),

          
            Text("اختر الاسم:", style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<Map<String, dynamic>>(
              value: selectedProduct,
              isExpanded: true,
              items: productsByBrand[selectedBrand]!.map((product) {
                return DropdownMenuItem<Map<String, dynamic>>(
                  value: product,
                  child: Text(product['name']),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedProduct = newValue;
                });
              },
            ),

            const SizedBox(height: 25),

          
            if (selectedProduct != null)
              ProductBox(
                name: selectedProduct!['name'],
                brand: selectedBrand,
                description: selectedProduct!['description'],
                price: selectedProduct!['price'],
                image: selectedProduct!['image'],
              ),
          ],
        ),
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  final String name;
  final String brand;
  final String description;
  final int price;
  final String image;

  ProductBox({
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 150,
      child: Card(
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "images/" + image,
                width: 90,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.image, size: 60),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(this.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    Text("Brand: " + this.brand, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)), // خانة الماركة
                    Text(this.description, style: TextStyle(fontSize: 14)),
                    Text("Price: " + this.price.toString() + " SAR", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}