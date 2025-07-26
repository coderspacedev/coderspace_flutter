/// Extension on [DateTime] to provide commonly used formatted outputs.
extension DateTimeExtensions on DateTime {
  /// Returns the date in `dd/MM/yyyy` format.
  ///
  /// Example:
  /// ```dart
  /// DateTime(2025, 7, 26).formattedDate; // "26/07/2025"
  /// ```
  String get formattedDate =>
      "${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year";

  /// Returns a relative time description like:
  /// - `just now` (if < 60 seconds),
  /// - `x min ago` (if < 60 minutes),
  /// - `x hours ago` (if < 24 hours),
  /// - otherwise, it falls back to [formattedDate].
  ///
  /// Example:
  /// ```dart
  /// DateTime.now().subtract(Duration(minutes: 5)).timeAgo; // "5 min ago"
  /// ```
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) return 'just now';
    if (difference.inMinutes < 60) return '${difference.inMinutes} min ago';
    if (difference.inHours < 24) return '${difference.inHours} hours ago';

    return formattedDate;
  }
}

