import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/lucide.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/styles.dart';
import 'package:wajbah_chef/core/widgets/custom_appbar.dart';
import 'package:wajbah_chef/features/profile/presentation/view/widgets/done_orders_view.dart';
import 'package:wajbah_chef/features/profile/presentation/view/widgets/profile_items_divider.dart';
import 'package:wajbah_chef/features/profile/presentation/view/widgets/profile_listitem.dart';
import '../../../../../core/sizeConfig.dart';
import '../../../data/model/profile_model.dart';
import '../../view_model/profile_cubit.dart';
import '../../view_model/profile_state.dart';

class ProfileBody extends StatelessWidget {
    final ProfileData profileData;

  const ProfileBody({super.key, required this.profileData});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    var args = ModalRoute.of(context)!.settings.arguments as ProfileData;

    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(title: 'Profile'),
          CircleAvatar(
            radius: 40,
            backgroundColor: wajbah_primary,
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.016),
              child: Text(
                profileData.chef_Fname.substring(0, 1),
                style: Styles.titleMedium
                    .copyWith(color: wajbah_white, fontSize: 40),
              ),
            ),
          ),
          SizedBox(height: height * 0.03),
          Container(
            width: width * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black.withOpacity(0.3))),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        String newFirstName = profileData.chef_Fname;
                        String newLastName = profileData.chef_Lname;
                        return AlertDialog(
                          title: Text('Edit Profile Name',
                              style: Styles.titleMedium.copyWith(fontSize: 18)),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                onChanged: (value) {
                                  newFirstName = value;
                                },
                                decoration: const InputDecoration(
                                    hintText: 'Enter your new first name'),
                                controller: TextEditingController(
                                    text: profileData.chef_Fname),
                              ),
                              TextField(
                                onChanged: (value) {
                                  newLastName = value;
                                },
                                decoration: const InputDecoration(
                                    hintText: 'Enter your new last name'),
                                controller: TextEditingController(
                                    text: profileData.chef_Lname),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                profileData.chef_Fname = newFirstName;
                                profileData.chef_Lname = newLastName;
                                ProfileUpdateRequest updateRequest =
                                    ProfileUpdateRequest(
                                  chefId: profileData.chef_id,
                                  phoneNumber: profileData.phone_number,
                                  email: profileData.email,
                                  password: profileData.password,
                                  chefFirstName: profileData.chef_Fname,
                                  chefLastName: profileData.chef_Lname,
                                  restaurantName: profileData.restaurantName,
                                  birthDate: profileData.birthdate,
                                  description: profileData.description,
                                  profilePicture: profileData.profile_picture,
                                  address: Address(
                                    governorate: profileData.governorate,
                                    city: profileData.city,
                                    street: profileData.street,
                                    buildingNumber: profileData.buildingNumber,
                                    floor: profileData.floor,
                                    flatNumber: profileData.flatNumber,
                                  ),
                                );
                                context
                                    .read<ProfileCubit>()
                                    .updateProfile(updateRequest);

                                Navigator.pushNamedAndRemoveUntil(
                                    context, 'login', (route) => false);
                              },
                              child: const Text('Submit'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: ProfileListItem(
                    width: width,
                    height: height,
                    title: 'Edit Profile Name',
                    icon: Mdi.account_switch,
                  ),
                ),
                ProfileItemsDivider(width: width),
                InkWell(
                  child: ProfileListItem(
                      width: width,
                      height: height,
                      title: 'Previous Orders',
                      icon: Ic.outline_restaurant_menu),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DoneOrdersView(
                            chefid: profileData.chef_id,
                            token: profileData.token)));
                  },
                ),
                ProfileItemsDivider(width: width),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        String kitchenName = profileData.restaurantName;

                        return AlertDialog(
                          title: Text('Change Your Kitchen\'s Name',
                              style: Styles.titleMedium.copyWith(fontSize: 18)),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                onChanged: (value) {
                                  kitchenName = value;
                                },
                                decoration: const InputDecoration(
                                    hintText: 'Enter Your New Kitchen\'s Name'),
                                controller: TextEditingController(
                                    text: profileData.restaurantName),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                profileData.restaurantName = kitchenName;

                                ProfileUpdateRequest updateRequest =
                                    ProfileUpdateRequest(
                                  chefId: profileData.chef_id,
                                  phoneNumber: profileData.phone_number,
                                  email: profileData.email,
                                  password: profileData.password,
                                  chefFirstName: profileData.chef_Fname,
                                  chefLastName: profileData.chef_Lname,
                                  restaurantName: profileData.restaurantName,
                                  birthDate: profileData.birthdate,
                                  description: profileData.description,
                                  profilePicture: profileData.profile_picture,
                                  address: Address(
                                    governorate: profileData.governorate,
                                    city: profileData.city,
                                    street: profileData.street,
                                    buildingNumber: profileData.buildingNumber,
                                    floor: profileData.floor,
                                    flatNumber: profileData.flatNumber,
                                  ),
                                );
                                context
                                    .read<ProfileCubit>()
                                    .updateProfile(updateRequest);

                                Navigator.pushNamedAndRemoveUntil(
                                    context, 'login', (route) => false);
                              },
                              child: const Text('Submit'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: ProfileListItem(
                    width: width,
                    height: height,
                    title: 'Change Kitchen\'s Name',
                    icon: Lucide.chef_hat,
                  ),
                ),
                ProfileItemsDivider(width: width),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        int newPhoneNumber = profileData.phone_number;

                        return AlertDialog(
                          title: Text('Change Phone Number',
                              style: Styles.titleMedium.copyWith(fontSize: 18)),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                onChanged: (value) {
                                  newPhoneNumber = int.parse(value);
                                },
                                decoration: const InputDecoration(
                                    hintText: 'Enter Your New Phone Number'),
                                controller: TextEditingController(
                                    text: profileData.phone_number.toString()),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                profileData.phone_number = newPhoneNumber;
                                ProfileUpdateRequest updateRequest =
                                    ProfileUpdateRequest(
                                  chefId: profileData.chef_id,
                                  phoneNumber: profileData.phone_number,
                                  email: profileData.email,
                                  password: profileData.password,
                                  chefFirstName: profileData.chef_Fname,
                                  chefLastName: profileData.chef_Lname,
                                  restaurantName: profileData.restaurantName,
                                  birthDate: profileData.birthdate,
                                  description: profileData.description,
                                  profilePicture: profileData.profile_picture,
                                  address: Address(
                                    governorate: profileData.governorate,
                                    city: profileData.city,
                                    street: profileData.street,
                                    buildingNumber: profileData.buildingNumber,
                                    floor: profileData.floor,
                                    flatNumber: profileData.flatNumber,
                                  ),
                                );
                                context
                                    .read<ProfileCubit>()
                                    .updateProfile(updateRequest);

                                Navigator.pushNamedAndRemoveUntil(
                                    context, 'login', (route) => false);
                              },
                              child: const Text('Submit'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: ProfileListItem(
                    width: width,
                    height: height,
                    title: 'Change Phone Number',
                    icon: MaterialSymbols.phone_android,
                  ),
                ),
                ProfileItemsDivider(width: width),
                ProfileListItem(
                    width: width,
                    height: height,
                    title: 'Change Password',
                    icon: Ri.lock_password_line),
                ProfileItemsDivider(width: width),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        String newEmail = profileData.email;

                        return AlertDialog(
                          title: Text('Change Your Email',
                              style: Styles.titleMedium.copyWith(fontSize: 18)),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                onChanged: (value) {
                                  newEmail = value;
                                },
                                decoration: const InputDecoration(
                                    hintText: 'Enter Your New Email'),
                                controller: TextEditingController(
                                    text: profileData.email),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                profileData.email = newEmail;

                                ProfileUpdateRequest updateRequest =
                                    ProfileUpdateRequest(
                                  chefId: profileData.chef_id,
                                  phoneNumber: profileData.phone_number,
                                  email: profileData.email,
                                  password: profileData.password,
                                  chefFirstName: profileData.chef_Fname,
                                  chefLastName: profileData.chef_Lname,
                                  restaurantName: profileData.restaurantName,
                                  birthDate: profileData.birthdate,
                                  description: profileData.description,
                                  profilePicture: profileData.profile_picture,
                                  address: Address(
                                    governorate: profileData.governorate,
                                    city: profileData.city,
                                    street: profileData.street,
                                    buildingNumber: profileData.buildingNumber,
                                    floor: profileData.floor,
                                    flatNumber: profileData.flatNumber,
                                  ),
                                );
                                context
                                    .read<ProfileCubit>()
                                    .updateProfile(updateRequest);

                                Navigator.pushNamedAndRemoveUntil(
                                    context, 'login', (route) => false);
                              },
                              child: const Text('Submit'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: ProfileListItem(
                    width: width,
                    height: height,
                    title: 'Change Your Email',
                    icon: Ic.outline_email,
                  ),
                ),
                ProfileItemsDivider(width: width),
                InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'login', (route) => false);
                  },
                  child: ProfileListItem(
                      width: width,
                      height: height,
                      title: 'Logout',
                      icon: Ic.baseline_logout),
                ),
                BlocConsumer<ProfileCubit, ProfileManagementState>(
                  listener: (context, state) {
                    if (state is ProfileUpdated) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Profile updated successfully')),
                      );
                    } else if (state is ProfileUpdateError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Error updating profile: ${state.message}')),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is UpdatingProfile) {
                      return CircularProgressIndicator();
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileData {
  String email;
  int phone_number;
  String token;
  String chef_id;
  String password;
  String chef_Fname;
  String chef_Lname;
  String restaurantName;
  DateTime birthdate;
  String description;
  String profile_picture;
  String governorate;
  String city;
  String street;
  String buildingNumber;
  String floor;
  String flatNumber;

  ProfileData({
    required this.email,
    required this.phone_number,
    required this.token,
    required this.chef_id,
    required this.birthdate,
    required this.buildingNumber,
    required this.chef_Fname,
    required this.chef_Lname,
    required this.city,
    required this.description,
    required this.floor,
    required this.flatNumber,
    required this.governorate,
    required this.password,
    required this.profile_picture,
    required this.restaurantName,
    required this.street,
  });
}
