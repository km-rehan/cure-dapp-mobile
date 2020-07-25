import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionModel {
  PermissionStatus status;
  Permission permission;

  PermissionModel(this.status, this.permission);
}
