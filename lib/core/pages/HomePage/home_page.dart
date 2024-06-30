// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/widgets/article_card.dart';
import 'package:news_app/core/pages/BookMark/cubits/cubit/book_mark_cubit.dart';
import 'package:news_app/common/utils/constants.dart';
import 'package:news_app/common/widgets/heightspacer.dart';
import 'package:news_app/core/pages/HomePage/cubit/homepage_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> country = [
    "India",
    "China",
    "London",
    "England",
    "Honkong"
  ];
  final List<String> countryCode = ["in", "hk", "us", "in", "hk"];

  String getUrl(country) {
    return "https://newsapi.org/v2/top-headlines?country=$country&category=business&apiKey=9214b282d43d486986ab09514e1de9e2";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 218, 235, 243),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 167, 205, 224),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(70.h),
              ),
            ),
            flexibleSpace: Column(
              children: [
                HeightSpace(height: 10.h),
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(bottom: 40),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: country.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<HomepageCubit>()
                                .fetchArticleData(getUrl(countryCode[index]));
                          },
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: AppConst.kLight,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                country[index],
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: BlocBuilder<HomepageCubit, HomepageState>(
          builder: (context, state) {
            if (state is ArticleLoadingErrorState) {
              return SizedBox(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: country.length,
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
                          child:
                              Center(child: NewsArticleCard(isLoading: true)),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            if (state is ArticleLoadedState) {
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
                              context.read<BookMarkCubit>().removeBookMark(
                                  state.newsArticle[index].source!.name!);
                            },
                            addToBookMark: () {
                              context
                                  .read<BookMarkCubit>()
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

            if (state is ArticleLoadingState) {
              return SizedBox(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: country.length,
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
                            isLoading: true,
                          )),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return Column(
              children: [
                NewsArticleCard(
                  isLoading: state is ArticleLoadingState ? true : false,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
