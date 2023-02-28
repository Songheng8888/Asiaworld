import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:royal_landapp/src/feature/home/screen/new_home_screen.dart';
import 'package:royal_landapp/src/feature/search/bloc/bloc.dart';
import 'package:royal_landapp/src/feature/search/bloc/event.dart';
import 'package:royal_landapp/src/feature/search/bloc/state.dart';
import 'detail_search.dart';

//List<SearchModel> listSearch = [];

class HomeSearch extends StatefulWidget {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  _HomeSearchState createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  // ignore: unused_field
  bool isSearch = false;
  late TextEditingController? _searchCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(LineAwesomeIcons.angle_left, color: Colors.black,),
          ),
          title: Text(
            'Search',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.red,
                ),
          ),
          backgroundColor: Colors.white,
        ),
        body: isSearch != true
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Container(
                  alignment: Alignment.center,
                  height: 700,
                  child: _buildSearchProperty,
                ),
              )
            : BuildBodySearch(query: _searchCtl!.value.text));
  }

  get _buildAppBar {
    return AppBar(
      backgroundColor: Colors.indigo,
      //centerTitle: true,
      title: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 5),
        height: 42,
        width: 250,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.all(Radius.circular(30))),
        child: TextFormField(
          controller: _searchCtl,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            isDense: true,
            suffixIcon: Icon(
              CupertinoIcons.search,
              color: Colors.black,
            ),
            hintText: 'Search...',
            border: InputBorder.none,
          ),
          onTap: () {
            setState(() {
              isSearch = true;
            });
          },
        ),
      ),
      actions: [
        Container(
          padding: EdgeInsets.only(bottom: 5, right: 10),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                  "https://scontent.fpnh20-1.fna.fbcdn.net/v/t1.15752-9/245004538_1470052286710763_5830766021133930848_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=ae9488&_nc_eui2=AeE8n4EtHQtRwzHdO92NjpunJrNOD4h9W2Yms04PiH1bZink-UnraAZQALqEB1G0_nVGxdE-XBLiY2dBbJhOF0l2&_nc_ohc=TeHjt-QHFCIAX9W0qd6&_nc_ht=scontent.fpnh20-1.fna&oh=1d5cb95b64cb2b31b0f2bf4aa3c7c35e&oe=61CE9F63"),
            ),
          ),
        ),
      ],
    );
  }

  Widget get _buildSearchProperty {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                width: 320,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Country',
                    icon: Icon(CupertinoIcons.location),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                width: 320,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'All Location',
                    icon: Icon(CupertinoIcons.location),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                width: 320,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'District',
                    icon: Icon(CupertinoIcons.location),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                width: 320,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'All type',
                    icon: Icon(Icons.category),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          // onTap: () {
          //   BuildBodySearch(query: _searchCtl!.value.text);
          // },
          child: Container(
            alignment: Alignment.center,
            height: 40,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.indigo,
              // border: Border.all(width: 1),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Text(
              "Search ",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}

class BuildBodySearch extends StatefulWidget {
  final String query;
  BuildBodySearch({required this.query});

  @override
  _BuildBodySearchState createState() => _BuildBodySearchState();
}

class _BuildBodySearchState extends State<BuildBodySearch> with TickerProviderStateMixin {
  late final TabController _tabController;
  // //
  //DetailPropertyTypeBloc propertyTypeBloc = DetailPropertyTypeBloc();
  late SearchBloc _model;
  @override
  void initState() {
    super.initState();
    _model = BlocProvider.of<SearchBloc>(context);
    _model.add(FetchSearch(query: widget.query));
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchBloc>(context).add(FetchSearch(query: widget.query));
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is FetchingSearchState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ErrorSearchState) {
        return Container(
          child: Text(state.error),
        );
      }
      return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Container(
              // height: 700,
              child: Column(
            children: [
              TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.blue,
                  labelColor: Colors.teal,
                  unselectedLabelColor: Colors.black54,
                  isScrollable: true,
                  tabs: [
                    Tab(
                        child: Container(
                            child: Text(
                      "",
                      style: TextStyle(color: Colors.white),
                    ))),
                  ]),
              Container(
                height: 700,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildListView(context),
                  ],
                ),
              ),
            ],
          )));
    });
  }

  _buildListView(BuildContext context) {
    return ListView.builder(
        itemCount: BlocProvider.of<SearchBloc>(context).results!.length,
        itemBuilder: (context, index) {
          return Container(
            height: 160,
            width: 500,
            child: Card(
                child: InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (con) => SearchDetailPage(
                //             searchModel: BlocProvider.of<SearchBloc>(context)
                //                 .results![index])));
              },
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 160,
                    child: Image.network(
                      BlocProvider.of<SearchBloc>(context).results![index].image!,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 8),
                          alignment: Alignment.topLeft,
                          child: BlocProvider.of<SearchBloc>(context).results![index].name == null
                              ? Container()
                              : Text(
                                  BlocProvider.of<SearchBloc>(context).results![index].name!,
                                  style: TextStyle(fontSize: 20, color: Colors.red),
                                ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Location : ",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Container(
                                child:
                                    BlocProvider.of<SearchBloc>(context).results![index].province ==
                                            null
                                        ? Container()
                                        : Text(
                                            BlocProvider.of<SearchBloc>(context)
                                                .results![index]
                                                .province!,
                                            style: TextStyle(fontSize: 18),
                                          )),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Size : ",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Container(
                                child: BlocProvider.of<SearchBloc>(context)
                                            .results![index]
                                            .groundSurface ==
                                        null
                                    ? Container()
                                    : Text(
                                        BlocProvider.of<SearchBloc>(context)
                                            .results![index]
                                            .groundSurface!,
                                        style: TextStyle(fontSize: 18),
                                      )),
                            Text(
                              "m2 ",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Price : \$",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Container(
                                child: BlocProvider.of<SearchBloc>(context).results![index].price ==
                                        null
                                    ? Container()
                                    : Text(
                                        BlocProvider.of<SearchBloc>(context).results![index].price!,
                                        style: TextStyle(fontSize: 18),
                                      )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          );
        });
  }
}
