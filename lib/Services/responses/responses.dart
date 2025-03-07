class ServiceResponse<T> {
  dynamic error;
  String? message;
  dynamic results; // Can be a single object or a List<T>
  int? totalRecords;
  int? totalPages;
  int? pageSize;
  int? pageNumber;
  bool isError;

  ServiceResponse({
    this.error,
    this.message,
    this.results,
    this.totalRecords,
    this.totalPages,
    this.pageSize,
    this.pageNumber,
    required this.isError,
  });

  factory ServiceResponse.fromJson(
    bool isError,
    Function(Map<String, dynamic>)? fn,
    dynamic json, // Accepts both List and Map responses
  ) {
    dynamic parsedResults;

    if (json is List && fn != null) {
      // ✅ If response is a list, map each item
      parsedResults =
          json.map((item) => fn(item as Map<String, dynamic>)).toList();
    } else if (json is Map<String, dynamic> &&
        json['results'] != null &&
        fn != null) {
      // ✅ If response is wrapped in a map with a "results" key
      if (json['results'] is List) {
        parsedResults =
            (json['results'] as List).map((item) => fn(item)).toList();
      } else {
        parsedResults = fn(json['results']);
      }
    }

    return ServiceResponse<T>(
      error: json is Map<String, dynamic> ? json['error'] : null,
      message: json is Map<String, dynamic> ? json['message'] : null,
      results: parsedResults,
      totalRecords: json is Map<String, dynamic> ? json['totalRecords'] : null,
      totalPages: json is Map<String, dynamic> ? json['totalPages'] : null,
      pageSize: json is Map<String, dynamic> ? json['pageSize'] : null,
      pageNumber: json is Map<String, dynamic> ? json['pageNumber'] : null,
      isError: isError,
    );
  }
}
