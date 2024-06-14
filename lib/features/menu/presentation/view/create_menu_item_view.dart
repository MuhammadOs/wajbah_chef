import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/styles.dart';
import 'package:wajbah_chef/core/widgets/custom_appbar.dart';
import 'package:wajbah_chef/features/menu/data/model/get_menu_item_model/menu_item_model.dart';
import 'package:wajbah_chef/features/menu/data/model/menu_item.dart';
import 'package:wajbah_chef/features/menu/data/model/post_menu_item_model/Post_menu_item_request.dart';
import 'package:wajbah_chef/features/menu/presentation/view_model/menuItem_cubit.dart';
import 'package:wajbah_chef/features/menu/presentation/view_model/menuItem_states.dart';
import '../../../../core/sizeConfig.dart';
import '../../../Authentication/presentation/view/widgets/custom_button.dart';
import '../../data/model/size_prices.dart';

class CreateRoomView extends StatefulWidget {
  final Function(MenuItem) onMenuItemCreated;

  const CreateRoomView({Key? key, required this.onMenuItemCreated})
      : super(key: key);

  @override
  _CreateRoomViewState createState() => _CreateRoomViewState();
}

class _CreateRoomViewState extends State<CreateRoomView> {
  File? _profileImage;
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _prepTimeController = TextEditingController();
  final TextEditingController _pricesController = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

  @override
  void dispose() {
    _itemNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 32),
        child: Column(
          children: [
            CustomAppBar(title: 'Create wajbah item'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: wajbah_gray)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * 0.4,
                          height: height * 0.15,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.transparent),
                            color: wajbah_primary.withOpacity(0.2),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: _profileImage != null
                                ? Image.file(
                                    _profileImage!,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.add_photo_alternate_rounded,
                                    size: 40, color: wajbah_primary),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Change Profile Picture'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              _pickImage(ImageSource.camera);
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Take a Picture'),
                                          ),
                                          const SizedBox(height: 20),
                                          GestureDetector(
                                            onTap: () {
                                              _pickImage(ImageSource.gallery);
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                                'Choose from Gallery'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: wajbah_gray)),
                              child: const Text("Upload image"),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: wajbah_gray)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Item Name",
                              style: Styles.titleMedium.copyWith(fontSize: 14),
                            ),
                            TextFormField(
                              controller: _itemNameController,
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: wajbah_gray)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description",
                              style: Styles.titleMedium.copyWith(fontSize: 14),
                            ),
                            TextFormField(
                              controller: _descriptionController,
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: wajbah_gray)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Category",
                                    style: Styles.titleMedium
                                        .copyWith(fontSize: 14),
                                  ),
                                  TextFormField(
                                    controller: _categoryController,
                                    decoration: InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: wajbah_gray)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Prep. time",
                                    style: Styles.titleMedium
                                        .copyWith(fontSize: 14),
                                  ),
                                  TextFormField(
                                    controller: _prepTimeController,
                                    keyboardType: TextInputType.number,
                                    // Set the keyboard type to number
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    // Allow only digits
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: wajbah_gray),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Prices",
                              style: Styles.titleMedium.copyWith(fontSize: 14),
                            ),
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                TextFormField(
                                  controller: _pricesController,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                                const CircleAvatar(
                                    radius: 15,
                                    backgroundColor: wajbah_green,
                                    child: Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      BlocConsumer<MenuGetCubit, MenuGetState>(
                        listener: (context, state) {
                          if (state is MenuGetErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.errMessage)),
                            );
                          } else if (state is MenuPostStateSuccess) {
                            Navigator.popUntil(context, ModalRoute.withName("home"));
                          }
                        },
                        builder: (context, state) {
                          return (state is MenuGetStateLoading)
                              ? const Center(child: CircularProgressIndicator())
                              : Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: width * 0.3,
                                      child: CustomButton(
                                        color: wajbah_primary,
                                        onPressed: () async {
                                          if (_itemNameController
                                                  .text.isEmpty ||
                                              _descriptionController
                                                  .text.isEmpty) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text('Error'),
                                                  content: const Text(
                                                      'Please fill in all the required fields.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const Text('OK'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            return;
                                          }

                                          PostMenuItemRequest newItem =
                                              PostMenuItemRequest(
                                            name: _itemNameController.text,
                                            description:
                                                _descriptionController.text,
                                            category: _categoryController.text,
                                            estimatedTime:
                                                _prepTimeController.text,
                                            photo: "https://th.bing.com/th/id/R.f59dbcc0d79d84a5971ddf09f722f56c?rik=fD9SfX6o%2baYmTA&pid=ImgRaw&r=0",
                                            chefId: "30203262301013",
                                            healthyMode: false,
                                            occassions: "all time",
                                            orderingTime:
                                                _prepTimeController.text,
                                            sizesPrices: SizesPrices(
                                                priceLarge: 120,
                                                priceMedium: 100,
                                                priceSmall: 80),
                                          );

                                          // Post the new menu item using the cubit
                                          BlocProvider.of<MenuGetCubit>(context)
                                              .postMenuItem(
                                                  newItem, "30203262301013");
                                        },
                                        text: "Save",
                                      ),
                                    ),
                                  ),
                                );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
