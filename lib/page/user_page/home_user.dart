import 'package:bee_haak_app/widget/buttons/button_navegation.dart';
import 'package:bee_haak_app/widget/listview/product_listview.dart';
import 'package:flutter/material.dart';



class HomeUser extends StatefulWidget {
  const HomeUser({super.key});
  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: const [
          ButtonPage(icon: Icons.menu, ruta: '/option_user', ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 10,),
          const Text('Bee Haak', style: 
          TextStyle(
            fontSize: 50,
            fontFamily: 'ROBOTO',
          ),),
          const SizedBox(height: 10,),
          SizedBox(
            width: 350,
            height: 40,
            child: TextField(
              controller: search,
              decoration: const InputDecoration(
                filled: false,
                // suffixIcon: IconButton(onPressed: , icon: Icon(Icons.search)),
                labelText: 'search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ButtonBar(
            children: <Widget>[
              TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    search.clear();
                  }
                ),
              TextButton(
                  child: const Text('search'),
                  onPressed: (){
                    Navigator.restorablePushNamedAndRemoveUntil(context, '', (route) => false);
                  },
                )
            ],
          ),
          const SizedBox(height: 10,),
          const Expanded(
            child: ProductListView(),
          ),
        ],
      )
    );
  }
}
