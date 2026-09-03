import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_bite/features/auth/data/register_form_notifier.dart';
import 'package:quick_bite/features/auth/data/register_form_state.dart';

final registerFormStatusProvider =
    NotifierProvider<RegisterFormNotifier, RegisterFormState>(
      RegisterFormNotifier.new,
    );
