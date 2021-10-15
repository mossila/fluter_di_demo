import 'package:di_demo/scene/counter_page/bloc/count_change_bloc.dart';
import 'package:di_demo/inject/inject.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'counter_page.dart';

class CounterPageMain extends StatelessWidget {
  const CounterPageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const counterPage = CounterPage();
    return Provider<CounterBloc>(
      create: (context) => getIt<CounterBloc>(),
      dispose:(context, bloc) => bloc.dispose(),
      child: counterPage,
    );
  }
}