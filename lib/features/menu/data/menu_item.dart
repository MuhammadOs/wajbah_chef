import 'dart:io';

class MenuItemStatic {
  final String name;
  final String bio;
  final int numberOfPersons;
  final File? profileImage;

  MenuItemStatic({
    required this.name,
    required this.bio,
    required this.numberOfPersons,
    required this.profileImage,
  });
}
