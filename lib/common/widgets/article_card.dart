import 'package:flutter/material.dart';
import 'package:news_app/common/utils/constants.dart';
import 'package:news_app/common/widgets/appstyle.dart';
import 'package:shimmer/shimmer.dart';

class NewsArticleCard extends StatefulWidget {
  const NewsArticleCard({
    Key? key,
    this.isLoading = false,
    this.title = "",
    this.image = "",
    this.description = "",
    this.addToBookMark,
    this.removeFromBookMark,
    this.readMore,
  }) : super(key: key);

  final bool isLoading;
  final String title;
  final String image;
  final String description;
  final Function()? addToBookMark;
  final Function()? removeFromBookMark;
  final Function()? readMore;

  @override
  State<NewsArticleCard> createState() => _NewsArticleCardState();
}

class _NewsArticleCardState extends State<NewsArticleCard> {
  var _isLiked = false;
  var _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConst.kLight.withOpacity(0.7),
      width: AppConst.kWidth * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: AppConst.kWidth * 0.4,
            child: widget.isLoading
                ? _buildShimmerText(AppConst.kGreyDK)
                : Text(
                    widget.title,
                    style: appstyle(12, AppConst.kBkDark, FontWeight.w600),
                  ),
          ),
          Row(
            children: [
              SizedBox(
                width: AppConst.kWidth * 0.6,
                child: widget.isLoading
                    ? _buildShimmerText(AppConst.kGreyDK)
                    : Text(
                        widget.description,
                        style: appstyle(12, AppConst.kBkDark, FontWeight.w400),
                      ),
              ),
              widget.isLoading
                  ? _buildShimmerImage()
                  : Container(
                      height: 100,
                      width: 100,
                      color: AppConst.kGreen,
                      child: Image.network(
                        widget.image == "null"
                            ? "https://yt3.googleusercontent.com/Y_iNjNBFP6bpHwT2hAHaLj7J3po22sGjwlR6mn26PWRp2IFesRAeNQEpSuh9xFiG8R57OOE83DE=s900-c-k-c0x00ffffff-no-rj"
                            : widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),
            ],
          ),
          InkWell(
              onTap: widget.readMore,
              child: Text(
                "Read More",
                style: appstyle(14, AppConst.kBkDark, FontWeight.w400),
              )),
          SizedBox(
            width: AppConst.kWidth * 0.7,
            child: const Divider(
              height: 10,
              thickness: 2,
            ),
          ),
          SizedBox(
            width: AppConst.kWidth * 0.8,
            child: widget.isLoading
                ? _buildShimmerIcons(AppConst.kGreyDK)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isLiked = !_isLiked;
                          });
                        },
                        child: Icon(
                          _isLiked ? Icons.favorite : Icons.favorite_outline,
                          color: _isLiked ? Colors.red : null,
                        ),
                      ),
                      const Icon(Icons.comment),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isBookmarked = !_isBookmarked;
                          });

                          if (_isBookmarked) {
                            widget.addToBookMark?.call();
                          } else {
                            widget.removeFromBookMark?.call();
                          }
                        },
                        child: Icon(
                          _isBookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_add_outlined,
                          color: _isBookmarked ? Colors.blue : null,
                        ),
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }

  Widget _buildShimmerText(Color color) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: color,
      child: Container(
        width: double.infinity,
        height: 12.0,
        color: Colors.white,
      ),
    );
  }

  Widget _buildShimmerImage() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.white,
      ),
    );
  }

  Widget _buildShimmerIcons(Color color) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          3,
          (index) => Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
