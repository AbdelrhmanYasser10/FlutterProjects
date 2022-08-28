import 'package:flutter/material.dart';
import 'package:note_application/models/qoute_model/quote_model.dart';
import 'package:note_application/shared/style/themes/themes.dart';

class FilledCard extends StatelessWidget {
  final Quote quote;
  const FilledCard({Key? key,required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Center(
          child: Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.surfaceVariant,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),

              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.50,
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\" ${quote.text} \"",
                          style: quoteStyle,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Align(
                          alignment:Alignment.bottomRight,
                            child: Text(
                              quote.author,
                              style: authorStyle,
                            ),
                        ),
                      ],
                    ),
                  ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
