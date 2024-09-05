import 'package:flutter/material.dart';

class CardDesign extends StatefulWidget {
  const CardDesign({super.key});

  @override
  State<CardDesign> createState() => _CardDesignState();
}

class _CardDesignState extends State<CardDesign> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
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
                        offset: Offset(0.1, 2))
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
                              "T-Shirt",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Color :",
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Black",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Size :",
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  "L",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.add)),
                                Text("0"),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.remove)),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.more)),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text("Tk 50"),
                            ),
                          ],
                        ),
                      )
                    ],

                  ),
                ),

              ],
            );
          }),
    ));
  }
}
