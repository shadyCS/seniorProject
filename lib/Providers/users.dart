import 'package:final_t_and_t/Providers/user.dart';
import 'package:flutter/cupertino.dart';

class Users with ChangeNotifier {
  List<User> _users = [
    User(
        id: 1,
        name: 'Shady Ayman',
        imageCode: 'https://wallpaperaccess.com/full/2213427.jpg',
        headLine: 'Flutter Devloper',
        numberOfRating: '70',
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
            'https://1.bp.blogspot.com/-NiNaLUVIuaE/XdP7uYpCD_I/AAAAAAAAbu8/j1n9UFpof_QqchUqFqJO2ZNcu6wRToLpwCLcBGAsYHQ/s1600/24%2BHearts%2BDP%2BProfile%2BPictures%2Bcollection%2B2019%2B-facebookdp%2B%252817%2529.jpg',
        headLine: 'Javascript Devloper',
        numberOfRating: '96',
        rating: '5.0',
        price: '100\$/h',
        email: 'Anwar@gmail.com',
        joinedDate: '2020/9/10',
        phoneNumber: '0561234567',
        isRated: false),
    User(
        id: 3,
        name: 'Omar Zain',
        imageCode: 'https://miro.medium.com/max/785/0*Ggt-XwliwAO6QURi.jpg',
        headLine: 'Unity Devloper',
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
            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
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
