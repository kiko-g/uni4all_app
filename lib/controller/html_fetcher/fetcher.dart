import 'dart:async';

import 'package:redux/redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/controller/networking/network_router.dart';

class HtmlPageFetcher {
  Future<String> getHtmlPage(Store<AppState> store, url) async {

    final response = await NetworkRouter.getWithCookies(
        url,
        {},
        store.state.content['session']
    );

    return response.toString();
  }
}
