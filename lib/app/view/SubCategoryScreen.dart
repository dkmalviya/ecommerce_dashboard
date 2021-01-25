import 'package:e_commerce_dashboard/app/models/CategoryModel.dart';
import 'package:e_commerce_dashboard/app/models/SubCategoryModel.dart';
import 'package:e_commerce_dashboard/app/response/SubcategoryResponseDto.dart';
import 'package:e_commerce_dashboard/app/utils/Utils.dart';
import 'package:e_commerce_dashboard/app/widgets/MyAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubCategoryScreen extends StatefulWidget {
  final CategoryModel selectedCategory;

  SubCategoryScreen(this.selectedCategory);

  @override
  _SubCategoryScreenState createState() =>
      _SubCategoryScreenState(selectedCategory);
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  CategoryModel selectedCategory;

  List<SubCategoryModel> subCategories = List();
  List<SubCategoryModel> filterdSubCategoryList = List();

  _SubCategoryScreenState(this.selectedCategory);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(selectedCategory);
    loadSubCategories();
  }

  loadSubCategories() async {
    String data = await DefaultAssetBundle.of(context)
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
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchField = TextFormField(
      style: new TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        hintText: "Enter Product Name",
        hintStyle: TextStyle(
          color: Colors.white38,
        ),
        suffixIcon: IconButton(
          onPressed: () {

          },
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          color: Colors.transparent,
        ),
      ),
      onChanged: (string){
        setState(() {
          filterdSubCategoryList=subCategories.where((element) => (element.name.toLowerCase().contains(string.toLowerCase()))).toList();
        });
      },
    );

    return Scaffold(
      appBar: MyAppBar(selectedCategory.title, false, 0),
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
          children: [

            Container(
              child:searchField,
              color: hexToColor("#15bf9e"),
            ),
            Expanded(
            child:ListView.builder(
                itemCount: filterdSubCategoryList.length,
                itemBuilder: (context, index) {
                  return
                    Card(
                        child: ListTile(

                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            leading: Container(

                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: hexToColor("#B5AAE1"),
                                  borderRadius: BorderRadius.circular(25),
                                  gradient: linearGradient,
                                  boxShadow: customDarkShadow
                              ),
                              child: Center(

                                child: Text('${filterdSubCategoryList[index].name[0]
                                    .toUpperCase()}${filterdSubCategoryList[index].name[1]}',
                                  style: TextStyle(
                                      letterSpacing: 3,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600
                                  ),),
                              ),
                            ),
                            title: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              child: Text('${filterdSubCategoryList[index].name}'),
                            ),
                          onTap: (){

                              print(filterdSubCategoryList[index]);
                              Navigator.of(context).pushNamed("/product_details",arguments:filterdSubCategoryList[index]);
                          },

                        ));
                }),)
          ],
        )
      ),
    );
  }
}
