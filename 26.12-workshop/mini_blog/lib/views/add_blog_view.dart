import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_blog/blocs/article_bloc/article_bloc.dart';
import 'package:mini_blog/blocs/article_bloc/article_state.dart';
import 'package:mini_blog/repositories/article_repository.dart';
import 'package:mini_blog/views/home_view.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
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
        body: BlocConsumer<ArticleBloc, ArticleState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ArticleAdded) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (builder) => const HomeView()));
            } else if (state is ArticleLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ArticlesError) {
              return const Center(
                child: Text("Error"),
              );
            }
            return form(state);
          },
        ));
  }

  Padding form(ArticleState state) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
          key: _formKey,
          child: ListView(
            children: [
              if (selectedImage != null) Image.file(File(selectedImage!.path)),
              ElevatedButton(
                  onPressed: () => pickImage(),
                  child: const Text("Fotoğraf seç")),
              TextFormField(
                decoration: const InputDecoration(label: Text("Blog başlığı")),
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
                decoration: const InputDecoration(label: Text("Blog içeriği")),
                onSaved: (newValue) {
                  content = newValue!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Lütfen bir blog içeriğis giriniz";
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
                      ArticleRepository()
                          .submitPost(title, content, author, selectedImage);

                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Post Ekle"))
            ],
          )),
    );
  }
}
