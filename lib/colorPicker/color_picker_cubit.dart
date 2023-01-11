import 'package:color_picker/model/colorPicker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_picker_state.dart';

class ColorPickerCubit extends Cubit<ColorPickerState> {
  ColorPickerCubit() : super(ColorPickerInitial()) {
    ColorPickerLoad();
  }

  void ColorPickerLoad() {
    emit(ColorPickerLoaded());
  }

  void BottomPressed(int indexcolor) {
    final state = this.state as ColorPickerLoaded;
    final listeCouleur = [...state.listeCouleur];
    final indexTop = [...state.indexTop];

    int indexselected = indexTop.indexWhere((element) => element == -1);
    indexTop[indexselected] = indexcolor;
    print("ddd" + indexcolor.toString());

    listeCouleur[indexcolor] = ColorPicker(
        couleur: listeCouleur[indexcolor].couleur, statutcouleur: false);
    emit(ColorPickerLoaded(listeCouleur: listeCouleur, indexTop: indexTop));
    print(indexTop);
  }

  void UpPressed(int indexvaluecolor, int indexlistup) {
    final state = this.state as ColorPickerLoaded;
    final listeCouleur = [...state.listeCouleur];
    final indexTop = [...state.indexTop];
    indexTop[indexlistup] = -1;
    listeCouleur[indexvaluecolor] = ColorPicker(
        couleur: listeCouleur[indexvaluecolor].couleur, statutcouleur: true);
    emit(ColorPickerLoaded(listeCouleur: listeCouleur, indexTop: indexTop));
    print('aas');
  }
}
