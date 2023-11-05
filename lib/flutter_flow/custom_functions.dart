import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? retrieveTime(DateTime og) {
  var time = DateFormat('h:mm a').format(og);
  var day = DateFormat('d/M/y,').format(og);
  var now = DateTime.now();
  if (now.year == og.year && now.month == og.month) {
    if (now.day == og.day) {
      day = "Today";
    } else if (og.day - now.day <= 1) {
      day = "Tomorrow";
    }
  }
  return day + "\n" + time;
}
