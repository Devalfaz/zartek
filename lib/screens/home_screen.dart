import 'package:beegains/blocs/app/app_bloc.dart';
import 'package:beegains/blocs/cart/cart_bloc.dart';
import 'package:beegains/config/routes.dart';
import 'package:beegains/cubits/restaurant/restaurant_cubit.dart';
import 'package:beegains/repositories/restaurant_repository.dart';
import 'package:beegains/widgets/counter_bar.dart';
import 'package:beegains/widgets/dish_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantCubit(
        context.read<RestaurantRepository>(),
      ),
      child: const RestaurantScreen(),
    );
  }
}

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
  }

  // Set TabController length to the number of menu items

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantCubit, RestaurantsState>(
      listener: (context, state) {
        if (state is RestaurantsInitialLoaded) {
          setState(() {
            _tabController = TabController(
              length: state.products.first.tableMenuList.length,
              vsync: this,
            );
          });
        }
      },
      builder: (context, state) {
        if (state is RestaurantsInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RestaurantsInitialError) {
          return const Center(
            child: Text('Error'),
          );
        }

        if (state is RestaurantsInitialLoaded) {
          final firstTableMenuList = state.products.first.tableMenuList;
          return Scaffold(
            drawer: Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    // user name
                    child: Column(
                      children: [
                        //Image
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            FirebaseAuth.instance.currentUser?.photoURL ??
                                'https://www.pngitem.com/pimgs/m/30-307416_profile-icon-png-image-free-download-searchpng-employee.png',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          FirebaseAuth.instance.currentUser?.displayName ?? '',
                        ),
                        const SizedBox(height: 10),
                        Text(
                          FirebaseAuth.instance.currentUser?.email ?? '',
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    onTap: () {
                      context.read<AppBloc>().add(AppLogoutRequested());
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: const Text('HomeScreen'),
              bottom: TabBar(
                isScrollable: true,
                controller: _tabController,
                tabs: <Widget>[
                  ...firstTableMenuList.map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(e.menuCategory),
                    ),
                  ),
                ],
              ),
              actions: [
                //Badget Cart icon
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return Stack(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.shopping_cart),
                          onPressed: () {
                            context.go(AppRouter.cartRoute);
                          },
                        ),
                        Positioned(
                          top: 4,
                          right: 4,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: Text(
                              state.items.length.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                // ...state.products.first.tableMenuList
                //     .map((e) => Text(e.menuCategory)),

                for (var i = 0; i < firstTableMenuList.length; i++)
                  ListView.builder(
                    itemCount: firstTableMenuList[i].categoryDishes.length,
                    itemBuilder: (context, index) {
                      final currentDish =
                          firstTableMenuList[i].categoryDishes[index];
                      return Container(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Container to show if dish is vegetarian or not
                            // if vegetarian show box with green color border
                            // and green color circle at center else show the
                            //same with red color
                            DishType(dishType: currentDish.dishType),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentDish.dishName,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${currentDish.dishCurrency} ${currentDish.dishPrice}',
                                        ),
                                        Text(
                                          '${currentDish.dishCalories} calories',
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      currentDish.dishDescription,
                                    ),
                                    if (currentDish
                                        .addonCategories.isNotEmpty) ...[
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      const Text(
                                        'Customizations Available',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    // Create an Pill Shaped button to add and subtract dish
                                    //to cart and show the number of dishes added
                                    // to cart in center
                                    CounterBar(
                                      currentDish: currentDish,
                                      onTapPlus: () {
                                        BlocProvider.of<CartBloc>(
                                          context,
                                        ).add(
                                          AddToCart(currentDish),
                                        );
                                      },
                                      onTapMinus: () {
                                        BlocProvider.of<CartBloc>(
                                          context,
                                        ).add(
                                          RemoveFromCart(currentDish),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Image.network(
                                // currentDish.dishImage,
                                'https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg?auto=compress&cs=tinysrgb&w=400',
                                height: 52,
                                width: 52,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
              ],
            ),
          );
        } else {
          return const Placeholder();
        }
      },
    );
  }
}
