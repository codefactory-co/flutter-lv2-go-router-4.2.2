import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_actual/provider/auth_provider.dart';
import 'package:go_router_actual/screen/1_screen.dart';
import 'package:go_router_actual/screen/2_screen.dart';
import 'package:go_router_actual/screen/3_screen.dart';
import 'package:go_router_actual/screen/error_screen.dart';
import 'package:go_router_actual/screen/home_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: _App(),
    ),
  );
}

class _App extends ConsumerWidget {
  _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      // 라우트 정보를 전달
      routeInformationProvider: router.routeInformationProvider,
      // URI String을 상태 및 Go Router에서 사용할 수 있는 형태로
      // 변환해주는 함수
      routeInformationParser: router.routeInformationParser,
      // 위에서 변경된 값으로
      // 실제 어떤 라우트를 보여줄지
      // 정하는 함수
      routerDelegate: router.routerDelegate,
    );
  }
}
