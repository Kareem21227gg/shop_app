import 'package:Shop/app/models/cloud/firebase_cloud.dart';
import 'package:Shop/app/models/product/base_product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Shop/app/view/sub_home/controller.dart';

class SupHome extends StatefulWidget {
  @override
  _SupHomeState createState() => _SupHomeState();
}

class _SupHomeState extends State<SupHome> {
  FireBaseCloud cloud = FireBaseCloud();
  Controller controller = Controller();

  @override
    void dispose() {

      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    return ListView(
      

      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            elevation: 3,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Row(
                  children: [
                    Text(
                      "NEW TREND",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 24,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: ExactAssetImage(
                                "lib/utillities/images/home_first.png"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: GridView.builder(
                itemCount: controller.models.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: ExactAssetImage(
                                    controller.models[index].imagePath),
                              ),
                            ),
                          ),
                          Text(
                            controller.models[index].title,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            controller.models[index].subTitle,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
        Card(
          child: Column(
            children: [
              Text("test view product"),
              FutureBuilder(
                future: cloud.readLastProduct(),
                builder:
                    (BuildContext context, AsyncSnapshot<BaseProduct> snap) {
                  if (snap.data != null) {

                    return Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Image.network(
                            snap.data.imageUrl,
                            loadingBuilder: (context, Widget child,
                                ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes
                                      : null,
                                ),
                              );

                            },
                          ),
                        ),
                        Text(
                          "title : ${snap.data.title}",
                          style: GoogleFonts.playfairDisplay(),
                        ),
                        Text("describtion : ${snap.data.description}"),
                        Text(
                          "price : ${snap.data.price.toString()}\$",
                          style: TextStyle(color: Colors.green),
                        )
                      ],
                    );
                  }
                  return Text("there is no poduct in the shop :(");
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
