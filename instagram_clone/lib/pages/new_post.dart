// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, unused_element, unused_import, annotate_overrides

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/pages/home_page.dart';
import 'package:instagram_clone/services/pick_image.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();

  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text("New Post"),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: _file == null
                  ? Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1511367461989-f85a21fda167?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D'),
                      )),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: MemoryImage(_file!),
                      )),
                    ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              controller: _descriptionController,
              autocorrect: true,
              decoration: InputDecoration(
                hintText: "write a caption...",
                border: InputBorder.none,
              ),
              maxLines: 4,
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50.0,
              child: _file != null
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      onPressed: () {
                        // Add your button onPressed logic here
                      },
                      child: Text(
                        'Share',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ), // Button text
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Background color
                        onPrimary: Colors.white, // Text color
                      ),
                      onPressed: () => _selectImage(context),
                      child: Text(
                        'UPLOAD',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ), // Button text
                    )),
        ],
      ),
    );
  }

  _selectImage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Select Image"),
            children: [
              //  Option to take picture from camera
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                },
                child: Row(
                  children: [
                    Icon(Icons.camera_alt),
                    SizedBox(width: 10),
                    Text("Camera"),
                  ],
                ),
              ),

              // Option to take picture from gallery
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                onPressed: () async {
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
                child: Row(
                  children: [
                    Icon(Icons.photo),
                    SizedBox(width: 10),
                    Text("Gallery"),
                  ],
                ),
              ),

              //Option to cancel
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                onPressed: () {
                  HomePage();
                },
                child: Row(
                  children: [
                    Icon(Icons.cancel),
                    SizedBox(width: 10),
                    Text("Cancel"),
                  ],
                ),
              ),
            ],
          );
        });
  }

  // Future _pickImageFromGallery() async {
  //   final returnImage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (returnImage == null) return;
  //   setState(() {
  //     selectedImage = File(returnImage.path);
  //     _file = File(returnImage.path).readAsBytesSync();
  //   });
  // }

  // Future _pickImageFromCamera() async {
  //   final returnImage =
  //       await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (returnImage == null) return;
  //   setState(() {
  //     selectedImage = File(returnImage.path);
  //     _file = File(returnImage.path).readAsBytesSync();
  //   });
  // }
}
