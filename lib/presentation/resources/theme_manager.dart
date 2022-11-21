// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'color_manager.dart';
// import 'font_manager.dart';
// import 'styles_manager.dart';
// import 'values_manager.dart';

// ThemeData getApplicationTheme() {
//   return ThemeData(
//     // main colors
//     primaryColor: ColorManager.primary,
//     primaryColorLight: ColorManager.lightPrimary,
//     primaryColorDark: ColorManager.darkPrimary,
//     disabledColor: ColorManager.grey1,
//     splashColor: ColorManager.grey.withOpacity(0.1),
//     backgroundColor: ColorManager.white,
//     scaffoldBackgroundColor: ColorManager.white,

//     //card theme
//     cardTheme: const CardTheme(
//       color: ColorManager.white,
//       shadowColor: ColorManager.grey,
//       elevation: AppSize.s4,
//     ),

//     //app bar theme
//     appBarTheme: AppBarTheme(
//       color: ColorManager.white,
//       shadowColor: ColorManager.white,
//       elevation: AppSize.s0,
//       centerTitle: true,
//       systemOverlayStyle: const SystemUiOverlayStyle(
//         statusBarColor: ColorManager.white,
//         statusBarIconBrightness: Brightness.dark,
//         statusBarBrightness: Brightness.light,
//       ),
//       titleTextStyle: getRegularStyle(
//         fontSize: FontSize.s16,
//         color: ColorManager.white,
//       ),
//     ),

//     // button theme
//     buttonTheme: const ButtonThemeData(
//       shape: StadiumBorder(),
//       splashColor: ColorManager.lightPrimary,
//       buttonColor: ColorManager.primary,
//       disabledColor: ColorManager.grey1,
//     ),

//     //elevated biutton
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: ColorManager.primary,
//         textStyle: getRegularStyle(
//           color: ColorManager.white,
//           fontSize: FontSize.s17,
//           height: AppSize.s1_5,
//         ),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(AppSize.s15),
//         ),
//       ),
//     ),

//     // text theme
//     textTheme: TextTheme(
//       displayLarge: getSemiBoldStyle(
//         fontSize: FontSize.s16,
//         color: ColorManager.darkGrey,
//       ),
//       headlineLarge: getSemiBoldStyle(
//         fontSize: FontSize.s16,
//         color: ColorManager.darkGrey,
//       ),
//       headlineMedium: getRegularStyle(
//         fontSize: FontSize.s16,
//         color: ColorManager.darkGrey,
//       ),
//       titleMedium: getMediumStyle(
//         fontSize: FontSize.s14,
//         color: ColorManager.lightGrey,
//       ),
//       bodyLarge: getRegularStyle(
//         color: ColorManager.grey1,
//       ),
//       bodySmall: getRegularStyle(
//         color: ColorManager.grey1,
//       ),
//     ),

//     // input decoration theme
//     inputDecorationTheme: InputDecorationTheme(
//       hintStyle: getRegularStyle(
//         color: ColorManager.darkGrey,
//         fontSize: FontSize.s15,
//         height: 1,
//       ),
//       labelStyle: getMediumStyle(
//         color: ColorManager.darkGrey,
//         fontSize: FontSize.s15,
//       ),
//       errorStyle: getRegularStyle(
//         color: ColorManager.error,
//       ),

//       iconColor: ColorManager.grey,
//       prefixIconColor: ColorManager.primary,
//       suffixIconColor: ColorManager.grey,

//       // border

//       focusedErrorBorder: const OutlineInputBorder(
//         borderSide: BorderSide(
//           width: AppSize.s1,
//           color: ColorManager.primary,
//         ),
//         borderRadius: BorderRadius.all(
//           Radius.circular(
//             AppSize.s15,
//           ),
//         ),
//       ),
//       contentPadding: const EdgeInsets.symmetric(
//           vertical: AppPadding.p12, horizontal: AppPadding.p4),

//       focusedBorder: OutlineInputBorder(
//         // gapPadding: 50,
//         borderSide: const BorderSide(
//           color: ColorManager.primary,
//         ),
//         borderRadius: BorderRadius.circular(
//           AppSize.s15,
//         ),
//       ),
//       disabledBorder: OutlineInputBorder(
//         // gapPadding: 50,
//         borderSide: const BorderSide(
//           color: ColorManager.primary,
//         ),
//         borderRadius: BorderRadius.circular(
//           AppSize.s15,
//         ),
//       ),
//       enabledBorder: OutlineInputBorder(
//         // gapPadding: 50,
//         borderSide: BorderSide(color: Colors.grey.shade400),
//         borderRadius: BorderRadius.circular(
//           AppSize.s15,
//         ),
//       ),

//       border: OutlineInputBorder(
//         borderSide: const BorderSide(
//           color: Colors.grey,
//         ),
//         borderRadius: BorderRadius.circular(
//           AppSize.s15,
//         ),
//       ),

//       errorBorder: const OutlineInputBorder(
//         borderSide: BorderSide(
//           width: AppSize.s1,
//           color: ColorManager.error,
//         ),
//         borderRadius: BorderRadius.all(
//           Radius.circular(
//             AppSize.s15,
//           ),
//         ),
//       ),
//     ),
//   );
// }
