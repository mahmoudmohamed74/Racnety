import 'package:flutter/material.dart';
import 'package:parking_app/core/global/resources/values_manger.dart';
import 'package:parking_app/core/utils/app_router.dart';
import 'package:parking_app/features/booking/data/models/ticket_model.dart';

class TicketsHistoryWidget extends StatelessWidget {
  final List<TicketModel> ticketsList;
  const TicketsHistoryWidget({
    super.key,
    required this.ticketsList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppSize.s20,
        ),
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
            itemCount: ticketsList.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.bookingDetails,
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  right: AppPadding.p20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ticketsList[index].fullName ?? "",
                      style: const TextStyle(
                        fontSize: AppSize.s15,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      ticketsList[index].bookDuration ?? "01:00",
                      style: const TextStyle(
                        fontSize: AppSize.s15,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      "${ticketsList[index].id}",
                      style: const TextStyle(
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
    );
  }
}
