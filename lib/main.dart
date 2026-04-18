import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://zhbmfewhdjqbduqgrwed.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpoYm1mZXdoZGpxYmR1cWdyd2VkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzY1MDkzMTAsImV4cCI6MjA5MjA4NTMxMH0.rkpUZGd8sEaOanFqU-eGx_SsIrRHJ9SUfZwbA33ntlw',
  );

  runApp(const ProviderScope(child: PettyApp()));
}