import 'package:flutter/material.dart';
import 'package:wajbah_chef/features/menu/presentation/widgets/menu_view_widgets/menu_view_body.dart';
import '../../../../../core/styles.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/sizeConfig.dart';

List<String> _tabTitles = [
  "Grilled",
  "Oriental",
  "Greeny",
  "Desserts",
  "Offers"
];

class KitchenMenuTab extends StatefulWidget {
  const KitchenMenuTab({
    Key? key,
  }) : super(key: key);

  @override
  State<KitchenMenuTab> createState() => _KitchenMenuTabState();
}

class _KitchenMenuTabState extends State<KitchenMenuTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double height = SizeConfig.screenH!;
    final double width = SizeConfig.screenW!;
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.02,
            ),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              automaticIndicatorColorAdjustment: false,
              dividerHeight: 0,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.transparent,
              tabs: [
                _buildTab("Grilled", 0),
                _buildTab("Orirental", 1),
                _buildTab("Greeny", 2),
                _buildTab("Desserts", 3),
                _buildTab("Offers", 4),
              ],
              onTap: (index) {
                setState(() {
                  _scrollTo(index);
                });
              },
            ),
          ),
          for (int i = 0; i < _tabTitles.length; i++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                  ),
                  child: Text(
                    _tabTitles[i],
                    style: Styles.titleMedium.copyWith(fontSize: width * 0.05),
                  ),
                ),
                MenuViewBody(
                  token: '',
                  chefId: '',
                )
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _tabController.index == index
              ? wajbah_primary
              : wajbah_gray_light,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: Styles.hint.copyWith(
            color: _tabController.index == index ? Colors.white : wajbah_gray,
            fontSize: MediaQuery.of(context).size.width * 0.03,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  void _scrollTo(int index) {
    _scrollController.animateTo(
      index * MediaQuery.of(context).size.height * 0.6,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
