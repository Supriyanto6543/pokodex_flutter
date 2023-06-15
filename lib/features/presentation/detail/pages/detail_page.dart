import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/extension/sizebox_extension.dart';
import 'package:pokemon/extension/string_extension.dart';
import 'package:pokemon/features/presentation/detail/bloc/detail_bloc.dart';

class DetailPage extends StatefulWidget {
  DetailPage(
      {Key? key, required this.id, required this.color, required this.images})
      : super(key: key);

  final int id;
  final Color color;
  final String images;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: BlocProvider(
        create: (context) => DetailBloc()..add(DetailEventData(widget.id)),
        child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state is DetailLoaded) {
              return SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      top: MediaQuery.of(context).size.height / 2.5,
                      right: 0,
                      left: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.sp),
                              topRight: Radius.circular(16.sp),
                            )),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 22.sp,
                            ),
                            TabBar(
                                controller: tabController,
                                isScrollable: true,
                                tabs: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.sp),
                                    child: Text(
                                      'About',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.sp),
                                    child: Text(
                                      'Base Stats',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.sp),
                                    child: Text(
                                      'Evolution',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.sp),
                                    child: Text(
                                      'Moves',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              height: 16.sp,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.sp),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: TabBarView(
                                    controller: tabController,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                  flex: 1, child: Text('Name')),
                                              Expanded(
                                                  flex: 2,
                                                  child: Text(state.data.name,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.sp,
                                                          fontWeight: FontWeight
                                                              .w400))),
                                            ],
                                          ),
                                          10.toSizedBox(h: 10),
                                          Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Text('Height')),
                                              Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                      '${state.data.baseExperience}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.sp,
                                                          fontWeight: FontWeight
                                                              .w400))),
                                            ],
                                          ),
                                          10.toSizedBox(h: 10),
                                          Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Text('Weight ')),
                                              Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                      '${state.data.weight}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.sp,
                                                          fontWeight: FontWeight
                                                              .w400))),
                                            ],
                                          ),
                                          10.toSizedBox(h: 10),
                                          Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Text('Abilities ')),
                                              Expanded(
                                                flex: 2,
                                                child: Wrap(
                                                  children: List.generate(
                                                      state.data.abilities
                                                          .length, (index) {
                                                    return Text(
                                                      '${state.data.abilities[index].ability.name}, ',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    );
                                                  }),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        itemCount: state.data.stats.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          var stats = state.data.stats[index];
                                          return Container(
                                            margin:
                                                EdgeInsets.only(bottom: 12.sp),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                    flex: 2,
                                                    child:
                                                        Text(stats.stat.name)),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                      '${stats.baseStat}',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child:
                                                      LinearProgressIndicator(
                                                    value: 100,
                                                    color: stats.baseStat > 50
                                                        ? Colors.green
                                                        : Colors.red,
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        itemCount: state.data.types.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          var stats = state.data.types[index];
                                          return Container(
                                            margin:
                                                EdgeInsets.only(bottom: 12.sp),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                    flex: 1,
                                                    child:
                                                        Text(stats.type.name)),
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(stats.type.url,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      SingleChildScrollView(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              state.data.gameIndices.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            var stats =
                                                state.data.gameIndices[index];
                                            return Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 12.sp),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                          stats.version.name)),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                        'Index: ${stats.gameIndex}',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 5,
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
                          padding: EdgeInsets.symmetric(horizontal: 12.sp),
                          child: Text(
                            state.data.name.capitalizeByWord(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 22.sp),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: Wrap(
                            children:
                                List.generate(state.data.types.length, (index) {
                              var type = state.data.types[index];
                              return Container(
                                padding: EdgeInsets.all(6.sp),
                                margin: EdgeInsets.all(4.sp),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(8.sp)),
                                child: Text(
                                  type.type.name,
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }),
                          ),
                        ),
                        Center(
                          child: Image.network(
                            widget.images,
                            height: 200.sp,
                            width: 200.sp,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    )
                  ],
                ),
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
}
