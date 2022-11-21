import 'package:app_development_competition/helpers/constants.dart';
import 'package:app_development_competition/helpers/data.dart';
import 'package:app_development_competition/screens/product_description_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/themeProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.theme}) : super(key: key);

  final String theme;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedValue = dropDownItems.first;

  ThemeProvider theme = ThemeProvider();

  @override
  Widget build(BuildContext context) {
    theme = Provider.of<ThemeProvider>(context);

    // theme.setTheme(widget.theme);

    return Scaffold(
      appBar: AppBar(
        title: Text("Happy Place"),
        backgroundColor: primaryColor,
        leading: BackButton(
          color: primaryColor,
          onPressed: () {},
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
              size: 30.0,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text(
                        "All Products",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: DropdownButton<String>(
                        value: selectedValue,
                        isExpanded: true,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.black,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            setState(() {
                              selectedValue = value!;
                            });
                            theme.setTheme(value!);
                          });
                        },
                        items: dropDownItems
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  itemCount: data.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var currentData = data.map((e) {
                      if (e["category"] == theme.theme) {
                        return e;
                      }
                    }).toList()[index];
                    if (currentData == null) {
                      return Container();
                    }
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDescriptionScreen(
                                    product: currentData)));
                      },
                      child: Container(
                        // height: 300,
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Image.asset(
                                currentData["image"].toString(),
                                height: 200.0,
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                currentData["title"].toString(),
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                currentData["price"].toString(),
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
