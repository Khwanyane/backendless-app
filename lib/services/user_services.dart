import 'package:asignment_2/models/unit_entry.dart';
import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';

class UserServices with ChangeNotifier {
  BackendlessUser? _thisUser;
  BackendlessUser? get thisUser => _thisUser;

  void setUserNull() {
    _thisUser = null;
  }

  bool _registeredUser = false;
  bool get registeredUser => _registeredUser;

  set registeredUser(bool value) {
    _registeredUser = value;
    notifyListeners();
  }

  Future<String> registerNewUser(BackendlessUser user) async {
    String results = 'OK';
    notifyListeners();

    try {
      await Backendless.userService.register(user);
      UnitEntry newEntry = UnitEntry(username: user.email, units: {});
      await Backendless.data
          .of('UnitEntry')
          .save(newEntry.toJson())
          .onError((error, stackTrace) {
        results = error.toString();
      });
    } catch (e) {
      results = e.toString();
    }

    notifyListeners();
    return results;
  } // Registering  A New User

  void verifyingUserDetails(String username) async {
    String results;

    DataQueryBuilder queryBuilder = DataQueryBuilder()
      ..whereClause = "email = '$username'";

    await Backendless.data
        .withClass<BackendlessUser>()
        .find(queryBuilder)
        .then((value) {
      if (value != null && value.isNotEmpty) {
        _registeredUser = true;
        notifyListeners();
      } else {
        _registeredUser = false;
        notifyListeners();
      }
    }).onError((error, stackTrace) {
      results = error.toString();
      print(results);
    });
  }

  Future<String> resetUserPassword(String username) async {
    String results = 'OK';

    notifyListeners();

    await Backendless.userService
        .restorePassword(username)
        .onError((error, stackTrace) {
      results = error.toString();
    });

    notifyListeners();
    return results;
  } //Reset password

  Future<String> userLogin(String username, String password) async {
    String results = 'OK';
    notifyListeners();

    BackendlessUser? user = await Backendless.userService
        .login(username, password, true)
        .onError((error, stackTrace) {
      results = error.toString();
    });
    if (user != null) {
      _thisUser = user;
    }

    notifyListeners();
    return results;
  } //Logging in a user

  Future<String> validLogin() async {
    String results = 'OK';
    bool? isLoginValid = await Backendless.userService
        .isValidLogin()
        .onError((error, stackTrace) {
      results = error.toString();
    });
    if (isLoginValid != null && isLoginValid) {
      String? userObjectId = await Backendless.userService
          .loggedInUser()
          .onError((error, stackTrace) {
        results = error.toString();
      });
      if (userObjectId == null) {
        results = 'NOT OK';
      } else {
        Map<dynamic, dynamic>? usersMap = await Backendless.data
            .of("Users")
            .findById(userObjectId)
            .onError((error, stackTrace) {
          results = error.toString();
        });
        if (usersMap == null) {
          results = 'NOT OK';
        } else {
          _thisUser = BackendlessUser.fromJson(usersMap);
        }
      }
    } else {
      results = 'NOT OK';
    }
    return results;
  } // Checking if the user has already logged in

  Future<String> loggingUserOut() async {
    String results = 'OK';
    notifyListeners();

    await Backendless.userService.logout().onError((error, stackTrace) {
      results = error.toString();
    });

    notifyListeners();
    return results;
  } //Logging out the user
}
