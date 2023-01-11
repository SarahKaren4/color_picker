part of 'color_picker_bloc.dart';

abstract class ColorPickerState extends Equatable {
  const ColorPickerState();
}

class ColorPickerInitial extends ColorPickerState {
  @override
  List<Object> get props => [];
}

class ColorPickerLoaded extends ColorPickerState {
  final List<ColorPicker> listeCouleur;
  final List<int> indexTop;

  ColorPickerLoaded(
      {this.listeCouleur = const [
        ColorPicker(
            couleur: Color.fromARGB(255, 249, 3, 85), statutcouleur: true),
        ColorPicker(
            couleur: Color.fromARGB(255, 208, 75, 168), statutcouleur: true),
        ColorPicker(
            couleur: Color.fromARGB(255, 175, 52, 171), statutcouleur: true),
        ColorPicker(
            couleur: Color.fromARGB(255, 237, 214, 41), statutcouleur: true),
        ColorPicker(couleur: Color(0xFF66DABE), statutcouleur: true),
        ColorPicker(couleur: Color(0xFF038C7E), statutcouleur: true),
        ColorPicker(couleur: Color(0xFF47B24A), statutcouleur: true),
      ],
      this.indexTop = const [-1, -1, -1]});

  @override
  List<Object> get props => [listeCouleur, indexTop];
}
