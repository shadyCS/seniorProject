import 'package:final_t_and_t/Screens/create_screen.dart';
import 'package:final_t_and_t/Screens/main_home.dart';
import 'package:final_t_and_t/Screens/public_profile.dart';
import 'package:final_t_and_t/Screens/search_screen.dart';
import 'package:final_t_and_t/Settings/account_setting.dart';
import 'package:flutter/material.dart';

const String apiUrl =
    'https://senior-project-backend-connect.herokuapp.com/api';

List<Widget> pages = [
  HomeMainScreen(),
  SearchScreen(),
  CreateScreen(),
  AccountSetting(),
  PublicProfileScreen(),
];

final subjectList = [
  {'subject': 'Computer Science', 'image': 'Assets/Images/CS.jpg'},
  {'subject': 'IT', 'image': 'Assets/Images/IT.jpg'},
  {'subject': 'Mathematics', 'image': 'Assets/Images/MA.jpg'},
  {'subject': 'Business', 'image': 'Assets/Images/BU.jpg'},
  {'subject': 'Engineering', 'image': 'Assets/Images/EN.jpg'},
  {'subject': 'Accounting', 'image': 'Assets/Images/AC.jpg'},
  {'subject': 'Finance', 'image': 'Assets/Images/FI.jpg'},
  {'subject': 'Economics', 'image': 'Assets/Images/EC.jpg'},
  {'subject': 'Geology', 'image': 'Assets/Images/GE.jpg'},
  {'subject': 'Psychology', 'image': 'Assets/Images/PS.jpg'},
  {'subject': 'English', 'image': 'Assets/Images/ENL.jpg'},
  {'subject': 'History', 'image': 'Assets/Images/HI.jpg'},
  {'subject': 'Philsophy', 'image': 'Assets/Images/PH.jpg'},
  {'subject': 'Physics', 'image': 'Assets/Images/PHY.jpg'},
  {'subject': 'Chemistry', 'image': 'Assets/Images/CH.jpg'},
  {'subject': 'Biology', 'image': 'Assets/Images/BI.jpg'},
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
