import 'package:flutter/material.dart';
import 'package:new_app/model/fruitmodel.dart';
import 'package:new_app/provider/grocery_list_provider.dart';
import 'package:provider/provider.dart';

class EditItemView extends StatefulWidget {
  final Fruitmodel fruit;
  const EditItemView({super.key, required this.fruit});

  @override
  State<EditItemView> createState() => _EditItemViewState();
}

class _EditItemViewState extends State<EditItemView> {
  final fruitNameController = TextEditingController();
  final fruitPriceController = TextEditingController();

  final fruitFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    fruitNameController.text = widget.fruit.name;
    fruitPriceController.text = widget.fruit.price;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Update Fruit Details'),
      content: Form(
        key: fruitFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 20,

          children: [
            TextFormField(
              controller: fruitNameController,

              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter fruit name',
                labelText: 'Fruit Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter fruit name';
                } else if (value.length > 20) {
                  return 'Name too long';
                } else {
                  return null;
                }
              },
            ),

            TextFormField(
              controller: fruitPriceController,

              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter fruit price',
                labelText: 'Fruit Price',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter fruit price';
                } else if (int.tryParse(value) == null) {
                  return 'Price must be a number';
                } else {
                  return null;
                }
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),

        TextButton(
          onPressed: () {
            if (fruitFormKey.currentState?.validate() ?? false) {
              final updatedFruit = Fruitmodel(
                id: widget.fruit.id,
                name: fruitNameController.text.trim(),
                price: fruitPriceController.text.trim(),
                description: "Thsi is randomw edited descrition.",
                rating: 3,
                imageUrl: widget.fruit.imageUrl,
              );
              context.read<GroceryListProvider>().updateFruitDetails(
                updatedFruit,
              );
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Invalid name or price'),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
          child: Text('Update'),
        ),
      ],
    );
  }
}
