import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/app/di.dart';
import 'package:imdb/presentation/layout/base_cubit/base_cubit.dart';
import 'package:imdb/presentation/layout/base_cubit/base_states.dart';
import 'package:imdb/presentation/resources/font_manager.dart';
import 'package:imdb/presentation/resources/values_manager.dart';
import '../../domain/usecases/get_top_250_usecase.dart';
import '../resources/color_manager.dart';
import '../resources/components_widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BaseCubit, BaseStates>(
      builder: (context, state) {
        BaseCubit cubit = BaseCubit.get(context);

        return ConditionalBuilder(
            condition: cubit.isLoading,
            builder: (context) => const LoadingWave(),
            fallback: (context) => ConditionalBuilder(
                condition: cubit.isError,
                builder: (context) => ErrorViewBuilder(() {
                      cubit.getTop250Movie(
                          context, instance<GetTop250MovieUseCase>());
                    }),
                fallback: (context) => CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        const SliverToBoxAdapter(
                          child: SizedBox(
                            height: AppSize.s40,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  "IMDB AMS APP",
                                  style: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: SizedBox(
                            height: AppSize.s20,
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) =>
                                MovieBuilder(cubit.gettop250Movie()[index]),
                            childCount: cubit.gettop250Movie().length,
                          ),
                        ),
                      ],
                    )));
      },
      listener: (context, state) {},
    );
  }
}
