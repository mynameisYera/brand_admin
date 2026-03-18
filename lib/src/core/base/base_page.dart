import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BasePage<T extends StatefulWidget, B extends Bloc<E, S>, S, E> extends State<T> {
  late final B bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<B>();
    _initializeBloc();
  }

  @override
  void dispose() {
    _disposeBloc();
    super.dispose();
  }

  void _initializeBloc() {
    if (!bloc.isClosed) {
      bloc.add(initialEvent);
    }
  }

  void _disposeBloc() {
    if (!bloc.isClosed) {
      bloc.close();
    }
  }

  E get initialEvent;
} 