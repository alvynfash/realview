/// The above code defines different states for an author search feature, including initial, loading,
/// success, and error states.
part of 'author_search_cubit.dart';

abstract class AuthorSearchState extends Equatable {
  const AuthorSearchState();

  @override
  List<Object> get props => [];
}

class AuthorSearchInitial extends AuthorSearchState {}

class AuthorSearchLoading extends AuthorSearchState {}

class AuthorSearchSuccess extends AuthorSearchState {
  final List<Author> authors;

  const AuthorSearchSuccess(this.authors);

  @override
  List<Object> get props => [authors];
}

class AuthorSearchError extends AuthorSearchState {
  final String message;

  const AuthorSearchError(this.message);

  @override
  List<Object> get props => [message];
}
