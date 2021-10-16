import 'package:flutter/material.dart';

class RecommendedModel {
  String name;
  String image;

  RecommendedModel(this.name, this.image);
}

List<RecommendedModel> recommedations = recommendationData
    .map((item) => RecommendedModel(item['name'] ?? "", item['image'] ?? ""))
    .toList();

var recommendationData = [
  {
    "name": "Lorem Ipsum... but for photos. ... Just add your ",
    "image": "https://picsum.photos/500/300?random=1"
  },
  {
    "name": "Lorem Ipsum... but for photos. ... Just add your desired image size (width & ",
    "image": "https://picsum.photos/500/300?random=2"
  },
  {
    "name": "Lorem Ipsum... but for photos. ... Just add ",
    "image": "https://picsum.photos/500/300?random=3"
  },
  {"name": "title 4", "image": "https://picsum.photos/500/300?random=4"},
  {"name": "title 4", "image": "https://picsum.photos/500/300?random=5"},
  {"name": "title 4", "image": "https://picsum.photos/500/300?random=6"},
];

List<RecommendedModel> recommendationsList = [
  RecommendedModel("name", "https://picsum.photos/500/300?random=1"),
  RecommendedModel("name", "https://picsum.photos/500/300?random=2"),
  RecommendedModel("name", "https://picsum.photos/500/300?random=3"),
  RecommendedModel("name", "https://picsum.photos/500/300?random=4"),
  RecommendedModel("name", "https://picsum.photos/500/300?random=5"),
  RecommendedModel("name", "https://picsum.photos/500/300?random=6"),
  RecommendedModel("name", "https://picsum.photos/500/300?random=7"),
  RecommendedModel("name", "https://picsum.photos/500/300?random=8")
];


class Popular {
  int color;
  String title;
  String image;
  int backgoundColor;

  Popular({required this.color, required this.title, required this.image,required this.backgoundColor});
}

List<Popular> populars = [
  Popular(color: 0XFF8c8c8c,title: "Lake",image: "assets/images/lake.png",backgoundColor:0X408c8c8c),
  Popular(color: 0XFFFF5733,title: "Beach",image: "assets/images/lake.png",backgoundColor:0X40FF5733),
  Popular(color: 0XFFFFCE33,title: "Lake",image: "assets/images/lake.png",backgoundColor:0X40FFCE33),
  Popular(color: 0XFF90FF33,title: "Lake",image: "assets/images/lake.png",backgoundColor:0X4090FF33),
  Popular(color: 0XFF33FFC1,title: "Lake",image: "assets/images/lake.png",backgoundColor:0X4033FFC1),
  Popular(color: 0XFF33A8FF,title: "Lake",image: "assets/images/lake.png",backgoundColor:0X4033A8FF),
  Popular(color: 0XFF9933FF,title: "Lake",image: "assets/images/lake.png",backgoundColor:0X409933FF),

];

class Beach {
  String title;
  String image;

  Beach(this.title, this.image);
}

List<Beach> beaches = [
  Beach("title", "https://picsum.photos/500/300?random=1"),
  Beach("title", "https://picsum.photos/500/300?random=2"),
  Beach("title", "https://picsum.photos/500/300?random=3"),
  Beach("title", "https://picsum.photos/500/300?random=4"),
  Beach("title", "https://picsum.photos/500/300?random=5"),
  Beach("title", "https://picsum.photos/500/300?random=6"),
  Beach("title", "https://picsum.photos/500/300?random=7"),


];