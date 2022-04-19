import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:save/layout/home_layout/HOME_PAGE.dart';
import 'package:save/layout/home_layout/admin_home_layout.dart';
import 'package:save/layout/home_layout/home_screen.dart';
import 'package:save/shared/bloc_observer.dart';
import 'package:save/shared/components/constants.dart';
import 'package:save/shared/components/themes.dart';
import 'package:save/shared/network/local/cache_helper.dart';
import 'package:save/views/login_screen/login_screen.dart';

import 'layout/cubit/cubit.dart';
import 'layout/cubit/state.dart';

void main(context) async{

  WidgetsFlutterBinding.ensureInitialized();
  await  CacheHelper.init();
  await CacheHelper.reset();
  await Firebase.initializeApp();
  bool? isDark = await CacheHelper.getData(key: 'isDark');
  Widget widget;

  uId ='';
  isAdmin =null;
  token ='';
  uId = await CacheHelper.getData(key: 'uId')  ;
  isAdmin = await CacheHelper.getData(key: 'admin');
  print (' main  screen');
  print (isAdmin);

 // print (uId);

  if (uId != null ){
   if ( isAdmin!  )
     widget =AdminHome();
   else
     widget = HomeScreen();

   // widget =HomePage();
  }
 else
    {
      widget =SocialLoginScreen();
    }
 //widget = SocialLoginScreen();
 // bool isDark=true;
 BlocOverrides.runZoned(
         () =>  runApp( MyApp(isDark: isDark,startWidget: widget)),//,
         blocObserver:MyBlocObserver(),
 );

}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startWidget;
  MyApp ({this.isDark,
    this.startWidget
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:  (BuildContext context) =>AppCubit()
      ..changeAppMode(fromShared: isDark,),),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener:(context,state) {},
        builder:(context,state){
          return MaterialApp(

            debugShowCheckedModeBanner: false,
            theme:  lightMode,
            darkTheme: darkMode,
            themeMode: AppCubit.get(context).isDark? ThemeMode.light:ThemeMode.dark,

        // home: startWidget,
           home: SocialLoginScreen(),
           // home: AdminHome(),

          );
        } ,
      ),
    );
  }

}

