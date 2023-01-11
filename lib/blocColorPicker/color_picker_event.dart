part of 'color_picker_bloc.dart';

abstract class ColorPickerEvent extends Equatable {
  const ColorPickerEvent();
}

class LoadColorPickerEvent extends ColorPickerEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class BottomPressedEvent extends  ColorPickerEvent {
  final int indexcolor;
  const BottomPressedEvent(this.indexcolor);

  @override
  // TODO: implement props
  List<Object?> get props => [indexcolor];

}

class UpPressedEvent extends ColorPickerEvent {
 final int indexvaluecolor;
 final  int indexlistup;
 UpPressedEvent(this.indexvaluecolor, this.indexlistup);

  @override
  // TODO: implement props
  List<Object?> get props =>[indexvaluecolor, indexlistup];

}