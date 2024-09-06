import 'package:flutter/material.dart';
import 'package:module_13_assignment/pages/add_product.dart';

class ProductListScreen extends StatefulWidget {
  final List<Products> productList;
  const ProductListScreen({super.key, required this.productList});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  double _totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    _calculateTotalPrice();
  }

  void _calculateTotalPrice() {
    _totalPrice = widget.productList.fold(0.0, (sum, product) {
      return sum + (product.price * product.quantity);
    });
  }

  void _increaseProductItem(int index) {
    setState(() {
      widget.productList[index].quantity++;
      _calculateTotalPrice(); // Recalculate total price
    });
  }

  void _decreaseProductItem(int index) {
    setState(() {
      if (widget.productList[index].quantity > 1) { // Ensure quantity does not go below 1
        widget.productList[index].quantity--;
        _calculateTotalPrice(); // Recalculate total price
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Products (${widget.productList.length})", // Showing the number of products
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.productList.length,
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
    Products product = widget.productList[index];
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
                      product.name,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
                          product.color,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Size: ",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        Text(
                          product.size,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _increaseProductItem(index);
                          },
                          icon: Icon(Icons.add),
                        ),
                        Text(product.quantity.toString()),
                        IconButton(
                          onPressed: () {
                            _decreaseProductItem(index);
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
                      child: Text("Tk ${product.price.toStringAsFixed(2)}"),
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
              Text("${_totalPrice.toStringAsFixed(2)} TK"), // Updated to show the total price dynamically
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("CHECK OUT"),
            ),
          ),
        ),
      ],
    );
  }
}
