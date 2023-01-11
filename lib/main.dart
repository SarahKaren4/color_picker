import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocColorPicker/color_picker_bloc.dart';

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
        create: (context) => ColorPickerBloc()..add(LoadColorPickerEvent()),
        child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<ColorPickerBloc, ColorPickerState>(
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
                                      context.read<ColorPickerBloc>().add(
                                          UpPressedEvent(
                                              state.indexTop[index], index));
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
                                    if (state.indexTop.contains(-1) &
                                            state.listeCouleur[index]
                                                .statutcouleur ==
                                        true) {
                                      context
                                          .read<ColorPickerBloc>()
                                          .add(BottomPressedEvent(index));
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
