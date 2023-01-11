import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/colorPicker.dart';

part 'color_picker_event.dart';
part 'color_picker_state.dart';

class ColorPickerBloc extends Bloc<ColorPickerEvent, ColorPickerState> {
  ColorPickerBloc() : super(ColorPickerInitial()) {
    on<LoadColorPickerEvent>((event, emit) {
      emit(ColorPickerLoaded());

    });

    on<BottomPressedEvent>((event, emit) {
      final state = this.state as ColorPickerLoaded;
      final listeCouleur = [...state.listeCouleur];
      final indexTop = [...state.indexTop];

      int indexselected = indexTop.indexWhere((element) => element == -1);
      indexTop[indexselected] = event.indexcolor;
      print("ddd" + event.indexcolor.toString());

      listeCouleur[event.indexcolor] = ColorPicker(
          couleur: listeCouleur[event.indexcolor].couleur, statutcouleur: false);
      emit(ColorPickerLoaded(listeCouleur: listeCouleur, indexTop: indexTop));
      print(indexTop);

    });

    on<UpPressedEvent>((event, emit) {
      final state = this.state as ColorPickerLoaded;
      final listeCouleur = [...state.listeCouleur];
      final indexTop = [...state.indexTop];
      indexTop[event.indexlistup] = -1;
      listeCouleur[event.indexvaluecolor] = ColorPicker(
          couleur: listeCouleur[event.indexvaluecolor].couleur, statutcouleur: true);
      emit(ColorPickerLoaded(listeCouleur: listeCouleur, indexTop: indexTop));
      print('aas');
    });
  }
}


