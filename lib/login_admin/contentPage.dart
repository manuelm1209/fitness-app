//por medio del menu lateran para navegar a otras paginas.
import 'package:fitmodeco_navbar/pages/admin/show_recipe.dart';
//import 'package:fitmodeco_navbar/pages/maps_page.dart';
import 'package:fitmodeco_navbar/pages/myrecipes//list_my_recipe.dart';
import 'package:fitmodeco_navbar/widgets/home_pageR.dart';

abstract class Content {
  Future<HomePageRecipes> lista();
  Future<ListMyRecipe> myrecipe(String id);
  Future<InicioPage> admin();
}

class ContentPage implements Content {
  Future<HomePageRecipes> lista() async {
    return HomePageRecipes();
  }

//  Future<MapsPage> mapa() async {
//    return MapsPage();
//  }

  Future<InicioPage> admin() async {
    return InicioPage();
  }

  Future<ListMyRecipe> myrecipe(String id) async {
//    print('listados mis recetas $id');
    return ListMyRecipe(
      id: id,
    );
  }
}
