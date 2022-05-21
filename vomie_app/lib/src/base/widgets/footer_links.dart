import 'package:flutter/material.dart';
import 'package:zoomie/src/base/widgets/localized_text.dart';
import 'package:zoomie/src/styling/variables.dart';

class FooterLinks extends StatelessWidget {
  const FooterLinks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          child: LocalizedText(
            (x) => x.commonTermsOfUse,
          ),
          onPressed: () {},
        ),
        const SizedBox(
          width: paddingLarge,
        ),
        TextButton(
          child: LocalizedText(
            (x) => x.commonPrivacyPolicy,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
