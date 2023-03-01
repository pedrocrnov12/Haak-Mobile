import 'package:bee_haak_app/Providers/product_category_provider.dart';
import 'package:bee_haak_app/dtos/responses/product_responses_dto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListViewCategory extends StatelessWidget {
  final int? items;
  final String? category;
  const ProductListViewCategory
  ({
    super.key,
    this.items,
    this.category,
  });

  @override
  Widget build(BuildContext context) {


    
    return Column(
        children: [
          Consumer<ProductCategoryProvider>(builder: (context, productCategoryProvider, child) => productCategoryProvider.isloading ? const Center(child: CircularProgressIndicator())
          :Expanded(
            child: ListView.builder(
              // itemCount: ,
              itemCount: productCategoryProvider.product?.length,
              itemBuilder: ((context, index) => createItemList(context, productCategoryProvider.product![index])),
            ),
          )),
        ],
      );
  }
  
  createItemList(BuildContext context, ProductResponseDto product,) => ListTile(
    // title: Text(product.name),
    title: Text(product.name),
    subtitle: Text(product.description),
    trailing: displayImage(context, ),
    onTap: () => displayAlert(context, product),
  );


  displayImage(BuildContext context, ) => FadeInImage.assetNetwork(placeholder: 'image/loading.gif', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoXsJHSvQyODNWGPlVd6TstIV3Bkuo-m3-Ww&usqp=CAU');

  displayAlert(BuildContext context, ProductResponseDto product) => showDialog(context: context, builder: (context)=> AlertDialog(
    content: Column(
      children: [
        Text(product.name),
        const SizedBox(
          height: 20,
        ),
        displayImage(context, ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.description)
          ],
        )
      ],
    ),
    actions: [
      TextButton(onPressed: ()=> Navigator.pop(context), child: const Text('Cancel', style: TextStyle(color: Colors.black),)),
      
      ElevatedButton(onPressed: ()=> Navigator.pop(context), child: const Text('ok'))
    ],
  ));
}
