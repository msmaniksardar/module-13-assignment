import 'package:flutter/material.dart';

class ShowProduct extends StatefulWidget {
  const ShowProduct({super.key});

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  List<dynamic> listOfProduct = [
    {"name": "Bag", "color": "red", "size": "L", "price": 200, "quantity": 1},
    {"name": "Bag", "color": "red", "size": "L", "price": 200, "quantity": 1},
    {"name": "Bag", "color": "red", "size": "L", "price": 200, "quantity": 1},
    {"name": "Bag", "color": "red", "size": "L", "price": 200, "quantity": 1},
  ];

  double _totalPrice = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calculateTotalPrice();
  }

  void _calculateTotalPrice() {
    _totalPrice = listOfProduct.fold(
        0.0, (sum, product) => sum + (product["price"] * product["quantity"]));
  }

  void _onTabIncreaseProduct(index){
      setState(() {
        listOfProduct[index]["quantity"]++;
        _calculateTotalPrice();
      });
  }

  void _onTabDecreaseProduct(index){
    setState(() {
     if(listOfProduct.length > 1){
       listOfProduct[index]["quantity"]--;
       _calculateTotalPrice();
     }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Products",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: listOfProduct.length,
                itemBuilder: (context, index) {
                  return _buildProductList(context, index);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.white12),
              child: _checkOutBuilder(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProductList(BuildContext context, int index) {
    final product = listOfProduct[index];
    print(product);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5, top: 5),
          height: 120,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(0.1, 2),
            )
          ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/shirtImage.webp",
                width: 100,
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product["name"],
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Color: ",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        SizedBox(width: 10),
                        Text(
                          product["color"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Size: ",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        Text(
                          product["size"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () { _onTabIncreaseProduct(index);},
                          icon: Icon(Icons.add),
                        ),
                        Text(product["quantity"].toString()),
                        IconButton(
                          onPressed: () {
                            _onTabDecreaseProduct(index);
                          },
                          icon: Icon(Icons.remove),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.more)),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(product["price"].toString()),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _checkOutBuilder() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total amount:"),
              Text(_totalPrice.toStringAsFixed(2).toString()), // Updated to show the total price dynamically
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Congratulation")));
              },
              child: Text("CHECK OUT"),
            ),
          ),
        ),
      ],
    );
  }
}
