import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_blog/service/api_service.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  final _service = ApiService();
  final _formKey = GlobalKey<FormState>();
  final ImagePicker imagePicker = ImagePicker();
  XFile? selectedImage;
  String title = "";
  String content = "";
  String author = "";

  pickImage() async {
    XFile? selectedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = selectedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yeni Post Ekle'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                if (selectedImage != null)
                  Image.file(File(selectedImage!.path)),
                ElevatedButton(
                    onPressed: () => pickImage(),
                    child: const Text("Fotoğraf seç")),
                TextFormField(
                  decoration:
                      const InputDecoration(label: Text("Blog başlığı")),
                  onSaved: (newValue) {
                    title = newValue!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Lütfen bir blog başlığı giriniz";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(label: Text("Blog içeriği")),
                  onSaved: (newValue) {
                    content = newValue!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Lütfen bir blog içeriğ giriniz";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text("Ad Soyad")),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Lütfen ad soyad giriniz";
                    }
                    return null;
                  },
                  onSaved: (newValue) => author = newValue!,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _service.submitPost(
                            title, content, author, selectedImage);
                      }
                    },
                    child: const Text("Post Ekle"))
              ],
            )),
      ),
    );
  }
}
