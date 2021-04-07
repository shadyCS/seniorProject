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
        userID: '1',
        imageUrl:
            'https://camo.githubusercontent.com/291427cee1b6447ab4209a7a26fb1284cd1ecac524698d5572295ad292ad0e03/68747470733a2f2f63646e302e746e7763646e2e636f6d2f77702d636f6e74656e742f626c6f67732e6469722f312f66696c65732f323031372f30392f625563767252632d312d373936783339382e6a7067'),
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
        userID: '1',
        imageUrl:
            'https://camo.githubusercontent.com/291427cee1b6447ab4209a7a26fb1284cd1ecac524698d5572295ad292ad0e03/68747470733a2f2f63646e302e746e7763646e2e636f6d2f77702d636f6e74656e742f626c6f67732e6469722f312f66696c65732f323031372f30392f625563767252632d312d373936783339382e6a7067'),
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
        userID: '1',
        imageUrl:
            'https://camo.githubusercontent.com/291427cee1b6447ab4209a7a26fb1284cd1ecac524698d5572295ad292ad0e03/68747470733a2f2f63646e302e746e7763646e2e636f6d2f77702d636f6e74656e742f626c6f67732e6469722f312f66696c65732f323031372f30392f625563767252632d312d373936783339382e6a7067'),
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
        userID: '1',
        imageUrl:
            'https://camo.githubusercontent.com/291427cee1b6447ab4209a7a26fb1284cd1ecac524698d5572295ad292ad0e03/68747470733a2f2f63646e302e746e7763646e2e636f6d2f77702d636f6e74656e742f626c6f67732e6469722f312f66696c65732f323031372f30392f625563767252632d312d373936783339382e6a7067'),
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
        userID: '1',
        imageUrl:
            'https://camo.githubusercontent.com/291427cee1b6447ab4209a7a26fb1284cd1ecac524698d5572295ad292ad0e03/68747470733a2f2f63646e302e746e7763646e2e636f6d2f77702d636f6e74656e742f626c6f67732e6469722f312f66696c65732f323031372f30392f625563767252632d312d373936783339382e6a7067'),
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
        userID: '1',
        imageUrl:
            'https://camo.githubusercontent.com/291427cee1b6447ab4209a7a26fb1284cd1ecac524698d5572295ad292ad0e03/68747470733a2f2f63646e302e746e7763646e2e636f6d2f77702d636f6e74656e742f626c6f67732e6469722f312f66696c65732f323031372f30392f625563767252632d312d373936783339382e6a7067'),
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
        userID: '1',
        imageUrl:
            'https://camo.githubusercontent.com/291427cee1b6447ab4209a7a26fb1284cd1ecac524698d5572295ad292ad0e03/68747470733a2f2f63646e302e746e7763646e2e636f6d2f77702d636f6e74656e742f626c6f67732e6469722f312f66696c65732f323031372f30392f625563767252632d312d373936783339382e6a7067'),
  ];

  List<Post> get posts {
    return [..._posts];
  }

  List<Post> searchForPosts(String title) {
    title = title.toLowerCase().trim();
    List<Post> posts = [];
    _posts.forEach((element) {
      if (element.title.toLowerCase().contains(title)) {
        posts.add(element);
      }
    });
    return posts;
  }
}
