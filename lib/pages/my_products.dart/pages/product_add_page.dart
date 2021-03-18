import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:get/get.dart' as GetLocale;
import 'package:http_parser/http_parser.dart';
import 'package:ikinokat/config/validators.dart';
import 'package:ikinokat/pages/category/provider/category_provider.dart';
import 'package:ikinokat/pages/login/login_page.dart';
import 'package:ikinokat/pages/my_brands.dart/provider/getbrands_provider.dart';
import 'package:ikinokat/pages/my_products.dart/components.dart/upload_image.dart';
import 'package:ikinokat/pages/my_products.dart/provider/addproduct_provider.dart';
import 'package:ikinokat/pages/profile/provider/user_provider.dart';
import 'package:ikinokat/widgets/my_custom_button.dart';
import 'package:ikinokat/widgets/my_dropdown.dart';
import 'package:ikinokat/widgets/my_loading.dart';
import 'package:ikinokat/widgets/my_textformfield.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
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
  String _category, _brand, _unit;

  // upload image variables
  List<Asset> images = [];
  List files = [];
  String _error;
  List<Asset> resultList = [];
  List<MultipartFile> multipartImageList = [];

  @override
  Widget build(BuildContext context) {
    /// states
    final state = Provider.of<AddProductProvider>(context);
    final cat_state = Provider.of<CategoryProvider>(context);
    final brand_state = Provider.of<GetBrandsProvider>(context);
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
        for (Asset asset in images) {
          ByteData byteData = await asset.getByteData();
          List<int> imageData = byteData.buffer.asUint8List();
          var imagePath =
              await FlutterAbsolutePath.getAbsolutePath(asset.identifier);
          MultipartFile multipartFile = MultipartFile.fromBytes(
            imageData,
            filename: imagePath,
            contentType: MediaType("image", "jpg"),
          );
          multipartImageList.add(multipartFile);
          FormData formData = FormData.fromMap({
            'name_tm': _nameController.text,
            'cat_id': categories.indexOf(_category),
            'brand_id': brands.indexOf(_brand),
            'unit_id': units.indexOf(_unit),
            "images": multipartImageList,
            // '': _priceController.text,
            // '': _quantityController.text,
            // '': _keywordController.text,
            // '': _descripController.text,
          });
          AddProductProvider _provider =
              Provider.of<AddProductProvider>(context, listen: false);
          await _provider.addUserProduct(formData);
          // try {
          //   Dio dio = Dio();
          //   var response = await dio
          //       .post('http://lomaysowda.com.tm/api/store/product', data: data);
          //   var body = jsonDecode(response.data);
          //   print(body);
          //   if (body['msg'] == "Success!") {
          //     print('posted successfully!');
          //   } else {
          //     print(body['msg']);
          //   }
          // } catch (e) {
          //   return e.message;
          // }
        }
      } else {
        print('form validation failed');
      }
    };
    return cat_state.loading
        ? MyLoadingWidget()
        : Container(
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
                  buildImageView(),
                  MyTextFormField(
                    controller: _nameController,
                    validator: validateName,
                    labelText: 'Name',
                    hintText: 'your name',
                  ),
                  MyTextFormField(
                    controller: _priceController,
                    validator: validatePassword,
                    labelText: 'Price',
                    hintText: 'product price',
                  ),
                  MyTextFormField(
                    controller: _quantityController,
                    validator: validatePassword,
                    labelText: 'Quantity',
                    hintText: 'minimum quantity',
                  ),
                  MyTextFormField(
                    controller: _keywordController,
                    validator: validatePassword,
                    labelText: 'Keyword',
                    hintText: 'keywords about product',
                  ),
                  MyTextFormField(
                    controller: _descripController,
                    validator: validatePassword,
                    labelText: 'Description',
                    hintText: 'description of product',
                  ),
                  MyDropDown(
                    list: categories,
                    currentSelected: _category,
                    labelText: 'Category',
                    hintText: 'select category',
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
                    labelText: 'Brand',
                    hintText: 'select brand',
                    onChanged: (value) {
                      setState(() {
                        _brand = value;
                      });
                    },
                  ),
                  MyDropDown(
                    list: units,
                    currentSelected: _unit,
                    labelText: 'Unit',
                    hintText: 'select unit',
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
                              text: 'ADD PRODUCT',
                            );
                    },
                  ),
                ],
              ),
            ),
          );
  }

  Widget buildImageView() {
    if (images != null && images.isNotEmpty) {
      return Container(
        height: 300,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: List.generate(images.length, (index) {
            Asset asset = images[index];
            print(asset.getByteData(quality: 100));
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                child: AssetThumb(
                  asset: asset,
                  width: 200,
                  height: 200,
                ),
              ),
            );
          }),
        ),
      );
    } else {
      return UploadSection(
        onTap: loadAssets,
      );
    }
  }

  Future<void> loadAssets() async {
    String error = "No error detected";
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 4,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;
    setState(() {
      images = resultList;
      _error = error;
    });
  }

  getImageFileFromAsset(String path) async {
    final file = File(path);
    return file;
  }
}
