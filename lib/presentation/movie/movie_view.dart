import 'package:flutter/material.dart';
import 'package:imdb/domain/models/models.dart';
import 'package:imdb/presentation/resources/values_manager.dart';
import '../resources/components_widgets.dart';


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

            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  BackgroundImageBuilder(
                    imageUrl: _movie.image,
                    size: AppSize.s200,
                    infinitWidth: true,
                    infinitHeight: true,
                  ),
                 BluredBackgroundText( _movie.fullTitle),
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
          ///todo implement movie data view  
        ],
      ),
    );
  }
}
