import 'package:flutter/material.dart';
import 'package:pos_app/components/customized_buttons.dart';

import '../utils/constants.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PrivacyText(
                  title: "1. Data Usage:",
                  text:
                      "Your information is used to operate and enhance our app, process transactions, communicate with you, provide customer support, and improve our services."),
              PrivacyText(
                  title: "2. Customer Support",
                  text:
                      "Information you provide when contacting customer support is collected to assist you and improve our support services."),
              PrivacyText(
                  title: "3. Data Usage:",
                  text:
                      "Your information is used to operate and enhance our app, process transactions, communicate with you, provide customer support, and improve our services."),
              PrivacyText(
                  title: "4. Data Protection:",
                  text:
                      "We employ advanced security measures, including encryption and access controls, to protect your personal information from unauthorized access, alteration, or disclosure."),
              PrivacyText(
                  title: "5. Third-Party Services:",
                  text:
                      "Our POS app may include links to third-party websites and services. We are not responsible for the privacy practices of these third parties, and we encourage you to review their privacy policies."),
              PrivacyText(
                  title: "6. Cookies and Tracking:",
                  text:
                      "We use cookies and similar technologies to track user activity and preferences. You can manage your cookie settings through your browser settings, but this may affect your ability to use some features of our app."),
              PrivacyText(
                  title: "7. Data Sharing:",
                  text:
                      "We do not sell or trade your personal information to third parties. We may share your information with trusted partners who assist us in operating our app and conducting our business, provided they agree to keep this information confidential."),
              PrivacyText(
                  title: "8. Policy Changes:",
                  text:
                      "We may update this Privacy Policy from time to time. Changes will be posted on this page, Your continued use of the app after such changes signifies your acceptance of the updated policy."),
              PrivacyText(
                  title: "9. Transaction Information:",
                  text:
                      "We collect details of your transactions, including items purchased, amounts, dates, and payment methods. This information is crucial for processing orders and managing your account."),
              PrivacyText(
                  title: "10. Analytics:",
                  text:
                      "We use analytics tools to better understand how users interact with our app. This data helps us improve the app's performance and user experience. Analytics data is collected and stored anonymously."),
              PrivacyText(
                  title: "11. Data Minimization:",
                  text:
                      "We only collect data that is necessary for the purposes outlined in this policy. We avoid collecting excessive or irrelevant data and ensure that the data we do collect is handled responsibly."),
              PrivacyText(
                  title: "12. Contact Information:",
                  text:
                      "If you have any questions or concerns about our Privacy Policy, please contact us, We are here to assist you with any inquiries."),
            ],
          ),
        ),
      ),
    );
  }
}
