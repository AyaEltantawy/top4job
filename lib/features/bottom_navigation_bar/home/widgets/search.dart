import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home_cubit.dart';
import '../home_state.dart';

class SearchPage extends StatelessWidget {
  final String searchTerm;


  const SearchPage({required this.searchTerm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results for "$searchTerm"'),
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SearchEmpty) {
            return Center(
              child: Text(
                "Sorry!\nNot found.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          } else if (state is SearchSuccess) {
            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: state.results.length,
              itemBuilder: (context, index) {
                final job = state.results[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(child: Icon(Icons.work)),
                    title: Text(job.title),
                    subtitle: Text(job.company),
                    trailing: Text(job.salary),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("Start searching..."));
          }
        },
      ),
    );
  }
}
