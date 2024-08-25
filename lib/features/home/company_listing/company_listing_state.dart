import 'models.dart';

class CompanyListingState {

  final bool isLoading;
  final bool hasFailed;
  List<CompanyApiResponse> companies;

  CompanyListingState({
    this.isLoading = false,
    this.hasFailed = false,
    required this.companies,
  });

  CompanyListingState copy({bool? isLoading, bool? hasFailed, List<CompanyApiResponse>? companies}) {
    return CompanyListingState(
        isLoading: isLoading ?? this.isLoading,
        hasFailed: hasFailed ?? this.hasFailed,
        companies: companies ?? this.companies
    );
  }
}