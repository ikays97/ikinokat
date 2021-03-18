import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ikinokat/config/validators.dart';
import 'package:ikinokat/pages/login/login_page.dart';
import 'package:ikinokat/pages/profile/provider/user_provider.dart';
import 'package:ikinokat/utils/navigator.dart';
import 'package:ikinokat/widgets/my_custom_button.dart';
import 'package:ikinokat/widgets/my_loading.dart';
import 'package:ikinokat/widgets/my_textformfield.dart';
import 'package:provider/provider.dart';

class ProductAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (_, state, child) {
        return state.getUser
            ? SafeArea(child: ProductAddPageContainer())
            : LoginPage();
      },
    );
  }
}

class ProductAddPageContainer extends StatefulWidget {
  @override
  _ProductAddPageContainerState createState() =>
      _ProductAddPageContainerState();
}

class _ProductAddPageContainerState extends State<ProductAddPageContainer> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _keywordController = TextEditingController();
  final TextEditingController _descripController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // login function
    var doSave = () async {
      final form = _formKey.currentState;
      if (form.validate()) {
        form.save();
        Map<String, String> data = {};
        // TODO: call state and save product
      } else {
        print('form validation failed');
      }
    };
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            MyTextFormField(
              controller: _nameController,
              validator: validateName,
              hintText: 'Name',
            ),
            MyTextFormField(
              controller: _priceController,
              validator: validatePassword,
              hintText: 'Price',
            ),
            MyTextFormField(
              controller: _quantityController,
              validator: validatePassword,
              hintText: 'Quantity',
            ),
            MyTextFormField(
              controller: _keywordController,
              validator: validatePassword,
              hintText: 'Keyword',
            ),
            MyTextFormField(
              controller: _descripController,
              validator: validatePassword,
              hintText: 'Description',
            ),
            MyTextFormField(
              controller: _categoryController,
              validator: validatePassword,
              hintText: 'Category',
            ),
            MyTextFormField(
              controller: _brandController,
              validator: validatePassword,
              hintText: 'Brand',
            ),
            Consumer<UserProvider>(
              builder: (_, state, child) {
                return state.loading
                    ? MyLoadingWidget()
                    : MyCustomButton(
                        onTap: doSave,
                        text: 'ADD PRODUCT',
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
