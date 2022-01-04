import 'dart:math';

import 'package:atro/consts/Colors/colors.dart';
import 'package:atro/consts/SizeConfig/size_config.dart';
import 'package:atro/consts/readyWidgets/bottom_navigation_bar.dart';
import 'package:atro/consts/readyWidgets/circle_avatar_with_badge.dart';
import 'package:atro/consts/readyWidgets/drawer.dart';
import 'package:atro/provider/bottom_navigation_bar_provider.dart';
import 'package:atro/provider/transactions_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatsTransactionsList extends StatefulWidget {
  const StatsTransactionsList({Key? key}) : super(key: key);

  @override
  State<StatsTransactionsList> createState() => _StatsTransactionsListState();
}

class _StatsTransactionsListState extends State<StatsTransactionsList> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: context.watch<BottomNavigationBarProvider>().keyOfScaffold,
      drawer: const DrawerMy(),
      appBar: _appBar(),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: <Widget>[
            Material(
              color: Colors.white,
              child: SizedBox(
                height: gpsH(100.0),
                child: TabBar(
                  labelColor: blackColor,
                  indicatorColor: blackColor,
                  tabs: [
                    Text(
                      "YEAR",
                      style: TextStyle(
                          fontFamily: "Monserrat", letterSpacing: gpsW(4.0)),
                    ),
                    Text(
                      "MONTH",
                      style: TextStyle(
                          fontFamily: "Monserrat", letterSpacing: gpsW(4.0)),
                    ),
                    Text(
                      "WEEK",
                      style: TextStyle(
                          fontFamily: "Monserrat", letterSpacing: gpsW(4.0)),
                    ),
                    Text(
                      "DAY",
                      style: TextStyle(
                          fontFamily: "Monserrat", letterSpacing: gpsW(4.0)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _listViewBuilder(context),
                  _listViewBuilder(context),
                  _listViewBuilder(context),
                  _listViewBuilder(context),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarMy(),
    );
  }

  _listViewBuilder(
    BuildContext context,
  ) {
    return ListView.builder(
      itemCount: context.watch<TransactionProviderMy>().followers.length,
      itemBuilder: (_, __) {
        return Ink(
          height: gpsH(124.0),
          width: gpsW(750.0),
          child: Row(
            children: [
              __leading(context, __),
              CircleAvatarWithBadgeMy(
                color: context.watch<TransactionProviderMy>().amounts[__] > 0
                    ? cyanColor
                    : Colors.grey,
              ),
              SizedBox(
                width: gpsW(40.0),
              ),
              __title(context, __),
            ],
          ),
        );
      },
    );
  }

  __leading(BuildContext _, int __) {
    int minuts = Random().nextInt(60);
    int hours = Random().nextInt(25);
    return SizedBox(
      height: gpsH(124.0),
      width: gpsW(190.0),
      child: Column(
        children: [
          Text(
            (_.watch<TransactionProviderMy>().amounts[__] > 0 ? "+" : "-") +
                "\$" +
                ((_.watch<TransactionProviderMy>().amounts[__] < 0)
                    ? _
                        .watch<TransactionProviderMy>()
                        .amounts[__]
                        .toString()
                        .substring(1)
                    : _.watch<TransactionProviderMy>().amounts[__].toString()),
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: gpsW(35.0),
              color: _.watch<TransactionProviderMy>().amounts[__] > 0
                  ? Colors.cyan
                  : Colors.black,
            ),
          ),
          Text(
            (hours < 10 ? "0$hours" : hours.toString()) +
                ":" +
                (minuts < 10 ? "0$minuts" : minuts.toString()) +
                (hours > 12 ? "PM" : "AM"),
            style: TextStyle(
              fontSize: gpsW(15.0),
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  __title(BuildContext context, __) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.watch<TransactionProviderMy>().followers[__],
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: gpsW(27.0),
          ),
        ),
        SizedBox(
          height: gpsH(5.0),
        ),
        Row(
          children: [
            Icon(
              Icons.insert_drive_file_outlined,
              color: Colors.grey,
              size: gpsW(25.0),
            ),
            SizedBox(
              width: gpsW(5.0),
            ),
            Text(
              __ % 2 == 0
                  ? (__ % 4 == 0 ? "Credit" : "Refound")
                  : (__ % 3 == 0 ? "Payment" : "Sale"),
              style: TextStyle(
                fontSize: gpsW(20.0),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: blackColor,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: Column(
        children: [
          const Text(
            "TRANSACTIONS HISTORY",
            style: TextStyle(
              letterSpacing: 2.0,
              color: Colors.white,
            ),
          ),
          Text(
            "1,234 transactions",
            style: TextStyle(
              fontSize: gpsW(28.0),
              color: Colors.lightGreen,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
