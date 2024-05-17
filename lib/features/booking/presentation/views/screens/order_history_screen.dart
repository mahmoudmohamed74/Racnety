import 'package:flutter/material.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/utils/app_router.dart';
import 'package:parking_app/core/widgets/app_bar_widget.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Order History',
        isBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.s8,
        ),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Full Name',
                  style: TextStyle(
                    fontSize: AppSize.s20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Book Duration   ',
                  style: TextStyle(
                    fontSize: AppSize.s20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Id    ',
                  style: TextStyle(
                    fontSize: AppSize.s20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: AppSize.s20,
                ),
                itemBuilder: (BuildContext context, int index) => InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.bookingDetails,
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                      right: AppPadding.p20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hassan Elsherbiny',
                          style: TextStyle(
                            fontSize: AppSize.s15,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          '04:00:00',
                          style: TextStyle(
                            fontSize: AppSize.s15,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                            fontSize: AppSize.s15,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
