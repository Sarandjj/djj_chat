import 'dart:developer';

import 'package:googleapis_auth/auth_io.dart';

class NotificationAccessToken {
  static String? _token;

  //to generate token only once for an app run
  static Future<String?> get getToken async => _token ?? await _getAccessToken();

  // to get admin bearer token
  static Future<String?> _getAccessToken() async {
    try {
      const fMessagingScope = 'https://www.googleapis.com/auth/firebase.messaging';

      final client = await clientViaServiceAccount(
        // To get Admin Json File: Go to Firebase > Project Settings > Service Accounts
        // > Click on 'Generate new private key' Btn & Json file will be downloaded

        // Paste Your Generated Json File Content
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "sarandjjtheday",
          "private_key_id": "c3e0e63f40034eef25c8518dbf643c868f80a279",
          "private_key":
              "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDi/aGJa1Pu0L93\nHdG4tN+jV8mpZFOnpgFnczMPhewV/F1xUAvLOAvmKLxc/tqklsuo4ut1NKwJUtjk\nC9SCDuw8Vx+fI872e6X5dHnRB+VxKiHJAuWfCce79DMt0FxCyttpBNiyUFGMmvNB\nC/iCJSLsGlnq6Uhm88GwM9o2k8NUnP+YVPlitPLpQ0wFv9scCnTKOR402ZON6k9c\njaawrvK5jaNW3SnAlTKUp3MndQqRX8TnJ0NnkizOvmGc1gFijbXnSx83sG+3LHIi\nKdocgJvOtT2Z7/ze9q0aHTXSSshMvCNy6+vFCjUWWZlYsAGzuY3MRXKWdVF9ZYR8\n8sO+YcxpAgMBAAECggEAA2cBLIR4U0RmakxUdWv4oi58WQFQ+QVVpg2lqUjnm1jC\nCc3FBNHH6TZDxIe+vT1+u1RTaoP/RCXYFxWk+iIWdme+k0MVJMABDTaAEPBeXGOL\nnW4MBRCUzC4X36BCPG9lTzNXEC0rW8Etfj8bWtALBaD2J2hBwTv2yO5YtKgNrc9O\nvHpwCzeWJdPo/jNpydgFosdJgqQCXzj56RVLrhxQ/sQYcqo7O6ieaaIcD+eUS9wl\n4DOC6FpGz68alKXRjW+PqlCIsZl46j0utIkBxXNT/kb2c5Uq28SftPScpCS1qLT/\n+6wBzVaI6AT8tblV0pP/ueij2skHzBskWIoD9ztOAQKBgQD1mLheXJXT4BNtM0ZH\ny9QbYU+gAVvP03lv/GjkwwUu2QbX/twnwz6XMrztLJOUM8GfQGOK/qN+FrzNFLwh\nShBNFB7GOUYhw98l6INvTzHdbbtMV+36zRRPtfDQOew1KUoow5L1IOeMLoMT7mAJ\nz3L92vZz6HwHXW/HfIe+JfXKwQKBgQDsmyWiUuwfGgY4cOc0pacnFA/mdihIfTHy\nCWVGeE4tv2f8v0llOLUwCOn+os2aph+mNkGmjO8/c31MUnyBV9+3u8D6AyZTlc58\nKb3KrALhDh2hBf6XliU3XamBSHJCJ+CkmPAp+iI/pqC7yHctVo22+GxUveaMSF6O\nnEB/qtqzqQKBgQCmVZK4xffrkZ1Wnh2BTrkO+i8VbRYjgVSD1e2s0bBW9EHAVCoC\n/CcN/B0cfM5O12bRVqiUYLWWFgw00VBBM4oqye+1zOCEycX+RKWP45EgKMtrfzn8\nXJzfB5hbTn992cMSLLMBNhHcTTwVaaK9wjRdXckA43ns+wlTkDHXRJpdgQKBgAax\nhOkIq4FdvRtPplrI7OegG6sLYKxcTlNojKLnuF528bwmtS7V4dpQBj6b4HEljfOn\nyUeq6QHEhKDqHHeUQtHxz83C1Qy8SjEdBS98mkA/o/rwLnmfV8IvNiJgKEtS0XoW\nkYS+fMWMMzPcwfJYZn3snTPwg1somPQz22dBMBqxAoGBAICJWcd0lIL8D+I1Dx5W\nx8y3FRvPpVVrnNmXoqrDPRD9yQ+nTrkgZAM13qWVzGjtrFK1Fiy3O7GKTpyQLiA3\ncjbH+E4Fy7aKoM5vWiaxbGVJTnX2CVxXXhfNjEJaL4r9xG6EJq+IAazNR6K5BxDd\nUTeE9gBO+ard2LvVOKrXe8Vy\n-----END PRIVATE KEY-----\n",
          "client_email": "puh-noti@sarandjjtheday.iam.gserviceaccount.com",
          "client_id": "114460513706394786449",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url":
              "https://www.googleapis.com/robot/v1/metadata/x509/puh-noti%40sarandjjtheday.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }),
        [fMessagingScope],
      );

      _token = client.credentials.accessToken.data;

      return _token;
    } catch (e) {
      log('$e');
      return null;
    }
  }
}
