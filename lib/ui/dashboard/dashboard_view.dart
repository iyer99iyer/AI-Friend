import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_viewmodel.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('AI Friend'),
            actions: [
              IconButton(onPressed: (){
                model.signOut();
              }, icon: Icon(Icons.logout))
            ],
          ),
            body: ListView.builder(
                clipBehavior: Clip.hardEdge,
                shrinkWrap: true,
                itemCount: model.getConversationTiles.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: ()=>model.navigateToConversationPage(model.getConversationTiles[index].categoryName),
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                            // backgroundColor: Color(0xFF000000)
                          child: model.getConversationTiles[index].categoryIcon,
                          ),
                        title: Text(model.getConversationTiles[index].categoryName),
                        subtitle: Text(model.getConversationTiles[index].lastConversation),
                        trailing: Text(model.getConversationTiles[index].lastConversationDateTime.minute.toString()),
                      ),
                    ),
                  );
                }),
          bottomNavigationBar: GestureDetector(
            onTap: ()=>model.navigateToNewConversationPage(),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                gradient:LinearGradient(
                  colors: [Colors.blue,
                    Colors.purple],
                ),
              ),
              child: Center(child: Text('Start a new Conversation ...',style: GoogleFonts.roboto(fontSize: 18,color: Colors.white),)),
            ),
          ),
        ),
        viewModelBuilder: () => DashboardViewModel());
  }
}
