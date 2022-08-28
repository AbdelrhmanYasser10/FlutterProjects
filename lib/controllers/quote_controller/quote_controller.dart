import 'package:get/get.dart';
import 'package:note_application/shared/constants/all_quotes.dart';
import '../../models/qoute_model/quote_model.dart';

class QuoteController extends GetxController{
  static List<Quote> quotes = [];
  Future<void> getAllQuotes() async{
    for (var element in allQuotes) {
      quotes.add(Quote.fromJson(element));
    }
  }
}