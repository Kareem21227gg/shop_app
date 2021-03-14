
import 'dart:io';
import 'package:Shop/app/models/product/base_product.dart';
import 'package:Shop/app/models/cloud/firebase_cloud.dart';
import 'package:Shop/app/models/storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductController {
  FireBaseCloud fireBaseCloud = FireBaseCloud();
  TextEditingController titleController = TextEditingController();
  TextEditingController describtionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  FireBaseCloud cloud = FireBaseCloud();
  ImagePicker picker = ImagePicker();
  File image ;
  FireBaseStorage storage = FireBaseStorage();
  ValueNotifier<bool> isProgress =ValueNotifier<bool>(false);
  ValueNotifier<double> progress=ValueNotifier<double>(0);
  ValueNotifier<bool> imageprogress  =ValueNotifier<bool>(false);


  Future<File> imagePick() async {
    imageprogress.value=true;
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
  image= File(pickedImage.path);
  imageprogress.value=false;
  return image;
  }


  void dispose() {
    imageprogress.dispose();
    progress.dispose();
    isProgress.dispose();
    progress.dispose();
    titleController.dispose();
    describtionController.dispose();
    priceController.dispose();
  }

  void addProduct(BuildContext context) async {
    isProgress.value=true;
    try {
      BaseProduct product = BaseProduct(
          title: titleController.text,
          description: describtionController.text,
          price: double.parse(priceController.text));
          progress.value = 0.2;
         String id =  await cloud.addProduct(product);
         progress.value = 0.7;
      String downloadUrl = await storage.upLoadFile(image,id );
      progress.value = 0.9;
        await cloud.updateProduct(downloadUrl, id);
        progress.value = 1;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("added successfully")));
    } on Exception catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("something won't work try again later the error is : $e")));
    }
  isProgress.value=false;
  }
}
