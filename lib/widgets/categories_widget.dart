import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('categories').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
                height: Get.height / 5,
                child: const Center(child: CupertinoActivityIndicator()));
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("Category not Found"),
            );
          }
          if (snapshot.data != null) {
            return SizedBox(
              height: Get.height / 6,
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                            child: const FillImageCard(
                          width: 200,
                          heightImage: 140,
                          imageProvider:
                              AssetImage('assets/goodpeople/abc.png'),
                          title: Text('Category'),
                          description: Text('data'),
                        )),
                      )
                    ]);
                  }),
            );
          }
          return Container();
        });
  }
}
