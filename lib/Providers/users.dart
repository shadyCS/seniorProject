import 'package:final_t_and_t/Providers/user.dart';
import 'package:flutter/cupertino.dart';

class Users with ChangeNotifier {
  List<User> _users = [
    User(
        id: 1,
        name: 'Shady Ayman',
        imageCode:
            'https://i.pinimg.com/originals/b6/ac/a3/b6aca38da1d44b9c6e05a83394fe79f7.jpg',
        headLine: 'Flutter Devloper',
        numberOfRating: '69',
        rating: '4.7',
        price: '150\$/h',
        email: 'Shady@gmail.com',
        joinedDate: '2021/12/20',
        phoneNumber: '0565624322',
        isRated: true),
    User(
        id: 2,
        name: 'Anwar Haredy',
        imageCode:
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fyarinya.ru%2Fwp-content%2Fuploads%2F2020%2F05%2F11%2FMarilyn-Sugar-wVLH4TTn6JOaHsS.jpg&f=1&nofb=1',
        headLine: 'Porn Devloper',
        numberOfRating: '96',
        rating: '5.0',
        price: '100\$/h',
        email: 'Porner@gmail.com',
        joinedDate: '2020/9/10',
        phoneNumber: '0561234567',
        isRated: false),
    User(
        id: 3,
        name: 'Omar Zain',
        imageCode:
            'https://d16kd6gzalkogb.cloudfront.net/marketplace_artwork_images/6192737719_1554480283.jpg',
        headLine: 'POV Porn Devloper',
        numberOfRating: '69',
        rating: '3.6',
        price: '69\$/h',
        email: 'Omar@gmail.com',
        joinedDate: '2019/9/3',
        phoneNumber: '0565624222',
        isRated: false),
    User(
        id: 4,
        name: 'Ali Haij',
        imageCode:
            'https://i.pinimg.com/originals/ea/94/3c/ea943c3df0494c6974bb79a4c157ac2a.jpg',
        headLine: 'Java Devloper',
        numberOfRating: '96',
        rating: '5.0',
        price: '30\$/h',
        email: 'ali@gmail.com',
        joinedDate: '2017/4/3',
        phoneNumber: '0512345678',
        isRated: false),
  ];

  List<User> get users {
    return [..._users];
  }
}
