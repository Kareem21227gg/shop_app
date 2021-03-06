import 'dart:io';

import 'package:Shop/app/models/authentication/firebase_authentication.dart';
import 'package:Shop/app/view/add_product/controller.dart';
import 'package:Shop/utillities/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState   extends State<AddProduct> with SingleTickerProviderStateMixin<AddProduct> {
  AddProductController controller = AddProductController();
AnimationController _animationController;
void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration:Duration(milliseconds: 500 ),
    );
    _animationController.repeat();
    
  }
  @override
  void dispose() {
    _animationController.dispose();
    controller.dispose();
    super.dispose();
  }

  Future<File> image;
  @override
  Widget build(BuildContext context) {
    FirebaseAuthentication firebaseAuthentication =
        Provider.of<FirebaseAuthentication>(context);

    return Scaffold(
      appBar: AppBar(title: Text("add product")),
      body: Center(
        child: ListView(
          children: [
            controller.imageprogress.value
                ? LinearProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        image = controller.imagePick();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: FutureBuilder(
                          future: image,
                          builder: (context, AsyncSnapshot snap) {
                            if (snap.hasData) {
                              return Image.file(snap.data);
                            } else {
                              return Icon(Icons.camera_alt_outlined);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: controller.titleController,
                cursorColor: MyColors.primaryColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "title",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.describtionController,
                maxLines: 10,
                cursorColor: MyColors.primaryColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "describtion",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: controller.priceController,
                cursorColor: MyColors.primaryColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "price",
                ),
              ),
            ),
            controller.isProgress.value
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor:_animationController.drive<Color>(ColorTween(begin:MyColors.hashText ,end: MyColors.primaryColor)) ,
                      value: controller.progress.value,
                    ),
                  )
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      child: Text(
                        "add product!",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        
                        controller.addProduct(context);
                        
                      },
                    ),
                ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text(
                  "log out",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  await firebaseAuthentication.logOut();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
