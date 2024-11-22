// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:flutter_jeleapps/core/modules/third_party_module.dart' as _i376;
import 'package:flutter_jeleapps/core/services/notifications/fcm_service.dart'
    as _i499;
import 'package:flutter_jeleapps/core/services/notifications/local_notifications_service.dart'
    as _i1023;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i163;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyModule = _$ThirdPartyModule();
    gh.factory<_i892.FirebaseMessaging>(
        () => thirdPartyModule.firebaseMessaging);
    gh.factory<_i163.FlutterLocalNotificationsPlugin>(
        () => thirdPartyModule.localNotifications);
    gh.singleton<_i1023.LocalNotificationsService>(() =>
        _i1023.LocalNotificationsService(
            gh<_i163.FlutterLocalNotificationsPlugin>()));
    await gh.singletonAsync<_i499.FcmService>(
      () => _i499.FcmService.init(
        gh<_i892.FirebaseMessaging>(),
        gh<_i1023.LocalNotificationsService>(),
      ),
      preResolve: true,
    );
    return this;
  }
}

class _$ThirdPartyModule extends _i376.ThirdPartyModule {}
