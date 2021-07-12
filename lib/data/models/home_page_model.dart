import 'package:flutter/material.dart';

class HomePageModel {
  String profilePhotoUrl;
  String profileName;
  String profileTitle;
  String photoUrl;
  int likes;
  int comments;
  String commentContent;
  int timePosted;

  HomePageModel(
      {@required this.photoUrl,
      @required this.profilePhotoUrl,
      @required this.profileName,
      @required this.profileTitle,
      @required this.likes,
      @required this.comments,
      @required this.commentContent,
      @required this.timePosted});
}

final List<HomePageModel> cards = <HomePageModel>[
  HomePageModel(
    profileName: 'Nancy Muthoni',
    profilePhotoUrl: 'assets/images/profile/profile-1.jpg',
    profileTitle: 'Stylist',
    photoUrl: 'assets/images/profile/profile-5.jpg',
    likes: 250,
    comments: 50,
    commentContent:
        'Nancy, The client was very happy with my services and gave me a 5 star rating. Great working with you.',
    timePosted: 5,
  ),
  HomePageModel(
    profileName: 'Sophie Karima',
    profilePhotoUrl: 'assets/images/profile/profile-2.jpg',
    profileTitle: 'Stylist',
    photoUrl: 'assets/images/profile/profile-3.jpg',
    likes: 100,
    comments: 13,
    commentContent:
        'Sophie, We agreed on time and the client was very punctual and her instructions were very clear',
    timePosted: 42,
  ),
  HomePageModel(
    profileName: 'Purity Kamau',
    profilePhotoUrl: 'assets/images/profile/profile-5.jpg',
    profileTitle: 'Stylist',
    photoUrl: 'assets/images/profile/profile-1.jpg',
    likes: 115,
    comments: 74,
    commentContent:
        'Purity, This is a new style that we\'re now offering. Beatrice was very happy with it.',
    timePosted: 47,
  ),
  HomePageModel(
    profileName: 'Felicia Njuguna',
    profilePhotoUrl: 'assets/images/profile/profile-3.jpg',
    profileTitle: 'Stylist',
    photoUrl: 'assets/images/profile/profile-4.jpg',
    likes: 204,
    comments: 107,
    commentContent:
        'Felicia, Very tough design but I managed to pull it off. Learning something new everyday',
    timePosted: 55,
  ),
];
