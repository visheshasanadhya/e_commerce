import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/store.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
	final Item catalog;

	const AddToCart({
		super.key,
		required this.catalog,
	});

	@override
	Widget build(BuildContext context) {
		VxState.watch(context, on: [AddMutation, RemoveMutation]);
		final CartModel cart = (VxState.store as MyStore).cart;
		bool isInCart = cart.items.contains(catalog);

		return ElevatedButton(
			onPressed: () {
				if (!isInCart) {
					AddMutation(catalog);
				}
			},
			style: ButtonStyle(
				backgroundColor: WidgetStateProperty.all(
					context.theme.colorScheme.primary,
				),
				shape: WidgetStateProperty.all(
					const StadiumBorder(),
				),
				padding: WidgetStateProperty.all(
					const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
				),
			),
			child: Row(
				mainAxisSize: MainAxisSize.min,
				children: [
					Icon(
						isInCart ? Icons.done : CupertinoIcons.cart_badge_plus,
						color: Colors.white,
						size: 18,
					),
					8.widthBox,
					Text(
						isInCart ? "Added" : "Add to Cart",
						style: const TextStyle(
							color: Colors.white,
							fontWeight: FontWeight.bold,
						),
					),
				],
			),
		);
	}
}
