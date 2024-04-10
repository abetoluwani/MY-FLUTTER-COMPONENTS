import 'package:intl/intl.dart';

class AppFormatters{
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static String formatCurrency(double amount){
    return NumberFormat.currency(locale: 'en_NG', symbol: '₦').format(amount);
  }

 
}