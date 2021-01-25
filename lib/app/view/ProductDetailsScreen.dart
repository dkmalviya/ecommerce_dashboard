import 'package:e_commerce_dashboard/app/models/CategoryModel.dart';
import 'package:e_commerce_dashboard/app/models/ProductDetailsModel.dart';
import 'package:e_commerce_dashboard/app/models/SubCategoryModel.dart';
import 'package:e_commerce_dashboard/app/response/SubcategoryResponseDto.dart';
import 'package:e_commerce_dashboard/app/utils/Utils.dart';
import 'package:e_commerce_dashboard/app/widgets/MyAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductDetailsScreen extends StatefulWidget {
  final SubCategoryModel selectedSubCategory;

  ProductDetailsScreen(this.selectedSubCategory);

  @override
  _ProductDetailsScreenState createState() =>
      _ProductDetailsScreenState(selectedSubCategory);
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  SubCategoryModel selectedSubCategory;

  _ProductDetailsScreenState(this.selectedSubCategory);

  ProductDetailsModel productDetailsModel;
  List<ProductDetailsModel> subProducts = List();
  List<ProductDetailsModel> filterdProducts = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(selectedSubCategory);
    loadProducts();
  }

  loadProducts() async {
    setState(() {
      productDetailsModel = new ProductDetailsModel(
          "1234567",
          "Wheat Flour",
          "Ashirwad",
          10,
          5,
          0,
          "KG",
          350,
          selectedSubCategory.subCategoryId,
          selectedSubCategory.categoryId);
    });

    /* String data = await DefaultAssetBundle.of(context)
        .loadString("assets/response/sub_category_api_response.json");

    final subCategoryReponseDto = subCategoryReponseDtoFromJson(data);

    for (final subCat in subCategoryReponseDto) {
      if (subCat.categoryId.toString() == selectedCategory.categoryId) {
        SubCategoryModel subcategoryModelTemp = SubCategoryModel(
            subCat.subCategoryId, subCat.subcategoryName, subCat.categoryId);

        setState(() {
          subCategories.add(subcategoryModelTemp);
          filterdSubCategoryList.add(subcategoryModelTemp);
        });
      }
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(selectedSubCategory.name, false, 0),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Card(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Hero(
                                tag: "hero1",
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 35.0,
                                  child: Image.asset(
                                    "assets/images/app_icon.png",
                                    width: 50,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productDetailsModel.name,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    productDetailsModel.brand,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Available Quantity",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  Text(
                                    productDetailsModel.quantityAvailable
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200),
                                  )
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Price",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  Text(
                                    productDetailsModel.price.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200),
                                  )
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Weight",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  Text(
                                    productDetailsModel.weight.toString() +
                                        " " +
                                        productDetailsModel.unit,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200),
                                  )
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Select Quantity",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  FloatingActionButton(
                                    child: Icon(FontAwesomeIcons.minus,
                                        size: 20, color: Colors.black87),
                                    backgroundColor: Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        productDetailsModel
                                            .qantitySelectedByUser--;
                                      });
                                    },
                                  ),
                                  new Text(
                                    productDetailsModel.qantitySelectedByUser
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  FloatingActionButton(
                                    child: Icon(FontAwesomeIcons.plus,
                                        size: 20, color: Colors.black87),
                                    backgroundColor: Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        productDetailsModel
                                            .qantitySelectedByUser++;
                                      });
                                    },
                                  )
                                ],
                              )),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 15, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                RaisedButton(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text("Add To Cart",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600)
                                      ),
                                    ),
                                    color: hexToColor("#6ae7a7"),
                                    onPressed: () {

                                    })
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          )),
    );
  }
}
