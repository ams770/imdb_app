
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/presentation/home/home_view.dart';
import 'package:imdb/presentation/resources/color_manager.dart';
import '../../../app/di.dart';
import '../../../domain/usecases/get_top_250_usecase.dart';
import '../../resources/values_manager.dart';
import '../base_cubit/base_cubit.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BaseCubit()..getTop250Movie(context, instance<GetTop250MovieUseCase>()),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: ColorManager.offWhite,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: AppSize.s0,
          elevation: AppSize.s0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: AppSize.s220,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(AppSize.s100),
                  bottomLeft: Radius.circular(AppSize.s100),
                ),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    ColorManager.darkPrimary,
                    ColorManager.lightPrimary,
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                right: AppPadding.p15,
                left: AppPadding.p15,
                top: AppPadding.p10,
              ),
                child: HomeView(),
            )
          ],
        ),
      ),
    );
  }
}
