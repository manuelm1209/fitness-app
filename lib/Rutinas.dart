import 'package:fitmodeco_navbar/widgets/content_scroll.dart';
import 'package:flutter/material.dart';
import 'package:fitmodeco_navbar/widgets/circular_clipper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//abrir navegador con url.
import 'package:url_launcher/url_launcher.dart';

//Prueba ios android.
import 'package:flutter/foundation.dart';

class Rutinas extends StatefulWidget {
  _RutinasState createState() => _RutinasState();
}

class _RutinasState extends State<Rutinas> {
  //creamos un arreglo de datos imagenes y nombre ejercicio
  List<Container> listamos = List();

  var arreglox = [
    {
      "nombre": "Abducción de cadera",
      "imagen": "abduccion_de_cadera",
      "deporte":
          "Músculos activos:\nTensor de la fascia lata, Piramidal, Glúteo medio, Glúteo menor.\n\nUn ejercicio efectivo para trabajar los músculos abductores de la cadera que separan las piernas. Además refuerza los glúteos medios. Puede practicarse en casa, con ayuda de un balón, o en el gimnasio.",
      "subtitulo": "Pierna y Glúteo",
    },
    {
      "nombre": "Press de pierna sentado",
      "imagen": "press_de_pierna_sentado",
      "deporte":
          "Músculos activos:\nIsquiotibial y cuadriceps.\n\nEsta prensa nos permite permanecer sentados durante todo el ejercicio, lo que nos ayuda a desarrollar mucha más fuerza. Los músculos de las piernas no se verán tan tocados como en el resto, pues el trabajo se centrara en la zona isquiotibial y del cuádriceps, descartando casi por completo a los gemelos y glúteos.",
      "subtitulo": "Pierna y Glúteo",
    },
    {
      "nombre": "Single Press de pierna sentado",
      "imagen": "single_press_de_pierna_sentado",
      "deporte":
          "Músculos activos:\nIsquiotibial y cuadriceps.\n\nUna variación del press de pierna sentado que te permite aumentar el grado de dificultad del ejercicio trabajando cada pierna por separado.",
      "subtitulo": "Pierna y Glúteo",
    },
    {
      "nombre": "Femoral sentado",
      "imagen": "femoral_sentado",
      "deporte":
          "Músculos activos:\nSemitendinoso, semimembranoso y bíceps femoral.\n\nUna de las mejores opciones a la hora de trabajar nuestros cuádriceps y corregir descompensaciones entre una pierna y otra. Siempre vamos a tener un lado más desarrollado que el otro, por lo que realizar trabajo de compensación unilateral nos vendrá bien.",
      "subtitulo": "Pierna y Glúteo",
    },
    {
      "nombre": "Femoral tumbado",
      "imagen": "femoral_tumbado",
      "deporte":
          "Músculos activos:\nSemitendinoso, semimembranoso y bíceps femoral.\n\nUna buena opción para trabajar los músculos isquiotibiales. Mejora los movimientos de carrera y patada. Puede hacerse en casa usando pesas en los tobillos",
      "subtitulo": "Pierna y Glúteo",
    },
    {
      "nombre": "Femoral tumbado (una)",
      "imagen": "femoral_tumbado_una_pierna",
      "deporte":
          "Músculos activos:\nSemitendinoso, semimembranoso y bíceps femoral.\n\nUna buena opción para trabajar los músculos isquiotibiales. Mejora los movimientos de carrera y patada. Puede hacerse en casa usando pesas en los tobillos",
      "subtitulo": "Pierna y Glúteo",
    },
    {
      "nombre": "Extensión de piernas",
      "imagen": "extension_de_piernas",
      "deporte":
          "Músculos activos:\nVasto intermedio, vasto lateral, recto femoral y vasto medial.\n\nUn ejercicio popular para trabajar el grupo muscular de los cruadríceps. Estira las piernas hasta que estén completamente extendidas. Baja lentamente manteniendo siempre le torso erguido. Trabaja cada pierna de manera independiente para aumentar la dificultad del ejercicio.",
      "subtitulo": "Pierna y Glúteo",
    },
    {
      "nombre": "Extensión de piernas (una)",
      "imagen": "extension_de_piernas_una_pierna",
      "deporte":
          "Músculos activos:\nVasto intermedio, vasto lateral, recto femoral y vasto medial.\n\nUn ejercicio popular para trabajar el grupo muscular de los cruadríceps. Estira las piernas hasta que estén completamente extendidas. Baja lentamente manteniendo siempre le torso erguido. Trabaja cada pierna de manera independiente para aumentar la dificultad del ejercicio.",
      "subtitulo": "Pierna y Glúteo",
    },
    {
      "nombre": "Glute",
      "imagen": "glute",
      "deporte":
          "Músculos activos:\nGluteos.\n\nLa esencia de este ejercicio es la extensión de cadera o “patada hacia atrás”.Lo importante es que empujes concentrando el esfuerzo en el glúteo y siempre contrayendo la zona del centro del cuerpo. Empuja y estira la pierna, regresa lentamente y de forma controlada.",
      "subtitulo": "Glúteo",
    },
    {
      "nombre": "Extensión de pantorrilla",
      "imagen": "extension_de_pantorrilla",
      "deporte":
          "Músculos activos:\nPantorillas.\n\nLa función principal de las pantorrillas es la elevación del talón, empuje con el pie, levantarse sobre las puntas, caminar, correr, entre otros. Estos músculos son susceptibles a calambres o lesiones especialmente en el tobillo por lo cual se deben entrenar para fortalecerlas y evitar este tipo de problemas.",
      "subtitulo": "Pierna",
    },
    {
      "nombre": "Extensión lumbar",
      "imagen": "extension_lumbar",
      "deporte":
          "Músculos activos:\nLumbares y abdominales.\n\nFortalece tu zona lumbar, evita lesiones y dolencias y mejora tu postura con este sencillo ejercicio. Verifica que tus escápulas estén en el rodilla antes de iniciar el movimiento.",
      "subtitulo": "Abdomen y lumbar",
    },
    {
      "nombre": "Press de pecho sentado",
      "imagen": "press_de_pecho_sentado",
      "deporte":
          "Músculos activos:\nPectoral mayor superior e inferior, tríceps braquial, deltoides anterior.\n\nUna buena opción para el press de banca. Ideal para aquellos que están empezando su entrenamiento, ya que, con esta máquina es más fácil no cometer errores de postura y podremos jugar con las cargas de peso de manera mucho más segura.",
      "subtitulo": "Pectoral",
    },
    {
      "nombre": "Mariposa pectoral",
      "imagen": "mariposa_pectoral",
      "deporte":
          "Músculos activos:\nPectoral Mayor.\n\nEs cierto que la forma de los pectorales depende directamente de la genética de cada persona, pero si eliges los ejercicios adecuados seguro que podrás dar el aspecto que deseas en esta zona, siempre que adaptes correctamente el peso a tus capacidades físicas.",
      "subtitulo": "Pecho",
    },
    {
      "nombre": "Estirar hacia abajo",
      "imagen": "estirar_hacia_abajo",
      "deporte":
          "Músculos activos:\nDorsales, parte baja del trapecio y romboides.\n\nEntrena los músculos de la parte superior de la espalda, es decir: los dorsales, la parte baja del trapecio y los romboides. Estos músculos son los encargados de bajar los hombros y de que puedas mover los brazos hacia abajo y hacia atrás, como cuando haces dominadas.",
      "subtitulo": "Espalda",
    },
    {
      "nombre": "Estirar hacia abajo (inter)",
      "imagen": "estirar_hacia_abajo_intercalado",
      "deporte":
          "Músculos activos:\nDorsales, parte baja del trapecio y romboides.\n\nEntrena los músculos de la parte superior de la espalda, es decir: los dorsales, la parte baja del trapecio y los romboides. Estos músculos son los encargados de bajar los hombros y de que puedas mover los brazos hacia abajo y hacia atrás, como cuando haces dominadas.",
      "subtitulo": "Espalda",
    },
    {
      "nombre": "Deltoide posterior",
      "imagen": "deltoide_posterior",
      "deporte":
          "Músculos activos:\nTrapecio, infraespino, redondo, romboides, deltoides, tríceps, supinador, braquial, los músculos de la muñeca y muchos otros.\n\nDesarrolla buena parte de la musculatura de la espalda, protegiendo el área del cuello de posibles lesiones.",
      "subtitulo": "Espalda",
    },
  ];

  _listado() async {
    for (var i = 0; i < arreglox.length; i++) {
      final arregloxyz = arreglox[i];
      final String imagen = arregloxyz["imagen"];

      listamos.add(new Container(
        //padding: new EdgeInsets.all(10.0),
        //prueba de padding.
        padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        child: new Card(
          child: new Column(
            children: <Widget>[
              new Hero(
                tag: arregloxyz['nombre'],
                child: new Material(
                  child: new InkWell(
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Detalle(
                          nombre: arregloxyz['nombre'],
                          imagen: imagen,
                          subtitulo: arregloxyz['subtitulo'],
                          deporte: arregloxyz['deporte']),
                    )),
                    child: Container(
                      child: new Image.asset("assets/rutinas/$imagen.jpg",
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
              ),
              LimitedBox(
                maxHeight: 50,
                child: new Text(
                  arregloxyz['nombre'],
                  textAlign: TextAlign.center,
                  style: new TextStyle(fontSize: 20.0),
                ),
              ),
              LimitedBox(
                maxHeight: 25,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                  child: new Text(
                    arregloxyz['subtitulo'],
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    _listado();
    super.initState();
  }

  final String logoBar = "assets/images/logo_completo_blanco.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Center(
          child: Image(
            image: AssetImage(
              logoBar,
            ),
            height: 90.0,
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: new GridView.count(
        crossAxisCount: 2, //numero de columas de la primera pagina pruebn con 1
        mainAxisSpacing: 0.1, //espacio entre card
        childAspectRatio: 0.700, //espacio largo de cada card
        children: listamos,
      ),
    );
  }
}

//creamos el metodo detalle
//este se usa cuando pulsamos para ver segunda pantalla la descripcion del ejercicio
class Detalle extends StatelessWidget {
  Detalle(
      {this.nombre,
      this.imagen,
      this.deporte,
      this.subtitulo,
      this.screenshots});
  final String nombre;
  final String imagen;
  final String deporte;
  final String subtitulo;
  final String logoBar = "assets/images/logo_completo_blanco.png";
  final List<String> screenshots;

  //Abrir navegador con url.
  Future<void> _launchInBrowser(String url2) async {
    if (await canLaunch(url2)) {
      await launch(
        url2,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'No se pudo abrir el navegador :(';
    }
  }

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
                  tag: nombre,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: AssetImage("assets/rutinas/$imagen.jpg"),
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
              Positioned.fill(
                bottom: 0.0,
                child: defaultTargetPlatform == TargetPlatform.iOS
                    ? SizedBox(height: 1.0)
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: RawMaterialButton(
                          padding: EdgeInsets.all(10.0),
                          elevation: 12.0,
                          onPressed: () {
                            _launchInBrowser(
                                "https://www.thefitmode.com/planes/");
                          },
                          shape: CircleBorder(),
                          fillColor: Colors.white,
                          child: Icon(
                            Icons.play_arrow,
                            size: 60.0,
                            color: Colors.red,
                          ),
                        ),
                      ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  nombre,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Text(
                  subtitulo,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 35.0),
                Container(
                  child: Text(
                    deporte,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
              ],
            ),
          ),
          ContentScroll(
            images: imagen,
            title: 'Más información:',
            imageHeight: 300.0,
            imageWidth: 200.0,
          ),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
