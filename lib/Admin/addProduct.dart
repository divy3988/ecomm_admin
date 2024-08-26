import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker_web/image_picker_web.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  final namecontroller = TextEditingController();
  final _imagePicker = ImagePickerWeb;
  File? picked_image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Product',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Product Image ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(child: Imagepick()),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Product Name ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldB(
                namecontroller,
                "Enter Procduct Name",
                Icons.production_quantity_limits,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget TextFieldB(
      TextEditingController controller, String hint, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(
            16,
          ),
          prefixIcon: Icon(
            icon,
          ),
          hintText: hint,
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          enabled: true,
        ),
      ),
    );
  }

  Widget Imagepick() {
    return picked_image == null
        ? Container(
            height: 270,
            width: 220,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  size: 40,
                ),
                onPressed: () async {
                  try {
                    final pickedImage = await ImagePickerWeb.getImageAsFile();
                    final path = 'files/${pickedImage!.name}';
                    final imageref = FirebaseStorage.instance.ref().child(path);
                    await imageref.putFile(File(pickedImage.relativePath!));
                    picked_image = pickedImage as File;
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("success")));
                    //setState(() {});
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                    print(e);
                  }
                },
              ),
            ),
          )
        : Image.file(
            picked_image!,
            width: 220,
            fit: BoxFit.cover,
          );
  }
}
