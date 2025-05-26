import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/store.dart';
import 'package:e_commerce/models/cart.dart';
import 'dart:convert';
import 'package:e_commerce/models/catalog.dart';
import 'package:e_commerce/utils/routes.dart';
import 'package:e_commerce/widgets/home_widgets/catalog_header.dart';
import 'package:e_commerce/widgets/home_widgets/catalog_list.dart';
import 'package:e_commerce/widgets/app_drawer.dart';
import 'package:e_commerce/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
    await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;

    return Scaffold(
      //drawer: MyDrawer(),
      drawer: const AppDrawer(),  // Use the drawer widget here
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (BuildContext ctx, _, __) {
          return FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: context.theme.colorScheme.primary,
            child: const Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(
            color: Vx.gray200,
            size: 22,
            count: _cart.items.length,
            textStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
