import 'package:flutter/material.dart';
import 'package:module_13_assignment/pages/product_list_screen.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _productNameTEController =
      TextEditingController();
  final TextEditingController _productColorTEController =
      TextEditingController();
  final TextEditingController _productSizeTEController =
      TextEditingController();
  final TextEditingController _productPriceTEController =
      TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<Products> ProductList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        centerTitle: true,
        backgroundColor: Colors.green,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: Validation,
                controller: _productNameTEController,
                decoration: InputDecoration(
                  label: Text(
                    "Name",
                    style: TextStyle(color: Colors.black),
                  ),
                  hintText: "Enter Your Product Name",
                  hintStyle: TextStyle(fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.green)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: Validation,
                controller: _productColorTEController,
                decoration: InputDecoration(
                  label: Text(
                    "Color",
                    style: TextStyle(color: Colors.black),
                  ),
                  hintText: "Enter Your Product Color",
                  hintStyle: TextStyle(fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.green)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: Validation,
                controller: _productSizeTEController,
                decoration: InputDecoration(
                  label: Text(
                    "Size",
                    style: TextStyle(color: Colors.black),
                  ),
                  hintText: "Enter Your Product Size",
                  hintStyle: TextStyle(fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.green)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: Validation,
                controller: _productPriceTEController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    "Price",
                    style: TextStyle(color: Colors.black),
                  ),
                  hintText: "Enter Your Product Price",
                  hintStyle: TextStyle(fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.green)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: () {
                      _OnTabAddProduct();
                    },
                    child: Text("Add Product")),
              )
            ],
          ),
        ),
      ),
          floatingActionButton: FloatingActionButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductListScreen(productList: ProductList,)));} , child: Icon(Icons.show_chart),),
    ));
  }

  void _OnTabAddProduct() {
    if (_formKey.currentState!.validate()) {
      final String name = _productNameTEController.text;
      final String color = _productColorTEController.text;
      final String size = _productSizeTEController.text;
      final double price = double.tryParse(_productPriceTEController.text) ?? 0;
      Products products = Products(
          name: name, color: color, size: size, price: price, listOfProduct: 1);
      ProductList.add(products);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Product add Successfully")));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductListScreen(productList: ProductList),
        ),
      );
      _productNameTEController.clear();
      _productColorTEController.clear();
      _productSizeTEController.clear();
      _productPriceTEController.clear();
    }
  }

  String? Validation(value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty'; // Return an error message if the field is empty.
    }
    return null; // Return null if the input is valid.
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _productNameTEController.dispose();
    _productColorTEController.dispose();
    _productSizeTEController.dispose();
    _productPriceTEController.dispose();
  }
}

class Products {
  String name;
  String color;
  String size;
  double price;
  int listOfProduct;
  int quantity;

  Products(
      {required this.name,
      required this.color,
      required this.size,
      required this.price,
      required this.listOfProduct,
      this.quantity = 1});
}


