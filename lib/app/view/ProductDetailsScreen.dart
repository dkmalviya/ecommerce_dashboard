import 'package:e_commerce_dashboard/app/models/CategoryModel.dart';
import 'package:e_commerce_dashboard/app/models/ProductDetailsModel.dart';
import 'package:e_commerce_dashboard/app/models/SubCategoryModel.dart';
import 'package:e_commerce_dashboard/app/response/ProductDetailsResponseDto.dart';
import 'package:e_commerce_dashboard/app/response/SubcategoryResponseDto.dart';
import 'package:e_commerce_dashboard/app/utils/Utils.dart';
import 'package:e_commerce_dashboard/app/widgets/MyAppBar.dart';
import 'package:e_commerce_dashboard/app/widgets/MyToast.dart';
import 'package:e_commerce_dashboard/main.dart';
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
  List<ProductDetailsModel> productList = List();
  List<ProductDetailsModel> filteredProductList = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(selectedSubCategory);
    loadProducts();
  }

  loadProducts() async {
    /*setState(() {
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
    });*/

    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/response/product_details_api_response.json");

    final productDetailsReponseDto = productDetailsReponseDtoFromJson(data);

    for (final products in productDetailsReponseDto) {
      if (products.subCategoryId.toString() ==
          selectedSubCategory.subCategoryId) {
        ProductDetailsModel productDetailsModel = ProductDetailsModel(
            products.productId.toString(),
            products.name,
            products.brand,
            products.quantityAvailable,
            products.weight,
            products.qantitySelectedByUser,
            products.unit,
            products.price.toDouble(),
            products.subCategoryId,
            products.categoryId);
        setState(() {
          productList.add(productDetailsModel);
          filteredProductList.add(productDetailsModel);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(selectedSubCategory.name, true, 0),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Card(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Hero(
                                          tag: "hero${index}",
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
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              productList[index].name,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              productList[index].brand,
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
                                              productList[index]
                                                  .quantityAvailable
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
                                              "\u20B9 " +
                                                  productList[index]
                                                      .price
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
                                              "Weight",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w200),
                                            ),
                                            Text(
                                              productList[index]
                                                  .weight
                                                  .toString() +
                                                  " " +
                                                  productList[index]
                                                      .unit
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
                                              "Select Quantity",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w200),
                                            ),
                                            FloatingActionButton(
                                              heroTag: "minus${index}",
                                              child: Icon(
                                                  FontAwesomeIcons.minus,
                                                  size: 20,
                                                  color: Colors.black87),
                                              backgroundColor: Colors.white,
                                              onPressed: () {
                                                setState(() {
                                                  productList[index]
                                                      .qantitySelectedByUser--;
                                                });
                                              },
                                            ),
                                            new Text(
                                              productList[index]
                                                  .qantitySelectedByUser
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w200),
                                            ),
                                            FloatingActionButton(
                                              heroTag: "plus${index}",
                                              child: Icon(FontAwesomeIcons.plus,
                                                  size: 20,
                                                  color: Colors.black87),
                                              backgroundColor: Colors.white,
                                              onPressed: () {
                                                setState(() {
                                                  productList[index]
                                                      .qantitySelectedByUser++;
                                                });
                                              },
                                            )
                                          ],
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 50.0,
                                          child: RaisedButton(
                                            elevation: 5,
                                            onPressed: () {
                                              setState(() {
                                                ProductDetailsModel
                                                p = new ProductDetailsModel(
                                                    productList[index]
                                                        .productId,
                                                    productList[index].name,
                                                    productList[index]
                                                        .brand,
                                                    productList[index]
                                                        .quantityAvailable,
                                                    productList[index]
                                                        .weight,
                                                    productList[index]
                                                        .qantitySelectedByUser,
                                                    productList[index].unit,
                                                    productList[index]
                                                        .price,
                                                    productList[index]
                                                        .subCategoryId,
                                                    productList[index]
                                                        .categoryId);

                                                if(p.qantitySelectedByUser>1){
                                                  p.price=p.price*p.qantitySelectedByUser;

                                                }

                                                if(!MyApp.cartList.contains(p)){
                                                  setState(() {
                                                    MyApp.cartList.add(p);

                                                  });
                                                  MyToast(context).showSuccessToast("${p.name} added Successfully");

                                                }
                                                else{
                                                  print("Product already added");

                                                MyToast(context).showFailureToast("Product already added.");
                                                }
                                              });
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    80.0)),
                                            padding: EdgeInsets.all(0.0),
                                            child: Ink(
                                              decoration: BoxDecoration(
                                                  gradient: linearGradient,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      30.0)),
                                              child: Container(
                                                constraints: BoxConstraints(
                                                    maxWidth: 180.0,
                                                    minHeight: 40.0),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Add To Cart",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      }))
            ],
          )),
    );
  }
}
