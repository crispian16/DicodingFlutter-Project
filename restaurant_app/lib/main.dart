import 'package:flutter/material.dart';
import 'package:restaurant_app/local_restaurant.dart';
import 'package:restaurant_app/restaurant_detail.dart';
import 'package:restaurant_app/restaurant_list.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: const RestaurantList(),
      routes: {
        RestaurantList.routeName: (context) => const RestaurantList(),
        RestaurantDetail.routeName: (context) {
          return RestaurantDetail(
            restaurant:
                ModalRoute.of(context)?.settings.arguments as Restaurant,
          );
        },
      },
    ),
  );
}
