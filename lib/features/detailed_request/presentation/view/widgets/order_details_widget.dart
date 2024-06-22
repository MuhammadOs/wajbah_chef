import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/sizeConfig.dart';
import 'package:wajbah_chef/core/styles.dart';
import 'package:wajbah_chef/features/menu/data/model/menu_item.dart';

class OrderDetails extends StatelessWidget {
  final String order_id;
  final List<dynamic> quantities;
  final double price;
  final List<MenuItem>? menuItems;

  const OrderDetails({
    super.key,
    required this.order_id,
    required this.quantities,
    required this.price,
    this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final screenWidth = SizeConfig.screenW!;
    final screenHeight = SizeConfig.screenH!;
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Order #$order_id',
              style: Styles.titleMedium
                  .copyWith(fontSize: 18, color: wajbah_black),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Details',
              style: Styles.titleMedium
                  .copyWith(fontSize: 14, color: wajbah_black),
            ),
            Row(
              children: [
                const Iconify(
                  MaterialSymbols.electric_bolt,
                  color: Colors.yellow,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text('Instant',
                    style: Styles.titleMedium
                        .copyWith(fontSize: 14, color: wajbah_black))
              ],
            ),
          ],
        ),
        for (int i = 0; i < quantities.length; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.075,
                    width: screenWidth * 0.25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(screenWidth * 0.05),
                      child: Image.network(
                        menuItems?[i].photo ??
                            "https://cdn-icons-png.flaticon.com/512/5663/5663566.png",
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                            "https://mir-s3-cdn-cf.behance.net/project_modules/1400/e6780a61944633.5a7f56a3a21ba.jpg",
                            fit: BoxFit.cover,
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'x${quantities[i]} ${menuItems?[i].name}',
                    style: Styles.titleMedium
                        .copyWith(fontSize: 14, color: wajbah_black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      menuItems?[i].description ?? "Description",
                      style: Styles.hint,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              Text('EGP $price',
                  style: Styles.titleMedium
                      .copyWith(fontSize: 14, color: wajbah_black))
            ],
          ),
      ],
    );
  }
}
