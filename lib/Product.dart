import 'package:flutter/material.dart';

class Product {
  // category Id kategori bazlı seçim için konulacak

  final String image, title, description, categoryName;
  final int price, size, id;
  final bool isCart;
  final Color color;
  Product({
    this.isCart = false,
    this.categoryName,
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "Tişört",
    price: 234,
    size: 12,
    categoryName: "Dresses",
    description: dummyText,
    image: "assets/e1.jpg",
  ),
  Product(
    id: 2,
    title: "Pantolon",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/k2.jpg",
  ),
  Product(
    id: 3,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/e3.jpg",
  ),
  Product(
    id: 4,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/k1.jpg",
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
