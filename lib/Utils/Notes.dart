class Notes {
  List<Note> _notes;

  Notes.initializeNotes() {
    _notes = List<Note>();
    _notes.add(Note(' Libre de calorías',
        'La porción de consumo habitual aporta menos de 5 kcal.', false));
    _notes.add(Note(
        'Libre en grasa ',
        'Significa que una porción de alimentos aporta menos de 0,5 g de grasa total.',
        false));
    _notes.add(Note(
        'Libre en grasas saturadas o libre de grasas trans',
        'Quiere decir que en una porción del alimento aporta menos de 0,5 g de grasa saturada y menos de 0,2 g de ácidos grasos trans.',
        false));
    _notes.add(Note(
        'Libre en colesterol',
        'Significa que en una porción del alimento aporta menos de 2 mg de colesterol, menos de 2 g de grasa saturada y menos de 0,2 g de grasas trans. ',
        false));
    _notes.add(Note(
        'Libre de azúcar ',
        'Significa que la porción de consumo habitual aporta menos de 0,5 g de azúcar. ',
        false));
    _notes.add(Note(
        'Libre en sodio ',
        'Quiere decir que la porción de consumo habitual aporta menos de 5 mg de sodio.',
        false));
    _notes.add(Note(
        'Reducido',
        'Se emplea esta palabra cuando el producto ha sido modificado y contiene 25% menos de calorías o nutrientes que el alimento de referencia. ',
        false));
    _notes.add(Note(
        'Reducido en calorías ',
        'Quiere decir que el producto contiene 25% menos calorías que el alimento normal.',
        false));
    _notes.add(Note(
        'Reducido en grasas ',
        'Es que el producto contiene 25% menos grasas que el alimento normal. ',
        false));
    _notes.add(Note(
        'Reducido en colesterol',
        'Significa que el producto tiene 25% menos colesterol que el alimento normal.',
        false));
    _notes.add(Note(
        'Bajo en energía',
        'Significa que una porción del alimento aporta menos de 40 kcal.',
        false));
    _notes.add(Note(
        'Bajo en grasas',
        'Significa que una porción del alimento aporta un máximo de 3g de grasa total',
        false));
    _notes.add(Note(
        'Bajo en grasa saturada',
        'Por porción de consumo habitual contiene un máximo de 1 g de grasas saturadas y no más de 15% de las calorías provenientes de grasas saturadas en relación a las calorías totales. ',
        false));
    _notes.add(Note(
        'Bajo en colesterol',
        'Se refiere a que una porción del alimento aporta un máximo de 20mg de colesterol y 2 g de grasa saturada,  0,2 g de grasa trans. ',
        false));
    _notes.add(Note(
        'Bajo en sodio',
        'Significa que una porción del alimento aporta menos de 140mg de sodio. ',
        false));
    _notes.add(Note(
        ' Muy bajo aporte',
        'Específicamente se utiliza para el sodio, y quiere decir que la porción de consumo habitual contiene máximo 35 mg de sodio.',
        false));
    _notes.add(Note(
        'Extramagro',
        'Es específico para carnes, pescados y sus derivados. Significa que por porción de consumo habitual y por cada 100 gramos contiene como máximo 5g de grasa total, igual o menos de 2 g de grasa saturada e igual o menos de 95 mg de colesterol.',
        false));
    _notes.add(Note(
        'Sin azúcar/ Azúcares añadidos',
        'Está permitido sólo si no fue incorporado azúcar o azúcares añadidos. Debe ir acompañado de una frase como “éste alimento no es libre en calorías” cuando los alimentos no lleven el “libre” “bajo” o “reducido” en calorías.',
        false));
    _notes.add(Note(
        'Buena fuente',
        'Buena fuente de vitaminas, minerales, fibra dietética y proteínas, la porción del alimento contiene entre 10 al 19% de la Dosis Diaria de Referencia.',
        false));
    _notes.add(Note(
        'Fortificado',
        'Sólo se podrá usar si el alimento ha sido modificado agregando un 10% o más del Valor Diaria de Referencia del nutriente que se adiciona.',
        false));
  }

  List<Note> get getNotes => _notes;
}

class Note {
  String _title;
  String _noteContent;
  bool _noteRead;

  Note(this._title, this._noteContent, this._noteRead);

  String get getTitle => _title;
  String get getNoteContent => _noteContent;
  bool get getReadState => _noteRead;
  set setReadState(bool readState) => this._noteRead = readState;
}
