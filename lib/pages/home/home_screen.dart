import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salty_flutter_test/model/user_model.dart';
import 'package:salty_flutter_test/pages/home/bloc/home_bloc.dart';
import 'package:salty_flutter_test/pages/home/bloc/home_state.dart';
import 'package:salty_flutter_test/pages/user/user_detail_screen.dart';
import 'package:salty_flutter_test/styles/base_color.dart';
import 'package:sizer/sizer.dart';

import 'bloc/home_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc _homeBloc;
  late int page;

  @override
  void initState() {
    setState(() {
      page = 2;
    });
    // TODO: implement initState
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.add(HomeUserDataLoaded(page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: BaseColor.Primary,
          title: const Text("List User"),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            //
          },
          builder: (context, state) {
            if (state is HomeListDataUserLoading) {
              return RefreshIndicator(
                  onRefresh: () async {
                    context.read<HomeBloc>().add(HomeUserDataLoaded(page));
                  },
                  child: const Center(child: CircularProgressIndicator()));
            } else if (state is HomeListDataUserLoaded) {
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  color: BaseColor.Divider,
                ),
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  UserModel item = state.data[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetailScreen(userModel: item),
                          ));
                    },
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
                    title: Text(
                      "${item.firstName} ${item.lastName}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: BaseColor.Primary),
                    ),
                    subtitle: Text(
                      item.email,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    leading: ClipOval(
                      child: SizedBox(
                        width: 40.sp,
                        height: 40.sp,
                        child: Image.network(
                          item.avatar,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            return RefreshIndicator(
                onRefresh: () async {
                  context.read<HomeBloc>().add(HomeUserDataLoaded(page));
                },
                child: Text("Data Tidak tersedia"));
          },
        ));
  }
}
