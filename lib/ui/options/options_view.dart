import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'options_viewmodel.dart';

class OptionsView extends StatelessWidget {
  const OptionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OptionsViewModel>.reactive(
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
          backgroundColor: Color(0xFFDCDCDC),
              body: SafeArea(
                child: Column(
                  children: [
                    // Language
                    Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text('My Language'),
                              Text(
                                'English(EN)',
                                style: GoogleFonts.roboto(
                                    color: Colors.blue, fontSize: 12),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.double_arrow, color: Colors.blue),
                            ],
                          ),
                          Column(
                            children: [
                              Text('I am Language'),
                              Text(
                                'English(EN)',
                                style: GoogleFonts.roboto(
                                    color: Colors.blue, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          // gradient:LinearGradient(
                          //   colors: [Colors.blue,
                          //     Colors.purple],
                          // ),
                        color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    //Categories
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: model.options.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 6,
                              mainAxisSpacing: 2),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () => model.navigateToTopicLearnScreen(model.options[index].categoryName,),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CircleAvatar(
                                              child: Icon(
                                                model.options[index].categoryIcon,
                                                size: 40,
                                              ),
                                              radius: 40,
                                              backgroundColor: Colors.white,
                                            ),
                                          ),
                                          radius: 45),
                                      Text(
                                        model.options[index].categoryName,
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white
                                  ),
                                ));
                          }),
                    ),
                    // Progress Container
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.blue
                        ),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Discovery',
                              style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                            ),
                            Text('0 on 2 topics',
                              style: GoogleFonts.roboto(color: Colors.white60,fontWeight: FontWeight.bold,fontSize: 14),
                            ),
                            Container(
                              width: double.infinity,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                            ),
                            Text('1 topic started',
                                style: GoogleFonts.roboto(color: Colors.white60,fontWeight: FontWeight.bold,fontSize: 14)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => OptionsViewModel());
  }
}
