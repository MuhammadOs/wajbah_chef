import 'package:flutter/material.dart';
import 'package:wajbah_chef/core/constants/constants.dart';
import 'package:wajbah_chef/core/sizeConfig.dart';
import 'package:wajbah_chef/core/styles.dart';
import 'package:wajbah_chef/features/menu/data/model/menu_item.dart';

class CustomMenuItem extends StatelessWidget {
  final MenuItem menuItem;

  const CustomMenuItem({Key? key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final screenWidth = SizeConfig.screenW!;
    final screenHeight = SizeConfig.screenH!;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.01, horizontal: screenWidth * 0.05),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: _buildMenuItemDetails(screenWidth, screenHeight),
          ),
          SizedBox(width: screenWidth * 0.02),
          Expanded(
            flex: 2,
            child: _buildMenuItemImage(screenWidth, screenHeight),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItemDetails(double screenWidth, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          menuItem.name ?? "Meal name",
          style: Styles.titleMedium.copyWith(fontSize: screenWidth * 0.04),
        ),
        SizedBox(height: screenHeight * 0.01),
        Text(
          menuItem.description ?? "Meal description",
          style: Styles.hint.copyWith(
            color: const Color(0xff696969),
            fontSize: screenWidth * 0.03,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: screenHeight * 0.01),
        _buildPriceInfo(screenWidth),
      ],
    );
  }

  Widget _buildPriceInfo(double screenWidth) {
    return Row(
      children: [
        Text(
          "${menuItem.sizesPrices!.priceSmall! + 50} ${'EGP'}",
          style: Styles.hint.copyWith(
            decoration: TextDecoration.lineThrough,
            fontSize: screenWidth * 0.03,
          ),
        ),
        SizedBox(width: screenWidth * 0.02),
        Container(
          padding: EdgeInsets.all(screenWidth * 0.01),
          decoration: BoxDecoration(
            color: wajbah_primary,
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
          ),
          child: Text(
            "${menuItem.sizesPrices?.priceSmall} ${'EGP'}",
            style: Styles.hint.copyWith(
              color: Colors.white,
              fontSize: screenWidth * 0.03,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItemImage(double screenWidth, double screenHeight) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(screenWidth * 0.05),
      child: Image.network(
        menuItem.photo == null
            ? "https://cdn-icons-png.flaticon.com/512/5663/5663566.png"
            : menuItem.photo!,
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
    );
  }
}
