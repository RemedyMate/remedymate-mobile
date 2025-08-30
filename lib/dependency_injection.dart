// It's likely your project uses the 'get_it' package for this.
import 'package:get_it/get_it.dart';
import 'package:remedy_mate/features/Chatbot/presentation/bloc/chatbot_bloc.dart';
// ... other imports for other services

final sl = GetIt.instance; // sl stands for Service Locator

Future<void> init() async {
  // ======================================================
  // BLoCs
  // ======================================================
  // We use registerFactory because we want a new instance of the BLoC
  // every time a feature requests one. This is standard for UI state.

  sl.registerFactory(() => ChatbotBloc()); // <-- ADD THIS LINE

  // ======================================================
  // Use Cases
  // ======================================================
  // (Your use cases will be registered here later)

  // ======================================================
  // Repositories
  // ======================================================
  // (Your repositories will be registered here later)

  // ======================================================
  // Core
  // ======================================================
  // (Core services like network info, API clients etc. are registered here)
}