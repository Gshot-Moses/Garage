import 'package:garage/features/home/appointments/models.dart';

class AppointmentState {
  const AppointmentState({
    this.isLoading = false,
    this.appointments,
    this.hasError = false
  });

  final bool isLoading;
  final List<GetAppointmentsApiResponse>? appointments;
  final bool hasError;

  AppointmentState copy({bool? isLoading, List<GetAppointmentsApiResponse>? appointments, bool? hasError}) {
    return AppointmentState(
      isLoading: isLoading ?? this.isLoading,
      appointments: appointments ?? this.appointments,
      hasError: hasError ?? this.hasError
    );
  }
}

// class Loading extends HomeState {
//   const Loading();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class Success extends HomeState {
//   const Success({
//     required this.companies,
//   });
//
//   final List<CompanyApiResponse> companies;
//
//   @override
//   List<Object?> get props => [
//     companies,
//   ];
// }