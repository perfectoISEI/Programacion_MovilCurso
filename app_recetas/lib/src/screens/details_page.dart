import 'package:app_recetas/src/components/tab_ingredients_widget.dart';
import 'package:app_recetas/src/components/tab_preparaction.dart';
import 'package:app_recetas/src/connection/server_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modulo1_fake_backend/models.dart';

class DetailsPage extends StatefulWidget {
  final Recipe recipe;
  final ServerController serverController;

  DetailsPage({this.recipe, this.serverController, key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text(widget.recipe.name),
                expandedHeight: 320,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(widget.recipe.photo)),
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
                pinned: true,
                bottom: TabBar(
                  labelColor: Colors.white,
                  indicatorWeight: 4,
                  tabs: <Widget>[
                    Tab(
                        child: Text(
                      "Ingredientes",
                      style: TextStyle(fontSize: 18),
                    )),
                    Tab(
                        child: Text(
                      "Preparación",
                      style: TextStyle(fontSize: 18),
                    ))
                  ],
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.help),
                    onPressed: () {},
                  )
                ],
              )
            ];
          },
          body: TabBarView(
            children: <Widget>[
              TabIngredientsWidget(
                recipe: widget.recipe,
              ),
              TabPreparationWidget(
                recipe: widget.recipe,
              )
            ],
          ),
        ),
      ),
    );
  }
}
