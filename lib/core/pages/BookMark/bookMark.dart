import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/utils/constants.dart';
import 'package:news_app/common/widgets/appstyle.dart';
import 'package:news_app/common/widgets/article_card.dart';
import 'package:news_app/core/pages/BookMark/cubits/cubit/book_mark_cubit.dart';

class BookMark extends StatefulWidget {
  const BookMark({super.key});

  @override
  State<BookMark> createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 167, 205, 224),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 218, 235, 243),
          title: Text(
            "Read Your Favourite News",
            style: appstyle(24, AppConst.kLight, FontWeight.w800),
          ),
        ),
        body: BlocBuilder<BookMarkCubit, BookMarkState>(
          builder: (context, state) {
            if (state is BookMarkGetState) {
              return SizedBox(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.newsArticle.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppConst.kLight,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          width: 100,
                          child: Center(
                              child: NewsArticleCard(
                            title: state.newsArticle[index].title.toString(),
                            description:
                                state.newsArticle[index].description.toString(),
                            image:
                                state.newsArticle[index].urlToImage.toString(),
                            removeFromBookMark: () {
                              BlocProvider.of<BookMarkCubit>(context)
                                  .removeBookMark(
                                      state.newsArticle[index].source!.name!);
                            },
                            addToBookMark: () {
                              BlocProvider.of<BookMarkCubit>(context)
                                  .addToBookMark(state.newsArticle[index]);
                            },
                            readMore: () async {
                              try {
                                await EasyLauncher.url(
                                    url: state.newsArticle[index].toString());
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.toString())));
                              }
                            },
                          )),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return const Column(
              children: [NewsArticleCard()],
            );
          },
        ),
      ),
    );
  }
}
