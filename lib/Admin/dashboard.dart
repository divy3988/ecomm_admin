import 'package:ecomm_admin/Admin/addProduct.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                        10,
                      )),
                    ),
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Addproduct();
                    });
              });
            },
            child: Icon(Icons.add),
          ),
          backgroundColor: Color.fromARGB(255, 238, 237, 234),
          body: Row(children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              color: Colors.black87,
              child: Column(
                children: [
                  const DrawerHeader(
                    child: Center(
                      child: Text(
                        "Admin's Space",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),
                  ),
                  List_Tile(Icons.shopping_bag, 'Order\'s', () {}),
                  List_Tile(
                      Icons.category_outlined, "Product Categories", () {}),
                  List_Tile(
                      Icons.data_exploration_sharp, 'Order Analytic\'s', () {}),
                  List_Tile(Icons.monetization_on_outlined,
                      'Revenue Analytic\'s', () {}),
                  List_Tile(Icons.logout, 'Log Out', () {}),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              color: Colors.black87,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Products",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(
                            10,
                          ),
                          color: const Color.fromARGB(255, 230, 229, 229),
                          child: Center(
                            child: Text(
                              "P${index + 1}",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  GestureDetector List_Tile(IconData icon, String title, VoidCallback onpress) {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
