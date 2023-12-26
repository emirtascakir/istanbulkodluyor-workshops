import 'dart:convert';
import 'dart:io';

import 'package:mini_blog/models/blog.dart';
import 'package:http/http.dart' as http;

const url = "https://tobetoapi.halitkalayci.com/api/Articles/";

class ArticleRepository {
  Future<List<Blog>> fetchBlogs() async {
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    final List jsonData = json.decode(response.body);
    return jsonData.map((json) => Blog.fromJson(json)).toList();
  }

  Future<bool> submitPost(
      String title, String content, String author, selectedImage) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields['Title'] = title;
    request.fields['Content'] = content;
    request.fields['Author'] = author;
    if (selectedImage != null) {
      final file =
          await http.MultipartFile.fromPath('File', selectedImage!.path);
      request.files.add(file);
    }
    final response = await request.send();
    if (response.statusCode == HttpStatus.ok) {
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

  Future<bool> deletePost(String id) async {
    final request = http.MultipartRequest("DELETE", Uri.parse('$url$id'));
    final response = await request.send();
    if (response.statusCode == HttpStatus.ok) {
      return true;
    } else {
      return false;
    }
  }
}
