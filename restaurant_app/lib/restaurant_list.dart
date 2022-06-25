import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:restaurant_app/local_restaurant.dart';
import 'package:restaurant_app/restaurant_detail.dart';

class RestaurantList extends StatefulWidget {
  static const routeName = '/restaurant_list';

  const RestaurantList({Key? key}) : super(key: key);

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  Future<Iterable<Restaurant>> getList() async {
    final result = await DefaultAssetBundle.of(context)
        .loadString('assets/local_restaurant.json');
    final decode = jsonDecode(result);
    return List.from(decode['restaurants']).map((e) => Restaurant.fromJson(e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 130,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            color: Colors.cyan,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Restaurant',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Segoe UI, Semibold',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Recommendation restauran for you!',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Segoe UI, Regular',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<Iterable<Restaurant>>(
                future: getList(),
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  if (data != null && snapshot.hasData) {
                    return ListView.builder(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      itemBuilder: (context, index) {
                        final datas = data.toList()[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RestaurantDetail.routeName,
                              arguments: datas,
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            child: Row(
                              children: [
                                Hero(
                                  tag: datas.pictureId,
                                  child: Container(
                                    width: 120,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(datas.pictureId),
                                        fit: BoxFit.cover,
                                      ),
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      datas.name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_pin,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          datas.city,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star_sharp,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          datas.rating.toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: data.length,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
