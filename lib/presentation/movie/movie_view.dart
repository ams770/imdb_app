import 'package:flutter/material.dart';
import 'package:imdb/domain/models/models.dart';
import 'package:imdb/presentation/resources/strings_manager.dart';
import 'package:imdb/presentation/resources/values_manager.dart';
import '../resources/color_manager.dart';
import '../resources/components_widgets.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

class MovieView extends StatelessWidget {
  const MovieView(this._movie, {super.key});
  final Movie _movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: false,
      body: CustomScrollView(
        clipBehavior: Clip.hardEdge,
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            stretch: true,
            pinned: false,
            primary: false,
            backgroundColor: ColorManager.offWhite,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  BackgroundImageBuilder(
                    imageUrl: _movie.image,
                    size: AppSize.s0,
                    infinitWidth: true,
                    infinitHeight: true,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BluredBackgroundContainer(
                        child: Text(
                          _movie.title,
                          textAlign: TextAlign.center,
                          style: getBoldStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s16,
                            hasShadow: true,
                          ),
                        ),
                      ),
                      Container(
                        color: ColorManager.white.withOpacity(0.97),
                        padding: const EdgeInsets.symmetric(
                          vertical: AppPadding.p15,
                        ),
                        margin: const EdgeInsets.only(
                          bottom: AppMargin.m0_5,
                        ),
                        child: Row(
                          children: [
                            MovieRate(
                              rate: _movie.imDbRating,
                              hasShadow: false,
                              textColor: ColorManager.black,
                            ),
                            Expanded(
                              child: Text(
                                "${AppStrings.rates}: ${_movie.imDbRatingCount}",
                                textAlign: TextAlign.start,
                                style: getMediumStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s8,
                                  hasShadow: false,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            expandedHeight: MediaQuery.of(context).size.height / 2,
            toolbarHeight: AppSize.s0,
            collapsedHeight: AppSize.s0, // of pinned bar
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: AppSize.s20,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      ("${_movie.fullTitle} ") * 10, // like a describtion
                      style: getRegularStyle(color: ColorManager.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: AppSize.s20,
            ),
          ),
          MovieDataRow(AppStrings.title, _movie.fullTitle),
          MovieDataRow(AppStrings.crew, _movie.crew),
          MovieDataRow(AppStrings.releaseDate, _movie.year),
          // to test behaviour
          const SliverToBoxAdapter(
              child: SizedBox(
            height: AppSize.s300,
          )),
        ],
      ),
    );
  }
}

class MovieDataRow extends StatelessWidget {
  const MovieDataRow(this.name, this.data, {super.key});
  final String name;
  final String data;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p10,
          horizontal: AppPadding.p15,
        ),
        // margin: const EdgeInsets.symmetric(
        //   vertical: AppMargin.m4,
        // ),
        child: Row(
          children: [
            Text(
              "$name : ",
              style: getSemiBoldStyle(color: ColorManager.black),
            ),
            Expanded(
              child: Text(
                data,
                style: getRegularStyle(color: ColorManager.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
