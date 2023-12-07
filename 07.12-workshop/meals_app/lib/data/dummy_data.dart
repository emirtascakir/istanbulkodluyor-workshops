import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/models/meal_model.dart';

final categoryList = [
  CategoryModel(id: "1", name: "Başlangıçlar", color: Colors.purple),
  CategoryModel(id: "2", name: "Ara Sıcaklar", color: Colors.red),
  CategoryModel(id: "3", name: "Ana Yemekler", color: Colors.blueGrey),
  CategoryModel(id: "4", name: "Tatlılar", color: Colors.limeAccent),
];

final mealList = [
  MealModel(
    id: "1",
    categoryId: "1",
    name: "Mercimek Çorbası",
    imageUrl:
        "https://cdn.yemek.com/mnresize/940/940/uploads/2014/06/mercimek-corbasi-yemekcom.jpg",
    ingredients: ["Malzeme 1", "Malzeme2 ", "Malzeme 3"],
  ),
  MealModel(
    id: "2",
    categoryId: "4",
    name: "Katmer",
    imageUrl:
        "https://gulumoglubaklava.com.tr/wp-content/uploads/292c2709-1626-4278-8589-fd456ae44468.jpg",
    ingredients: ["Malzeme 1", "Malzeme 2", "Malzeme 3"],
  ),
];
