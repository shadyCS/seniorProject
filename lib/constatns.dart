import 'package:final_t_and_t/Screens/main_home.dart';
import 'package:final_t_and_t/Screens/new_post_screen.dart';
import 'package:final_t_and_t/Screens/public_profile.dart';
import 'package:final_t_and_t/Screens/search_screen.dart';
import 'package:final_t_and_t/Settings/account_setting.dart';
import 'package:flutter/material.dart';

const String apiUrl =
    'https://senior-project-backend-connect.herokuapp.com/api';

List<Widget> pages = [
  HomeMainScreen(),
  SearchScreen(),
  NewPostScreen(),
  AccountSetting(),
  PublicProfileScreen(),
  Container(),
];

final subjectList = [
  {
    'subject': 'Computer Science',
    'image':
        'https://www.eschoolnews.com/files/2016/12/computer-science-education.jpg'
  },
  {
    'subject': 'IT',
    'image':
        'https://admin.workforce.com/wp-content/uploads/sites/2/2018/12/AI-is-coming-—-and-HR-is-not-prepared.jpg'
  },
  {
    'subject': 'Mathematics',
    'image': 'https://platofootnote.files.wordpress.com/2016/05/mathematics.jpg'
  },
  {
    'subject': 'Business',
    'image': 'https://www.mesarya.university/wp-content/uploads/2020/05/1-5.jpg'
  },
  {
    'subject': 'Engineering',
    'image':
        'https://www.4electron.com/wordpress/wp-content/uploads/2014/10/engineering-blueprint.jpg'
  },
  {
    'subject': 'Accounting',
    'image':
        'https://www.pcg-services.com/wp-content/uploads/2017/08/Accounting-Internal-Control-Systems-to-Protect-Your-Business-_800-1.png'
  },
  {
    'subject': 'Finance',
    'image':
        'https://wellman.ee/wp-content/uploads/2018/01/wellman_financial.jpg'
  },
  {
    'subject': 'Economics',
    'image':
        'https://info.ehl.edu/hubfs/web-certificates/1440/hospitality-economics-online-course.jpg'
  },
  {
    'subject': 'Geology',
    'image':
        'https://static.businessworld.in/article/article_extra_large_image/1587727355_IM9y65_Geology.jpg'
  },
  {
    'subject': 'Psychology',
    'image':
        'https://i2.wp.com/psychlearningcurve.org/wp-content/uploads/2019/12/skills.png?fit=1000%2C563'
  },
  {
    'subject': 'English',
    'image':
        'https://palabrus.com/blog/bl-content/uploads/pages/c027632e41773cd94db233b65ad6c2bf/hardest-part-learning-english.jpg'
  },
  {
    'subject': 'History',
    'image': 'https://connoteblog.files.wordpress.com/2019/01/history.png'
  },
  {
    'subject': 'Philsophy',
    'image': 'https://www.uwinnipeg.ca/philosophy/images/phil-homepage-sm.jpg'
  },
  {
    'subject': 'Physics',
    'image':
        'https://arc.losrios.edu/arc/main/img/instruction/ARC-Science-and-Engineering-Division/ARC-Physics-and-Engineering/ARC-Physical-Science/ARC-physics-940x529.jpg'
  },
  {
    'subject': 'Chemistry',
    'image':
        'https://jobs.newscientist.com/getasset/c40a5488-11be-43b0-843f-a2e6ef9f0612/'
  },
  {
    'subject': 'Biology',
    'image': 'https://g-teacher.com/wp-content/uploads/2019/08/17239_s.jpg'
  },
];

List<DropdownMenuItem> defaultRegions = [
  "Makkah",
  "Jeddah",
  "Riyadh",
  "Eastern Province",
  "Yunbu",
  "Al-Medina",
  "Hafar Al-Batin",
  "Al-Ta'if",
  "Tabuk",
  "Al-Qassim",
  "Abha",
  "Aseer",
  "Al-Baha",
  "Jizan",
  "Najran",
  "Al-Jouf",
  "Arar",
].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList();

List<DropdownMenuItem> defaultSubjects = [
  "Computer Science",
  "IT",
  "Mathematics",
  "Business",
  "Engineering",
  "Accounting",
  "Finance",
  "Economics",
  "Geology",
  "Psychology",
  "English",
  "History",
  "Philsophy",
  "Physics",
  "Chemistry",
  "Biology",
].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList();
