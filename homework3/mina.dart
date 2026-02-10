import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const SizedBox(height: 20),

          const Center(child: MyButton()),

          const SizedBox(height: 40),

          Container(
            padding: const EdgeInsets.all(25),
            color: Colors.white,
            child: const Text(
              '',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 0.5,
                fontSize: 20,
              ),
            ),
          ),

          const SizedBox(height: 40),

          const Text(
            "Listing Products",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          ProductBox(
            name: "iPhone",
            description: "iPhone is the stylist phone ever",
            price: 1000,
            image: "iphone.png",
          ),
          ProductBox(
            name: "pixl",
            description: "Useful storage medium",
            price: 100,
            image: "pixel1.png",
          ),
          ProductBox(
            name: "Laptop",
            description: "Laptop is most productive development tool",
            price: 2000,
            image: "laptop.png",
          ),
          ProductBox(
            name: "Tablet",
            description: "Tablet is the most useful device ever for meeting",
            price: 1500,
            image: "tablet.png",
          ),
          ProductBox(
            name: "USB",
            description: "USB flash drive is useful storage medium",
            price: 50,
            image: "usb.png",
          ),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Color(0xFFFFFFFF)),
          left: BorderSide(width: 1.0, color: Color(0xFFFFFFFF)),
          right: BorderSide(width: 1.0, color: Color(0xFF000000)),
          bottom: BorderSide(width: 1.0, color: Color(0xFF000000)),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Color(0xFFDFDFDF)),
            left: BorderSide(width: 1.0, color: Color(0xFFDFDFDF)),
            right: BorderSide(width: 1.0, color: Color(0xFF7F7F7F)),
            bottom: BorderSide(width: 1.0, color: Color(0xFF7F7F7F)),
          ),
          color: Colors.grey,
        ),
        child: const Text(
          'OK',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  final String name;
  final String description;
  final int price;
  final String image;

  const ProductBox({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });




  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 130,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
            
              Image.asset(
                "images/$image",
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),

              const SizedBox(width: 15),

              // النصوص
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(description),
                    Text(
                      "Price: $price",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
