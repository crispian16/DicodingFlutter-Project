import 'package:flutter/material.dart';
import 'package:restaurant_app/local_restaurant.dart';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final Restaurant restaurant;

  const RestaurantDetail({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foods = restaurant.menus['foods'] as List<Menu>;
    final drinks = restaurant.menus['drinks'] as List<Menu>;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: restaurant.pictureId,
                  child: Image.network(
                    restaurant.pictureId,
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text('Restaurant Detail'),
                titlePadding: const EdgeInsets.only(left: 50, bottom: 16),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Segoe UI, Semibold',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
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
                      restaurant.city,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  restaurant.description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Menu Makanan',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 110,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ItemCardFood(menu: foods[index].name);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: foods.length,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Menu Minuman',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 110,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ItemCardDrinks(menu: drinks[index].name);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: drinks.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemCardFood extends StatelessWidget {
  final String menu;
  const ItemCardFood({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 110,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Empty_Food.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            menu,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Text(
            'IDR 15.000',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black45,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCardDrinks extends StatelessWidget {
  final String menu;
  const ItemCardDrinks({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 110,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Empty_Food.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            menu,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'IDR 15.000',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black45,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
