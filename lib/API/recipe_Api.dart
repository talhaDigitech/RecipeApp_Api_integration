import 'package:http/http.dart' as http;
import 'package:recipe_api_integration/Model/RecipeModel.dart';
recipesItem() async{
  var response = await http.get(Uri.parse("https://dummyjson.com/recipes"));
  try{
    if(response.statusCode == 200){
    var data = recipesModelFromJson(response.body);
    return data.recipes;
  }else{
    print("Error occur");
  }
  }catch(e){
    print(e);
  }
}