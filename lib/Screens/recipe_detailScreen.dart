import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:recipe_api_integration/Model/RecipeModel.dart';

class RecipeDetailscreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailscreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.network(recipe.image,
                fit: BoxFit.contain,
                width: size.width,
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top,
                  left:0,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back,color: Colors.white,),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -50,
                  left: 30,
                  right: 30,
                  child: Container(
                    height: 140,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(recipe.name + " ",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      ),
                               Row(
                                 children: [
                                   Text(recipe.mealType[0],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                   Text(" & ",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                   Text(recipe.cuisine,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                 ],
                               ),
        
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 2,
                              blurRadius: 2
                            ),],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)
                            ),
                          ),
                          child: Row(
                            
                            children: [
                              const SizedBox(width: 40,),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(recipe.rating.toString()),
                              const SizedBox(width: 50,),
                              const Icon(
                                Icons.timer,
                                color: Colors.lightBlueAccent,
                              ),
                              Text(recipe.cookTimeMinutes.toString()),
                              const SizedBox(width: 50,),
                              const Icon(
                                Icons.accessibility,
                                color: Colors.greenAccent,
                              ),
                              Text("${recipe.caloriesPerServing} kcl"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ingredients",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,top: 15
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(recipe.ingredients.length,(index){
                        return Text( "- " + recipe.ingredients[index],
                        style: TextStyle(fontSize: 16),
                        );
                      }),
                    ),
                    ),
                    SizedBox(height: 10,),
                    const Text(
                    "Instruction",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,top: 15
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(recipe.instructions.length,(index){
                        return Text( "- " + recipe.instructions[index],
                        style: TextStyle(fontSize: 16),
                        );
                      }),
                    ),
                    ),
                  SizedBox(height: 20,)
                ],
              ),
              )
        
          ],
        ),
      ),
    );
  }
}