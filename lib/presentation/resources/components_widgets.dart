import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imdb/presentation/movie/movie_view.dart';
import 'package:imdb/presentation/resources/font_manager.dart';
import 'package:imdb/presentation/resources/styles_manager.dart';
import 'package:imdb/presentation/resources/values_manager.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../domain/models/models.dart';
import 'color_manager.dart';

showSnackBar(context, String msg, Color bacgroundColor) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: getRegularStyle(
          color: ColorManager.white,
        ),
      ),
      backgroundColor: bacgroundColor,
    ));

class MovieBuilder extends StatelessWidget {
  const MovieBuilder(this._movie, {super.key});
  final Movie _movie;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MovieView(_movie)));
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              MovieImageBuilder(_movie.image),
              MovieRate(
                rate: _movie.imDbRating,
                hasShadow: true,
                textColor: ColorManager.white,
              )
            ],
          ),
          BluredBackgroundContainer(
            child: Text(
              _movie.title,
              style: getBoldStyle(
                color: ColorManager.white,
                fontSize: FontSize.s16,
                hasShadow: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MovieRate extends StatelessWidget {
  const MovieRate(
      {super.key,
      required this.rate,
      required this.hasShadow,
      required this.textColor});
  final String rate;
  final bool hasShadow;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppMargin.m8),
      child: Row(
        children: [
          const Icon(
            Icons.star_rate_rounded,
            color: ColorManager.primary,
            size: AppSize.s20,
          ),
          const SizedBox(
            width: AppSize.s3,
          ),
          Text(
            rate,
            style: getRegularStyle(
              color: textColor,
              fontSize: FontSize.s12,
              hasShadow: hasShadow,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class BluredBackgroundContainer extends StatelessWidget {
  BluredBackgroundContainer({
    super.key,
    required this.child,
    this.boderRaduis = AppSize.s30,
    this.horizontalMargin = AppMargin.m12,
    this.virtcalMargin = AppMargin.m12,
    this.horizontalPadding = AppPadding.p8,
    this.virtcalPadding = AppPadding.p10,
  });
  final Widget child;
  double boderRaduis;
  double horizontalMargin;
  double virtcalMargin;
  double horizontalPadding;
  double virtcalPadding;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: virtcalMargin,
        horizontal: horizontalMargin,
      ),
      padding: EdgeInsets.symmetric(
        vertical: virtcalPadding,
        horizontal: horizontalPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.5),
        borderRadius: BorderRadius.circular(boderRaduis),
      ),
      child: child,
    );
  }
}

class MovieImageBuilder extends StatelessWidget {
  const MovieImageBuilder(this.image, {super.key});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m4),
      height: MediaQuery.of(context).size.height / 2.5,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: image,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const LoadingFlick(),
        errorWidget: (context, url, error) => const Icon(
          Icons.error_sharp,
          color: ColorManager.error,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class BackgroundImageBuilder extends StatelessWidget {
  BackgroundImageBuilder({
    Key? key,
    required this.imageUrl,
    required this.size,
    this.infinitWidth = false,
    this.infinitHeight = false,
  }) : super(key: key);
  final String imageUrl;
  final double size;
  bool infinitWidth;
  bool infinitHeight;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          const LoadingFlick(),
      errorWidget: (context, url, error) => const Icon(
        Icons.error_sharp,
        color: ColorManager.error,
      ),
      height: infinitHeight ? double.infinity : size,
      width: infinitWidth ? double.infinity : size,
      fit: BoxFit.cover,
    );
  }
}

class LoadingFlick extends StatelessWidget {
  const LoadingFlick({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.flickr(
        size: AppSize.s50,
        leftDotColor: ColorManager.white,
        rightDotColor: ColorManager.primary,
      ),
    );
  }
}

class LoadingWave extends StatelessWidget {
  const LoadingWave({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: ColorManager.lightPrimary,
        size: AppSize.s50,
      ),
    );
  }
}

class ErrorViewBuilder extends StatelessWidget {
  const ErrorViewBuilder(this.onRetry, {super.key});
  final void Function() onRetry;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.wifi_slash,
            color: ColorManager.error,
            size: AppSize.s150,
          ),
          const SizedBox(
            height: AppSize.s30,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              AppSize.s20,
            )),
            onPressed: onRetry,
            color: ColorManager.primary,
            child: FittedBox(
              child: Text(
                "Retry",
                style: getRegularStyle(
                  color: ColorManager.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
