import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/styles.dart';

class OrderDetails extends StatelessWidget {
  final String order_id;
  final String item_name;
  final int item_count;
  final int price;
  final String Description;
  const OrderDetails({
    super.key,
    required this.order_id,
    required this.item_name,
    required this.item_count,
    required this.price,
    required this.Description,
  });

  @override
  Widget build(BuildContext context) {
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
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/Wajbah_Finale.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'x$item_count $item_name',
                  style: Styles.titleMedium
                      .copyWith(fontSize: 14, color: wajbah_black),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Regular',
                  style: Styles.hint,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    Description,
                    style: Styles.hint,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text('EGP $price',
                    style: Styles.titleMedium
                        .copyWith(fontSize: 14, color: wajbah_black))
              ],
            ),
          ],
        ),
      ],
    );
  }
}
