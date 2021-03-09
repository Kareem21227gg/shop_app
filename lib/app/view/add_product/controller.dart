
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
ValueNotifier<double> progress=ValueNotifier<double>(100);
  Future<File> imagePick() async {
    var pickedImage = await picker.getImage(source: ImageSource.camera);
  image= File(pickedImage.path);
  return image;
  }
  void dispose() {
    isProgress.dispose();
    progress.dispose();
    titleController.dispose();
    describtionController.dispose();
    priceController.dispose();
  }

  void addProduct() async {
    isProgress.value=true;
    BaseProduct product = BaseProduct(
        title: titleController.text,
        description: describtionController.text,
        price: double.parse(priceController.text));
        progress.value = 90;
   String id =  await cloud.addProduct(product);
   progress.value = 60;
    String downloadUrl = await storage.upLoadFile(image,id );
    progress.value = 30;
  await cloud.updateProduct(downloadUrl, id);
  progress.value = 0;
  isProgress.value=false;
  }
}
