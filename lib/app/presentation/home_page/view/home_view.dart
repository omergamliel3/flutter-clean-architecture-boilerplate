import 'package:flutter/material.dart';

class HomeViewCubit extends StatelessWidget {
  PreferredSizeWidget appBar() {
    return AppBar();
  }

  Widget buildBody(BuildContext context) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: appBar(),
        body: buildBody(context),
      ),
    );
  }
}

// IMPLEMENTING BLOC, CUBIT EXAMPLE

//   Widget buildBody(BuildContext context) {
//   return BlocBuilder<ArticlesCubit, ArticlesState>(
//     builder: (context, state) {
//       return state.when(
//         initial: () => core_widgets.LoadingWidget(),
//         loading: () => core_widgets.LoadingWidget(),
//         success: (articles) => ArticlesView(articles: articles),
//         error: (failure) => core_widgets.ErrorWidget(failure.message),
//       );
//     },
//   );
// }
// Widget build(BuildContext context) {
//   return SafeArea(
//     top: false,
//     child: BlocProvider(
//       create: (_) => Injector.resolve<ArticlesCubit>()..getArticles(),
//       child: Scaffold(
//         backgroundColor: Colors.yellow,
//         appBar: appBar(),
//         body: buildBody(context),
//         floatingActionButton: FAB(),
//       ),
//     ),
//   );
// }
