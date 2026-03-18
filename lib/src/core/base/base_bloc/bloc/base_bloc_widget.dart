import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

import '../context/context_activity_bloc.dart';
import 'base_bloc.dart';

typedef BaseBlocWidgetBuilder<B, S> = Widget Function(
  BuildContext context,
  S state,
  B bloc,
);

class BaseBlocWidget<B extends BaseBloc<E, S>, E, S> extends StatefulWidget {
  BaseBlocWidget({
    required this.bloc,
    required this.builder,
    this.starterEvent,
    this.listener,
    this.buildWhen,
    this.listenWhen,
    super.key,
  });

  final B bloc;
  final E? starterEvent;
  final BaseBlocWidgetBuilder<B, S> builder;
  final BlocWidgetListener<S>? listener;
  final BlocBuilderCondition<S>? buildWhen;
  final BlocBuilderCondition<S>? listenWhen;

  @override
  State<BaseBlocWidget<B, E, S>> createState() => _BaseBlocWidgetState<B, E, S>();
}

class _BaseBlocWidgetState<B extends BaseBloc<E, S>, E, S> extends State<BaseBlocWidget<B, E, S>> {
  late final ContextActivityBloc _contextActivity;

  @override
  void initState() {
    super.initState();
    _contextActivity = ContextActivityBloc();
  }

  @override
  void dispose() {
    _contextActivity.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <SingleChildWidget>[
        BlocProvider(
          create: (BuildContext context) => _contextActivity,
        ),
        BlocProvider(
          create: (BuildContext context) {
            if (widget.starterEvent != null) {
              return widget.bloc..add(widget.starterEvent as E);
            }
            return widget.bloc;
          },
        ),
      ],
      child: BlocListener<ContextActivityBloc, ContextActivityState>(
        listener: (BuildContext context, ContextActivityState state) =>
            state.contextActivityHandler != null
                ? state.contextActivityHandler!(context)
                : null,
        child: BlocConsumer<B, S>(
          listener: widget.listener ?? (BuildContext context, s) {},
          builder: (BuildContext context, s) =>
              widget.builder(context, s, context.read<B>()),
          buildWhen: widget.buildWhen,
          listenWhen: widget.listenWhen,
        ),
      ),
    );
  }
}
