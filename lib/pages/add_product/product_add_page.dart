import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as GetLocale;
import 'package:ikinokat/config/validators.dart';
import 'package:ikinokat/pages/category/provider/category_provider.dart';
import 'package:ikinokat/pages/login/login_page.dart';
import 'package:ikinokat/pages/my_brands.dart/provider/getbrands_provider.dart';
import 'package:ikinokat/pages/add_product/components/upload_image.dart';
import 'package:ikinokat/pages/view_my_products/products_page.dart';
import 'package:ikinokat/pages/add_product/provider/addproduct_provider.dart';
import 'package:ikinokat/pages/add_product/provider/image_provider.dart';
import 'package:ikinokat/pages/profile/provider/user_provider.dart';
import 'package:ikinokat/utils/navigator.dart';
import 'package:ikinokat/widgets/my_appbar.dart';
import 'package:ikinokat/widgets/my_custom_button.dart';
import 'package:ikinokat/widgets/my_dropdown.dart';
import 'package:ikinokat/widgets/my_loading.dart';
import 'package:ikinokat/widgets/my_textformfield.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class ProductAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (_, state, child) {
        return state.getUser ? ProductAddPageContainer() : LoginPage();
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
  FocusNode nameFocus;
  FocusNode priceFocus;
  FocusNode quantityFocus;
  FocusNode keywordFocus;
  FocusNode descFocus;
  //
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _keywordController = TextEditingController();
  final TextEditingController _descripController = TextEditingController();
  String _category, _brand, _unit;
  List<File> _images = [];

  @override
  void initState() {
    super.initState();
    nameFocus = FocusNode();
    priceFocus = FocusNode();
    quantityFocus = FocusNode();
    keywordFocus = FocusNode();
    descFocus = FocusNode();
  }

  @override
  void dispose() {
    nameFocus.dispose();
    priceFocus.dispose();
    quantityFocus.dispose();
    keywordFocus.dispose();
    descFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// states
    final cat_state = Provider.of<CategoryProvider>(context);
    final brand_state = Provider.of<GetBrandsProvider>(context);
    final imagestate = Provider.of<MyImageProvider>(context);
    final langCode = GetLocale.Get.locale.languageCode;

    /// dropdown lists
    final brands = brand_state.userBrands.map((e) => e.name).toList();
    final categories =
        cat_state.categories.map((e) => e.getName(langCode)).toList();
    final units = cat_state.units.map((e) => e.getName(langCode)).toList();

    /// login function
    var _submit = () async {
      final form = _formKey.currentState;
      if (form.validate()) {
        form.save();

        Map<String, dynamic> data = {
          'name_tm': _nameController.text,
          'cat_id': categories.indexOf(_category) + 1,
          'brand_id': brands.indexOf(_brand) + 1,
          'unit_id': units.indexOf(_unit) + 1,
        };

        if (imagestate.img1 != null) {
          print("Image 1: ${imagestate.img1.path}");
          _images.add(File(imagestate.img1.path));
        }
        if (imagestate.img2 != null) {
          print("Image 2: ${imagestate.img2.path}");
          _images.add(File(imagestate.img2.path));
        }
        if (imagestate.img3 != null) {
          print("Image 3: ${imagestate.img3.path}");
          _images.add(File(imagestate.img3.path));
        }

        Map<String, List<MultipartFile>> fileMap = {"images": []};
        for (File file in _images) {
          String filename = basename(file.path);
          fileMap['images'].add(MultipartFile(
            file.openRead(),
            await file.length(),
            filename: filename,
          ));
        }

        data.addAll(fileMap);
        var formData = FormData.fromMap(data);
        AddProductProvider state =
            Provider.of<AddProductProvider>(context, listen: false);
        await state.addUserProduct(formData);
        if (state.isAdded) {
          MyNavigator.push(MyProductsPage());
        } else {
          print('haryt goshulmady, product_add_page:111');
        }
      } else {
        print('form validation failed');
      }
    };

    return Scaffold(
      appBar: MyAppBar(
        context: context,
        leadingType: AppBarBackType.None,
      ),
      body: cat_state.loading
          ? MyLoadingWidget()
          : GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Container(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: 8,
                    ),
                    children: [
                      Row(
                        children: [
                          UploadSection(number: 1),
                          UploadSection(number: 2),
                          UploadSection(number: 3),
                        ],
                      ),
                      MyTextFormField(
                        controller: _nameController,
                        validator: validateName,
                        labelText: 'add_name'.tr,
                        hintText: 'your_name'.tr,
                        focusNode: nameFocus,
                      ),
                      MyTextFormField(
                          controller: _priceController,
                          validator: validatePassword,
                          labelText: 'add_price'.tr,
                          hintText: 'product_price'.tr,
                          focusNode: priceFocus),
                      MyTextFormField(
                        controller: _quantityController,
                        validator: validatePassword,
                        labelText: 'add_min'.tr,
                        hintText: 'minimum_quantity'.tr,
                        focusNode: quantityFocus,
                      ),
                      MyTextFormField(
                        controller: _keywordController,
                        validator: validatePassword,
                        labelText: 'add_keywords'.tr,
                        hintText: 'product_keywords'.tr,
                        focusNode: keywordFocus,
                      ),
                      MyTextFormField(
                        controller: _descripController,
                        validator: validatePassword,
                        labelText: 'add_desc'.tr,
                        hintText: 'product_desc'.tr,
                        focusNode: descFocus,
                      ),
                      MyDropDown(
                        list: categories,
                        currentSelected: _category,
                        labelText: 'add_category'.tr,
                        hintText: 'select_category'.tr,
                        onChanged: (value) {
                          setState(() {
                            _category = value;
                          });
                        },
                      ),

                      /// user brands
                      MyDropDown(
                        list: brands,
                        currentSelected: _brand,
                        labelText: 'add_brand'.tr,
                        hintText: 'select_brand'.tr,
                        onChanged: (value) {
                          setState(() {
                            _brand = value;
                          });
                        },
                      ),
                      MyDropDown(
                        list: units,
                        currentSelected: _unit,
                        labelText: 'add_unit'.tr,
                        hintText: 'select_unit'.tr,
                        onChanged: (value) {
                          setState(() {
                            _unit = value;
                          });
                        },
                      ),
                      Consumer<UserProvider>(
                        builder: (_, state, child) {
                          return state.loading
                              ? MyLoadingWidget()
                              : MyCustomButton(
                                  onTap: _submit,
                                  text: 'add_product_add'.tr,
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
