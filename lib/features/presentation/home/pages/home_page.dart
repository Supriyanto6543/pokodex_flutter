import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/common/hex_color.dart';
import 'package:pokemon/common/routes.dart';
import 'package:pokemon/extension/list_extension.dart';
import 'package:pokemon/extension/string_extension.dart';
import 'package:pokemon/features/presentation/home/bloc/home_bloc.dart';
import 'package:pokemon/utils/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => HomeBloc()..add(HomeEventList(0)),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              return Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Image.network(
                        'https://freepngimg.com/download/pokemon/37603-9-pokeball.png',
                        height: 150.sp,
                        width: 150.sp,
                        opacity: const AlwaysStoppedAnimation(.3)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: kToolbarHeight,
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.sp),
                        child: Text(
                          'Pokodex',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 22.sp),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: 3.toGrid(
                              context: context,
                              length: state.list.length,
                              builder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.detailView,
                                        arguments: {
                                          'id': index + 1,
                                          'color': colorBg(index),
                                          'image':
                                              '${Constant.imagePng}${index + 1}.png'
                                        });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(6.sp),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.sp, horizontal: 6.sp),
                                    decoration: BoxDecoration(
                                        color: colorBg(index),
                                        borderRadius:
                                            BorderRadius.circular(10.sp)),
                                    child: Stack(
                                      children: [
                                        Text(
                                          state.list[index].name
                                              .capitalizeByWord(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Image.network(
                                              'https://freepngimg.com/download/pokemon/37603-9-pokeball.png',
                                              height: 120.sp,
                                              width: 120.sp,
                                              opacity:
                                                  const AlwaysStoppedAnimation(
                                                      .3)),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Image.network(
                                            '${Constant.imagePng}${index + 1}.png',
                                            height: 130.sp,
                                            width: 130.sp,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      )
                    ],
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  colorBg(int index) {
    if (index % 3 == 0) {
      return getColorFromHex('#47cdae');
    } else if (index % 5 == 0) {
      return getColorFromHex('#fc6c6d');
    } else {
      return getColorFromHex('#76beff');
    }
  }
}
