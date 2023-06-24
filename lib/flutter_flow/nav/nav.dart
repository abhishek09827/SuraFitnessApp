import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '../flutter_flow_theme.dart';
import '/backend/backend.dart';

import '../../auth/base_auth_user_provider.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : BootWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : BootWidget(),
          routes: [
            FFRoute(
              name: 'boot',
              path: 'boot',
              builder: (context, params) => BootWidget(),
            ),
            FFRoute(
              name: 'loginPage',
              path: 'loginPage',
              builder: (context, params) => LoginPageWidget(),
            ),
            FFRoute(
              name: 'plan',
              path: 'plan',
              requireAuth: true,
              builder: (context, params) => PlanWidget(
                tweetLikes: params.getParam('tweetLikes',
                    ParamType.DocumentReference, false, ['users', 'tweets']),
              ),
            ),
            FFRoute(
              name: 'myTweets',
              path: 'myTweets',
              requireAuth: true,
              builder: (context, params) => MyTweetsWidget(),
            ),
            FFRoute(
              name: 'profilePage',
              path: 'profilePage',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'profilePage')
                  : ProfilePageWidget(
                      userProfile: params.getParam('userProfile',
                          ParamType.DocumentReference, false, ['users']),
                    ),
            ),
            FFRoute(
              name: 'chat_page',
              path: 'chatPage',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'chat_page')
                  : ChatPageWidget(),
            ),
            FFRoute(
              name: 'editProfile',
              path: 'editProfile',
              requireAuth: true,
              builder: (context, params) => EditProfileWidget(
                userProfile: params.getParam('userProfile',
                    ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'Following',
              path: 'following',
              requireAuth: true,
              builder: (context, params) => FollowingWidget(),
            ),
            FFRoute(
              name: 'Followers',
              path: 'followers',
              requireAuth: true,
              builder: (context, params) => FollowersWidget(),
            ),
            FFRoute(
              name: 'Users',
              path: 'users',
              requireAuth: true,
              builder: (context, params) => UsersWidget(),
            ),
            FFRoute(
              name: 'workout',
              path: 'workout',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'workout')
                  : WorkoutWidget(),
            ),
            FFRoute(
              name: 'workoutCopy',
              path: 'workoutCopy',
              requireAuth: true,
              builder: (context, params) => WorkoutCopyWidget(),
            ),
            FFRoute(
              name: 'exercise_description',
              path: 'exerciseDescription',
              requireAuth: true,
              builder: (context, params) => ExerciseDescriptionWidget(
                docRef: params.getParam(
                    'docRef', ParamType.DocumentReference, false, ['chest']),
              ),
            ),
            FFRoute(
              name: 'selectedExercise',
              path: 'selectedExercise',
              requireAuth: true,
              builder: (context, params) => SelectedExerciseWidget(
                chestWork: params.getParam('chestWork',
                    ParamType.DocumentReference, false, ['wChest']),
              ),
            ),
            FFRoute(
              name: 'chest',
              path: 'chest',
              requireAuth: true,
              builder: (context, params) => ChestWidget(),
            ),
            FFRoute(
              name: 'triceps',
              path: 'triceps',
              requireAuth: true,
              builder: (context, params) => TricepsWidget(),
            ),
            FFRoute(
              name: 'edtriceps',
              path: 'edtriceps',
              requireAuth: true,
              builder: (context, params) => EdtricepsWidget(
                docRef: params.getParam(
                    'docRef', ParamType.DocumentReference, false, ['triceps']),
              ),
            ),
            FFRoute(
              name: 'selectedExercisetriceps',
              path: 'selectedExercisetriceps',
              requireAuth: true,
              builder: (context, params) => SelectedExercisetricepsWidget(
                chestWork: params.getParam('chestWork',
                    ParamType.DocumentReference, false, ['wTriceps']),
              ),
            ),
            FFRoute(
              name: 'edabs',
              path: 'edabs',
              requireAuth: true,
              builder: (context, params) => EdabsWidget(
                docRef: params.getParam(
                    'docRef', ParamType.DocumentReference, false, ['abs']),
              ),
            ),
            FFRoute(
              name: 'abs',
              path: 'abs',
              requireAuth: true,
              builder: (context, params) => AbsWidget(),
            ),
            FFRoute(
              name: 'selectedExerciseabs',
              path: 'selectedExerciseabs',
              requireAuth: true,
              builder: (context, params) => SelectedExerciseabsWidget(
                chestWork: params.getParam(
                    'chestWork', ParamType.DocumentReference, false, ['wAbs']),
              ),
            ),
            FFRoute(
              name: 'edbiceps',
              path: 'edbiceps',
              requireAuth: true,
              builder: (context, params) => EdbicepsWidget(
                docRef: params.getParam(
                    'docRef', ParamType.DocumentReference, false, ['biceps']),
              ),
            ),
            FFRoute(
              name: 'biceps',
              path: 'biceps',
              requireAuth: true,
              builder: (context, params) => BicepsWidget(),
            ),
            FFRoute(
              name: 'selectedExercisebiceps',
              path: 'selectedExercisebiceps',
              requireAuth: true,
              builder: (context, params) => SelectedExercisebicepsWidget(
                chestWork: params.getParam('chestWork',
                    ParamType.DocumentReference, false, ['wBiceps']),
              ),
            ),
            FFRoute(
              name: 'edback',
              path: 'edback',
              requireAuth: true,
              builder: (context, params) => EdbackWidget(
                docRef: params.getParam(
                    'docRef', ParamType.DocumentReference, false, ['back']),
              ),
            ),
            FFRoute(
              name: 'back',
              path: 'back',
              requireAuth: true,
              builder: (context, params) => BackWidget(),
            ),
            FFRoute(
              name: 'selectedExerciseback',
              path: 'selectedExerciseback',
              requireAuth: true,
              builder: (context, params) => SelectedExercisebackWidget(
                chestWork: params.getParam(
                    'chestWork', ParamType.DocumentReference, false, ['wBack']),
              ),
            ),
            FFRoute(
              name: 'edlegs',
              path: 'edlegs',
              requireAuth: true,
              builder: (context, params) => EdlegsWidget(
                docRef: params.getParam(
                    'docRef', ParamType.DocumentReference, false, ['legs']),
              ),
            ),
            FFRoute(
              name: 'Legs',
              path: 'legs',
              requireAuth: true,
              builder: (context, params) => LegsWidget(),
            ),
            FFRoute(
              name: 'edshoulders',
              path: 'edshoulders',
              requireAuth: true,
              builder: (context, params) => EdshouldersWidget(
                docRef: params.getParam('docRef', ParamType.DocumentReference,
                    false, ['shoulders']),
              ),
            ),
            FFRoute(
              name: 'shoulders',
              path: 'shoulders',
              requireAuth: true,
              builder: (context, params) => ShouldersWidget(),
            ),
            FFRoute(
              name: 'selectedExerciseLegs',
              path: 'selectedExerciseLegs',
              requireAuth: true,
              builder: (context, params) => SelectedExerciseLegsWidget(
                chestWork: params.getParam(
                    'chestWork', ParamType.DocumentReference, false, ['wLegs']),
              ),
            ),
            FFRoute(
              name: 'selectedExerciseShoulder',
              path: 'selectedExerciseShoulder',
              requireAuth: true,
              builder: (context, params) => SelectedExerciseShoulderWidget(
                chestWork: params.getParam('chestWork',
                    ParamType.DocumentReference, false, ['wShoulders']),
              ),
            ),
            FFRoute(
              name: 'edOthers',
              path: 'edOthers',
              requireAuth: true,
              builder: (context, params) => EdOthersWidget(
                docRef: params.getParam(
                    'docRef', ParamType.DocumentReference, false, ['others']),
              ),
            ),
            FFRoute(
              name: 'selectedExerciseOthers',
              path: 'selectedExerciseOthers',
              requireAuth: true,
              builder: (context, params) => SelectedExerciseOthersWidget(
                chestWork: params.getParam('chestWork',
                    ParamType.DocumentReference, false, ['wOthers']),
              ),
            ),
            FFRoute(
              name: 'others',
              path: 'others',
              requireAuth: true,
              builder: (context, params) => OthersWidget(),
            ),
            FFRoute(
              name: 'owners_desk',
              path: 'ownersDesk',
              requireAuth: true,
              builder: (context, params) => OwnersDeskWidget(),
            ),
            FFRoute(
              name: 'chat_pageCopy',
              path: 'chatPageCopy',
              requireAuth: true,
              builder: (context, params) => ChatPageCopyWidget(),
            ),
            FFRoute(
              name: 'FollowingCopy',
              path: 'followingCopy',
              requireAuth: true,
              builder: (context, params) => FollowingCopyWidget(
                tweetLikes: params.getParam('tweetLikes',
                    ParamType.DocumentReference, false, ['users', 'tweets']),
              ),
            ),
            FFRoute(
              name: 'selectedExerciseCopy',
              path: 'selectedExerciseCopy',
              requireAuth: true,
              builder: (context, params) => SelectedExerciseCopyWidget(
                chestWork: params.getParam('chestWork',
                    ParamType.DocumentReference, false, ['wChest']),
              ),
            ),
            FFRoute(
              name: 'planCopy',
              path: 'planCopy',
              requireAuth: true,
              builder: (context, params) => PlanCopyWidget(
                tweetLikes: params.getParam('tweetLikes',
                    ParamType.DocumentReference, false, ['users', 'tweets']),
              ),
            ),
            FFRoute(
              name: 'bootCopy',
              path: 'bootCopy',
              builder: (context, params) => BootCopyWidget(),
            ),
            FFRoute(
              name: 'routine',
              path: 'routine',
              requireAuth: true,
              builder: (context, params) => RoutineWidget(
                routine: params.getParam('routine', ParamType.DocumentReference,
                    false, ['workouts']),
                eirID: params.getParam('eirID', ParamType.DocumentReference,
                    false, ['workouts', 'exercisesInRoutine']),
              ),
            ),
            FFRoute(
              name: 'allExedescription',
              path: 'allExedescription',
              requireAuth: true,
              builder: (context, params) => AllExedescriptionWidget(
                docRef: params.getParam('docRef', ParamType.DocumentReference,
                    false, ['allexercise']),
              ),
            ),
            FFRoute(
              name: 'workoutCopy2',
              path: 'workoutCopy2',
              requireAuth: true,
              builder: (context, params) => WorkoutCopy2Widget(),
            ),
            FFRoute(
              name: 'allExercisesadmin',
              path: 'allExerciseadmin',
              requireAuth: true,
              builder: (context, params) => AllExercisesadminWidget(
                rourineId: params.getParam('rourineId',
                    ParamType.DocumentReference, false, ['suraWorkout']),
                srwRef: params.getParam('srwRef', ParamType.DocumentReference,
                    false, ['suraWorkout', 'adminSrw']),
                user: params.getParam(
                    'user', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'routineCopy2',
              path: 'myroutine',
              requireAuth: true,
              builder: (context, params) => RoutineCopy2Widget(
                allWork: params.getParam('allWork', ParamType.DocumentReference,
                    false, ['workouts']),
                srw: params.getParam('srw', ParamType.DocumentReference, false,
                    ['workouts', 'srw']),
                routine: params.getParam('routine', ParamType.DocumentReference,
                    false, ['workouts']),
              ),
            ),
            FFRoute(
              name: 'routineStart',
              path: 'routineStart',
              requireAuth: true,
              builder: (context, params) => RoutineStartWidget(
                allWork: params.getParam('allWork', ParamType.DocumentReference,
                    false, ['workouts']),
                srw: params.getParam('srw', ParamType.DocumentReference, false,
                    ['workouts', 'srw']),
                routine: params.getParam('routine', ParamType.DocumentReference,
                    false, ['workouts']),
                eirID: params.getParam('eirID', ParamType.DocumentReference,
                    false, ['workouts', 'exercisesInRoutine']),
              ),
            ),
            FFRoute(
              name: 'bootCopyCopy',
              path: 'bootCopyCopy',
              builder: (context, params) => BootCopyCopyWidget(),
            ),
            FFRoute(
              name: 'bootCopyCopy2',
              path: 'bootCopyCopy2',
              builder: (context, params) => BootCopyCopy2Widget(),
            ),
            FFRoute(
              name: 'adminUsers',
              path: 'adminUsers',
              requireAuth: true,
              builder: (context, params) => AdminUsersWidget(),
            ),
            FFRoute(
              name: 'adminRoutineOptions',
              path: 'adminRoutineOptions',
              requireAuth: true,
              builder: (context, params) => AdminRoutineOptionsWidget(
                uid: params.getParam(
                    'uid', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'adminRoutine',
              path: 'adminRoutine',
              requireAuth: true,
              builder: (context, params) => AdminRoutineWidget(
                routine: params.getParam('routine', ParamType.DocumentReference,
                    false, ['suraWorkout']),
                eirID: params.getParam('eirID', ParamType.DocumentReference,
                    false, ['suraWorkout', 'adminEir']),
                userId: params.getParam(
                    'userId', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'allExercise',
              path: 'allExercise',
              requireAuth: true,
              builder: (context, params) => AllExerciseWidget(
                rourineId: params.getParam('rourineId',
                    ParamType.DocumentReference, false, ['workouts']),
                srwRef: params.getParam('srwRef', ParamType.DocumentReference,
                    false, ['workouts', 'srw']),
              ),
            ),
            FFRoute(
              name: 'adminroutineCopy2Copy',
              path: 'myroutineadmin',
              requireAuth: true,
              builder: (context, params) => AdminroutineCopy2CopyWidget(
                allWork: params.getParam('allWork', ParamType.DocumentReference,
                    false, ['suraWorkout']),
                srw: params.getParam('srw', ParamType.DocumentReference, false,
                    ['suraWorkout', 'adminSrw']),
                routine: params.getParam('routine', ParamType.DocumentReference,
                    false, ['suraWorkout']),
                user: params.getParam(
                    'user', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'loginPageCopy',
              path: 'loginPageCopy',
              builder: (context, params) => LoginPageCopyWidget(),
            ),
            FFRoute(
              name: 'routineStartCopy',
              path: 'adminroutineStart',
              requireAuth: true,
              builder: (context, params) => RoutineStartCopyWidget(
                allWork: params.getParam('allWork', ParamType.DocumentReference,
                    false, ['suraWorkout']),
                srw: params.getParam('srw', ParamType.DocumentReference, false,
                    ['suraWorkout', 'adminSrw']),
                routine: params.getParam('routine', ParamType.DocumentReference,
                    false, ['suraWorkout']),
                eirID: params.getParam('eirID', ParamType.DocumentReference,
                    false, ['suraWorkout', 'adminEir']),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/boot';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Color(0xFF023960),
                  child: Image.asset(
                    'assets/images/sura_image.jpeg',
                    fit: BoxFit.fitWidth,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
