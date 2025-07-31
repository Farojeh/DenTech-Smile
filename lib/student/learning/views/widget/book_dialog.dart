import 'package:dentech_smile/student/learning/controller/cubit/books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDialog extends StatelessWidget {
  final int id ;
  const BookDialog({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BooksCubit>(
      create: (context) => BooksCubit(id),
      child: BlocListener<BooksCubit, BooksState>(
        listener: (context, state) async {
          if (state is BooksSuccess) {
            // Navigator.of(context).pop();
          }
        },
        child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.8,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: BlocBuilder<BooksCubit, BooksState>(
                  builder: (context, state) {
                    if (state is BooksLoading) {
                      return const Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is Booksfailure) {
                      return Center(
                        child: Text(state.errormessage),
                      );
                    }else if (state is BooksSuccess) {
                      return Center(
                        child: Text(state.path),
                      );
                    }  else {
                      return Container();
                    }
                  },
                ))),
      ),
    );
  }
}