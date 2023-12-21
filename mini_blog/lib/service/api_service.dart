import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mini_blog/models/blog.dart';

class ApiService {
  static const String url = "https://tobetoapi.halitkalayci.com/api/Articles/";
  final Uri uri = Uri.parse(url);
  List<Blog> blogList = [];

  Future<List<Blog>> fetchPosts() async {
    final response = await http.get(uri);
    final List jsonData = json.decode(response.body);
    blogList = jsonData.map((json) => Blog.fromJson(json)).toList();
    return blogList;
  }

  Future<bool> submitPost(
      String title, String content, String author, selectedImage) async {
    var request = http.MultipartRequest("POST", uri);
    request.fields['Title'] = title;
    request.fields['Content'] = content;
    request.fields['Author'] = author;
    if (selectedImage != null) {
      final file =
          await http.MultipartFile.fromPath('File', selectedImage!.path);
      request.files.add(file);
    }
    final response = await request.send();
    if (response.statusCode == HttpStatus.created) {
      return true;
    } else {
      return false;
    }
  }

  Future<Blog> fetchPostDetails(String id) async {
    final response = await http.get(Uri.parse('$url$id'));
    if (response.statusCode == HttpStatus.ok) {
      final result = json.decode(response.body);
      Blog post = Blog.fromJson(result);
      return post;
    } else {
      throw Exception('Hata ${response.statusCode}');
    }
  }
}
