import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_app/api_serveces/fruit_api_servece.dart';
import 'package:new_app/model/fruitmodel.dart';
import 'package:new_app/provider/grocery_list_provider.dart';
import 'package:provider/provider.dart';

class AddItemView extends StatefulWidget {
  const AddItemView({super.key});

  @override
  State<AddItemView> createState() => _AddItemView();
}

class _AddItemView extends State<AddItemView> {
  final fruitNameController = TextEditingController();
  final fruitPriceController = TextEditingController();

  final fruitFormKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  File? pickedImage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        pickedImage = File(pickedFile.path);
      });
    }
  }

  Widget selectedImageViewer() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]!, width: 1),

            borderRadius: BorderRadius.circular(5),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.file(
              pickedImage!,
              height: 150,
              // width: 150,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned.directional(
          textDirection: TextDirection.rtl,
          start: 0,
          child: InkWell(
            onTap: () {
              setState(() {
                pickedImage = null;
              });
            },
            child: Icon(Icons.close, color: Colors.grey[500]!),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Fruit Details'),
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

            Row(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Select Image: ',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                if (Platform.isAndroid || Platform.isIOS)
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.grey[350],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    onPressed: () => _pickImage(ImageSource.camera),
                    icon: Icon(Icons.camera_alt_outlined),
                  ),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey[350],

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  onPressed: () => _pickImage(ImageSource.gallery),
                  icon: Icon(Icons.photo_library_outlined),
                ),
              ],
            ),
            if (pickedImage != null) selectedImageViewer(),
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
          onPressed: () async {
            if (fruitFormKey.currentState?.validate() ?? false) {
              if (pickedImage != null) {
                final url = await FruitApiServece.uploadFruitImage(
                  pickedImage!,
                );

                if (url != null && url.isNotEmpty) {
                  final addedFruit = Fruitmodel(
                    name: fruitNameController.text.trim(),
                    price: fruitPriceController.text.trim(),
                    rating: 2,
                    description: "description is added later.",
                    imageUrl: url,
                  );
                  if (!context.mounted) return;
                  context.read<GroceryListProvider>().addFruitDetails(
                    addedFruit,
                  );
                }

                if (!context.mounted) return;
                Navigator.of(context).pop();
              }
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
          child: Text('Add'),
        ),
      ],
    );
  }
}
