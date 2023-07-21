import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview_book_app/features/authors/application/author_search_cubit.dart';
import 'package:realview_book_app/features/authors/data/data_sources/remote_data_source.dart';
import 'package:realview_book_app/features/authors/data/repositories/author_repository.dart';
import 'package:realview_book_app/features/authors/presentation/widgets/author_list.dart';
import 'package:realview_book_app/features/authors/presentation/widgets/data_loading.dart';
import 'package:realview_book_app/features/authors/presentation/widgets/error_message.dart';

class AuthorSearchScreen extends StatelessWidget {
  const AuthorSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorSearchCubit(
        AuthorRepository(
          RemoteDataSource(),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Author Finder'),
        ),
        body: BlocConsumer<AuthorSearchCubit, AuthorSearchState>(
          listener: (context, state) {
            // TODO: listen for error state and possible show toast here.
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onSubmitted: (value) {
                        BlocProvider.of<AuthorSearchCubit>(context)
                            .searchAuthors(value);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Search for authors',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<AuthorSearchCubit, AuthorSearchState>(
                      builder: (context, state) {
                        if (state is AuthorSearchLoading) {
                          return const DataLoading();
                        }

                        if (state is AuthorSearchSuccess) {
                          return AuthorList(authors: state.authors);
                        }

                        if (state is AuthorSearchError) {
                          return Errormessage(state.message);
                        }

                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
