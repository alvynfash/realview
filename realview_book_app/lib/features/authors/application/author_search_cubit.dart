import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview_book_app/features/authors/data/repositories/author_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:realview_book_app/features/authors/domain/author_model.dart';
part 'author_search_state.dart';

class AuthorSearchCubit extends Cubit<AuthorSearchState> {
  AuthorSearchCubit(this.authorRepository) : super(AuthorSearchInitial());

  AuthorRepository authorRepository;

  /// The searchAuthors function is used to search for authors based on a given query.
  /// It returns a list of authors that match the query ordered by the number of works they have.
  ///
  /// Args:
  ///   query (String): The query parameter is a string that represents the search query for authors. It
  /// is used to search for authors based on specific criteria or keywords.
  void searchAuthors(String query) {
    emit(AuthorSearchLoading());
    authorRepository.searchAuthors(query).then((docs) {
      final authors = docs.map((e) => Author.fromDataModel(e)).toList()
        ..sort(
          (a, b) => b.workCount.compareTo(a.workCount),
        );
      emit(AuthorSearchSuccess(authors));
    }).catchError((error) {
      emit(const AuthorSearchError('Oops, Something went wrong'));
    });
  }
}
