import 'package:final_t_and_t/Providers/post.dart';
import 'package:flutter/cupertino.dart';

class Posts with ChangeNotifier {
  List<Post> _posts = [
    Post(
        postID: '86',
        region: 'Jeddah',
        title: 'Very Nice Tutor!',
        body:
            '<p>Hello! My name is Shadi Aldahmees. I am a senior Computer Science student and I am offering my services as a <b>Data Structures and Algorithms Tutor.</b></p><p>Some of my qualifications:</p><ol><li>4.9 Overall GPA</li></ol>',
        subject: 'Computer Science',
        createdAt: '2021-03-22',
        updatedAt: '2021-03-22',
        tags: ["java", "Binary Trees", "Shortest Path", "DSA"],
        email: 'CSAnwar.haredy@gmail.com',
        phone: '0547296146',
        price: '100',
        user: 'Anwar Haredy',
        userID: '1'),
    Post(
        postID: '86',
        region: 'Jeddah',
        title: 'Very Nice Tutor!',
        body:
            '<p>Hello! My name is Shadi Aldahmees. I am a senior Computer Science student and I am offering my services as a <b>Data Structures and Algorithms Tutor.</b></p><p>Some of my qualifications:</p><ol><li>4.9 Overall GPA</li></ol>',
        subject: 'Computer Science',
        createdAt: '2021-03-22',
        updatedAt: '2021-03-22',
        tags: ["java", "Binary Trees", "Shortest Path", "DSA"],
        email: 'CSAnwar.haredy@gmail.com',
        phone: '0547296146',
        price: '100',
        user: 'Anwar Haredy',
        userID: '1'),
    Post(
        postID: '86',
        region: 'Jeddah',
        title: 'Very Nice Tutor!',
        body:
            '<p>Hello! My name is Shadi Aldahmees. I am a senior Computer Science student and I am offering my services as a <b>Data Structures and Algorithms Tutor.</b></p><p>Some of my qualifications:</p><ol><li>4.9 Overall GPA</li></ol>',
        subject: 'Computer Science',
        createdAt: '2021-03-22',
        updatedAt: '2021-03-22',
        tags: ["java", "Binary Trees", "Shortest Path", "DSA"],
        email: 'CSAnwar.haredy@gmail.com',
        phone: '0547296146',
        price: '100',
        user: 'Anwar Haredy',
        userID: '1'),
    Post(
        postID: '86',
        region: 'Jeddah',
        title: 'Very Nice Tutor!',
        body:
            '<p>Hello! My name is Shadi Aldahmees. I am a senior Computer Science student and I am offering my services as a <b>Data Structures and Algorithms Tutor.</b></p><p>Some of my qualifications:</p><ol><li>4.9 Overall GPA</li></ol>',
        subject: 'Computer Science',
        createdAt: '2021-03-22',
        updatedAt: '2021-03-22',
        tags: ["java", "Binary Trees", "Shortest Path", "DSA"],
        email: 'CSAnwar.haredy@gmail.com',
        phone: '0547296146',
        price: '100',
        user: 'Anwar Haredy',
        userID: '1'),
    Post(
        postID: '86',
        region: 'Jeddah',
        title: 'Very Nice Tutor!',
        body:
            '<p>Hello! My name is Shadi Aldahmees. I am a senior Computer Science student and I am offering my services as a <b>Data Structures and Algorithms Tutor.</b></p><p>Some of my qualifications:</p><ol><li>4.9 Overall GPA</li></ol>',
        subject: 'Computer Science',
        createdAt: '2021-03-22',
        updatedAt: '2021-03-22',
        tags: ["java", "Binary Trees", "Shortest Path", "DSA"],
        email: 'CSAnwar.haredy@gmail.com',
        phone: '0547296146',
        price: '100',
        user: 'Anwar Haredy',
        userID: '1'),
    Post(
        postID: '86',
        region: 'Jeddah',
        title: 'Very Nice Tutor!',
        body:
            '<p>Hello! My name is Shadi Aldahmees. I am a senior Computer Science student and I am offering my services as a <b>Data Structures and Algorithms Tutor.</b></p><p>Some of my qualifications:</p><ol><li>4.9 Overall GPA</li></ol>',
        subject: 'Computer Science',
        createdAt: '2021-03-22',
        updatedAt: '2021-03-22',
        tags: ["java", "Binary Trees", "Shortest Path", "DSA"],
        email: 'CSAnwar.haredy@gmail.com',
        phone: '0547296146',
        price: '100',
        user: 'Anwar Haredy',
        userID: '1'),
  ];

  List<Post> get posts {
    return [..._posts];
  }
}
