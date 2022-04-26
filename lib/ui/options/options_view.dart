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
            body: GridView.builder(
                shrinkWrap: true,
                itemCount: model.options.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                ),
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){},
                    child: Container(
                      margin: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                            borderRadius: BorderRadius.circular(80)
                      ),
                      child: Container(
                        margin: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(70)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(model.options[index].categoryIcon,size: 60,),
                            Text(model.options[index].categoryName,style: GoogleFonts.roboto(fontSize: 18),),
                          ],
                        ),
                      ),
                    )
                  );
                }),
        ),
        viewModelBuilder: () => OptionsViewModel());
  }
}