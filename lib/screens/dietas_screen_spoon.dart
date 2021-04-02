import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitmodeco_navbar/widgets/circular_clipper.dart';

class DietaScreen extends StatefulWidget {
  @override
  _DietaScreenState createState() => _DietaScreenState();
}

class _DietaScreenState extends State<DietaScreen> {
  final String image = "assets/images/logo_solo.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              new Container(
                height: 450.0,
                //IOS Y ANDROID.
                transform: defaultTargetPlatform == TargetPlatform.iOS
                    ? Matrix4.translationValues(0.0, -45.0, 0.0)
                    : Matrix4.translationValues(0.0, -25.0, 0.0),
                child: new Hero(
                  tag: "Tipos de dieta",
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: AssetImage(image),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RawMaterialButton(
                    padding: EdgeInsets.all(10.0),
                    elevation: 12.0,
                    onPressed: () => Navigator.pop(context),
                    shape: CircleBorder(),
                    fillColor: Colors.redAccent,
                    child: Icon(
                      Icons.arrow_back,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          //
          //
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Tipos de dieta",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15.0),
                Text(
                  "Las dietas mencionadas a continuación las puedes utilizar como filtro en la base de datos de 380.000 recetas.",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 90.0),
                Text(
                  "Sin gluten",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "(Gluten free)",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Icon(
                  FontAwesomeIcons.breadSlice,
                  color: Colors.black87,
                  size: 25.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  "Eliminar el gluten significa evitar el trigo, la cebada, el centeno y otros granos y alimentos que contienen gluten hechos con ellos (o que pueden haber sido contaminados de forma cruzada).",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 70.0),
                Text(
                  "Cetogénica",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "(Ketogenic)",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Icon(
                  FontAwesomeIcons.bacon,
                  color: Colors.black87,
                  size: 25.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  "La dieta ceto se basa más en la proporción de grasas, proteínas y carbohidratos, es una dieta con ingredientes específicos. En términos generales, los alimentos ricos en grasas y ricos en proteínas son aceptables y los alimentos ricos en carbohidratos no.",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 70.0),
                Text(
                  "Vegetariana",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "(Vegetarian)",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Icon(
                  FontAwesomeIcons.seedling,
                  color: Colors.black87,
                  size: 25.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  "Ningún ingrediente puede contener carne o subproductos cárnicos, como huesos o gelatina.",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 70.0),
                Text(
                  "Lacto vegetariana",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "(Lacto-Vegetarian)",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Icon(
                  FontAwesomeIcons.glassWhiskey,
                  color: Colors.black87,
                  size: 25.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  "Todos los ingredientes deben ser vegetarianos y ninguno de los ingredientes puede ser o contener huevo.",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 70.0),
                Text(
                  "Ovo-Vegetariana",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "(Ovo-Vegetarian)",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Icon(
                  FontAwesomeIcons.egg,
                  color: Colors.black87,
                  size: 25.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  "Todos los ingredientes deben ser vegetarianos y ninguno de los ingredientes puede ser o contener lácteos.",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 70.0),
                Text(
                  "Vegana",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "(Vegan)",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Icon(
                  FontAwesomeIcons.seedling,
                  color: Colors.black87,
                  size: 25.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  "Ningún ingrediente puede contener carne o subproductos cárnicos, como huesos o gelatina, ni pueden contener huevos, lácteos o miel.",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 70.0),
                Text(
                  "Pescetariana",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "(Pescetarian)",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Icon(
                  FontAwesomeIcons.fish,
                  color: Colors.black87,
                  size: 25.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  "Todo está permitido, excepto la carne y los subproductos cárnicos: algunos pescetarios comen huevos y productos lácteos, otros no.",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 70.0),
                Text(
                  "Paleo",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "(Paleo)",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Icon(
                  FontAwesomeIcons.drumstickBite,
                  color: Colors.black87,
                  size: 25.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  "Los ingredientes permitidos incluyen carne (especialmente alimentada con pasto), pescado, huevos, verduras, algunos aceites (por ejemplo, aceite de coco y de oliva) y, en pequeñas cantidades, frutas, nueces y batatas. También se permite miel y jarabe de arce (popular en los postres de Paleo, pero los seguidores estrictos de Paleo pueden estar en desacuerdo). Los ingredientes no permitidos incluyen legumbres (por ejemplo, frijoles y lentejas), granos, lácteos, azúcar refinada y alimentos procesados.",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 70.0),
                Text(
                  "Primal",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "(Primal)",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Icon(
                  FontAwesomeIcons.cheese,
                  color: Colors.black87,
                  size: 25.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  "Muy similar a Paleo, excepto que se permiten lácteos: leche cruda y entera, mantequilla, manteca, etc.",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 70.0),
                Text(
                  "Whole30",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "(Whole30)",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Icon(
                  FontAwesomeIcons.calendarAlt,
                  color: Colors.black87,
                  size: 25.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  "Los ingredientes permitidos incluyen carne, pescado / mariscos, huevos, verduras, fruta fresca, aceite de coco, aceite de oliva, pequeñas cantidades de frutos secos y nueces / semillas.\nLos ingredientes no permitidos incluyen edulcorantes añadidos (naturales y artificiales, excepto pequeñas cantidades de jugo de fruta), lácteos (excepto mantequilla clarificada o manteca), alcohol, granos, legumbres (excepto judías verdes, guisantes de azúcar y guisantes de nieve) y aditivos alimentarios. , como carragenano, MSG y sulfitos.",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 100.0),
                Center(
                  child: Text(
                    "¿Necesitas más?",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Icon(
                  FontAwesomeIcons.medal,
                  color: Colors.black87,
                  size: 25.0,
                ),
                SizedBox(height: 30.0),
                Text(
                  "En Nuestra página web puedes obtener tu menú mensual personalizado por:",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 25.0),
                Text(
                  "- Tipo de dieta.\n\n- Calorias diarias (según tus necesidades).\n\n- Alergias.\n\n- Ingredientes que te disgustan.\n\nY muchas más opciones que te permitirán comer saludablemente y disfrutarlo.",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 80.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Regresar",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                    ),
                    Icon(
                      FontAwesomeIcons.arrowAltCircleLeft,
                      color: Colors.white,
                    )
                  ],
                ),
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ],
          ),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
