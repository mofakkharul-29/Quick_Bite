import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_bite/features/auth/data/login_form_notifier.dart';
import 'package:quick_bite/features/auth/data/login_form_state.dart';

final loginFormStatusProvider =
    NotifierProvider<LoginFormNotifier, LoginFormState>(LoginFormNotifier.new);
