import 'package:flutter/material.dart';
import 'package:recipe_api_integration/API/recipe_Api.dart';
import 'package:recipe_api_integration/Model/RecipeModel.dart';
import 'package:recipe_api_integration/Screens/recipe_detailScreen.dart';

class FoodListScreen extends StatefulWidget {
  const FoodListScreen({super.key});

  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {

  List<Recipe> recipesModel = [];

bool isLoading = false;
  myRecipe(){
    isLoading = true;
    recipesItem().then((value){
      setState(() {
        recipesModel = value;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    myRecipe();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recipe App Form Api"),
        ),
      body: isLoading ?
      const Center(child: CircularProgressIndicator(),)
       : ListView.builder(
        itemCount: recipesModel.length,
        itemBuilder: (context,index){
          final recipe = recipesModel[index]; 
          return Padding(
            padding: EdgeInsets.symmetric(horizontal:10,vertical: 10 ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> RecipeDetailscreen(recipe: recipe)));
              },
              child: Stack(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(recipe.image,),
                        fit: BoxFit.fill,
                        ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: Offset(-5,7)
                        )
                      ]
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 45,
                      decoration: const BoxDecoration(
                        color: Colors.black26,
                        
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ) 
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(recipe.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                              ),
                              )
                            ),
                            Icon(Icons.star, color: Colors.yellow,),
                            Text(recipe.rating.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                            ),
                            ),
                            SizedBox(width: 10,),
                             Text(recipe.cookTimeMinutes.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                            ),
                            ),
                             const Text(" min",
                            style: TextStyle(
                              color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                            ),
                            ),
                            SizedBox(width: 10,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            );
        }
        ),
    );
  }
}