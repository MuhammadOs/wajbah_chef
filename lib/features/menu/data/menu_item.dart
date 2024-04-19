import 'dart:io';

class MenuItem {
  final String name;
  final String bio;
  final int numberOfPersons;
  final File? profileImage;

  MenuItem({
    required this.name,
    required this.bio,
    required this.numberOfPersons,
    required this.profileImage,
  });
}
