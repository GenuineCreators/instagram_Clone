// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, unused_local_variable

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({super.key});

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  Uint8List? _image;
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Image'),
      ),
      body: Center(
        child: Stack(
          children: [
            _image != null
                ? CircleAvatar(
                    radius: 100,
                    backgroundImage: MemoryImage(_image!),
                  )
                : CircleAvatar(
                    radius: 100,
                  ),
            Positioned(
              bottom: -0,
              left: 140,
              child: IconButton(
                onPressed: () {
                  showImagePickerOption(context);
                },
                icon: Icon(Icons.add_a_photo),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: Row(children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromGallery();
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 70,
                          ),
                          Text("Gallery"),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromCamera();
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 70,
                          ),
                          Text("Camera"),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          );
        });
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
  }

  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
  }
}
