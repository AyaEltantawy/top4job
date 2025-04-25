import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'messeges_cubit.dart';
import 'messeges_state.dart';

class MessegesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MessegesCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<MessegesCubit>(context);

    return Container();
  }
}


