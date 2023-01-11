import 'package:color_picker/colorPicker/color_picker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => ColorPickerCubit()..ColorPickerLoad(),
        child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<ColorPickerCubit, ColorPickerState>(
            builder: (context, state) {
              return state is ColorPickerLoaded
                  ? Column(
                      children: [
                        Container(
                          height: 200,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.indexTop.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (state.indexTop[index] != -1) {
                                      context
                                          .read<ColorPickerCubit>()
                                          .UpPressed(
                                              state.indexTop[index], index);
                                      print(state.indexTop[index]);
                                    } else {
                                      print("Non clickage");
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    color: state.indexTop[index] == -1
                                        ? Colors.grey
                                        : state
                                            .listeCouleur[state.indexTop[index]]
                                            .couleur,
                                    height: 50,
                                    width: 50,
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 350,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 70,
                                      crossAxisSpacing: 30,
                                      mainAxisSpacing: 20),
                              itemCount: 7,
                              itemBuilder: (BuildContext ctx, index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (state.indexTop.contains(-1) & state.listeCouleur[index].statutcouleur) {
                                      context
                                          .read<ColorPickerCubit>()
                                          .BottomPressed(index);
                                      // print("Down" + index.toString());
                                    } else {
                                      print("Non clickage");
                                    }
                                  },
                                  child: Container(
                                    height: 100,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: state.listeCouleur[index]
                                                  .statutcouleur ==
                                              true
                                          ? state.listeCouleur[index].couleur
                                          : Colors.grey,
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    )
                  : CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
