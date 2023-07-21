import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realview_book_app/features/authors/data/repositories/author_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:realview_book_app/features/authors/domain/author_model.dart';
part 'author_search_state.dart';

class AuthorSearchCubit extends Cubit<AuthorSearchState> {
  AuthorSearchCubit(this.authorRepository) : super(AuthorSearchInitial());

  AuthorRepository authorRepository;

  void searchAuthors(String query) {
    emit(AuthorSearchLoading());
    authorRepository.searchAuthors(query).then((docs) {
      final authors = docs.map((e) => Author.fromDataModel(e)).toList();
      emit(AuthorSearchSuccess(authors));
    }).catchError((error) {
      emit(const AuthorSearchError('Oops, Something went wrong'));
    });
  }
}
