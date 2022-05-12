// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_drag_and_drop_listview/data/draggable_lists.dart';
import 'package:flutter_drag_and_drop_listview/main.dart';

import '../model/draggable_list.dart';

class ProductDialog extends StatefulWidget {
  const ProductDialog({
    Key? key,
  }) : super(key: key);

  @override
  _ProductDialogState createState() => _ProductDialogState();
}

class _ProductDialogState extends State<ProductDialog> {
  final formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const title = 'Add Product';
    return AlertDialog(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: const Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 8),
              nameField(),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        cancelButton(context),
        addButton(
          context,
          // widget.product
        ),
      ],
      actionsAlignment: MainAxisAlignment.spaceAround,
    );
  }

  Widget nameField() => TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Name',
        ),
        keyboardType: TextInputType.number,
        validator: (value) => value == null ? 'Please enter a Name' : null,
        controller: nameCtrl,
      );

  Widget cancelButton(BuildContext context) => customButton(context,
      title: 'Cancel', onPressed: () => Navigator.of(context).pop());

  Widget addButton(
    BuildContext context,
    //Product? product
  ) {
    const text = 'Add';
    return customButton(
      context,
      title: text,
      onPressed: () async {
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          final name = nameCtrl.text;
          addProduct(name);
          Navigator.push(context,MaterialPageRoute(builder: (context) => MainPage(),));
        }
      },
    );
  }

  Widget customButton(BuildContext context,
      {required String title, required void Function()? onPressed}) {
    return SizedBox(
      width: 100,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: Text(title, style: const TextStyle(color: Colors.red)),
        onPressed: onPressed,
      ),
    );
  }
}

void addProduct(String name) async {
  final product = DraggableListItem(title: name);
  allLists[0].items.add(product);
}
