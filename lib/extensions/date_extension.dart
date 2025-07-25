extension DateTimeExtensions on DateTime {
  String get formattedDate =>
      "${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year";
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);
    if (difference.inSeconds < 60) return 'just now';
    if (difference.inMinutes < 60) return '${difference.inMinutes} min ago';
    if (difference.inHours < 24) return '${difference.inHours} hours ago';
    return formattedDate;
  }
}
