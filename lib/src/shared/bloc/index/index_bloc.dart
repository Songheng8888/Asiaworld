import 'package:flutter_bloc/flutter_bloc.dart';

import 'index_event.dart';

class IndexBloc extends Bloc<IndexEvent, int> {
  @override
  IndexBloc() : super(1);

  @override
  Stream<int> mapEventToState(IndexEvent event) async* {
    if (event is Taped) {
      yield event.index;
    }
  }
}

IndexBloc categoryIndexBloc = IndexBloc();
