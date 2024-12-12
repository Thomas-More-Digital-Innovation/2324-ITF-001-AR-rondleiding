import 'package:flutter/material.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({Key? key}) : super(key: key);

  @override
  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  late String selectedLanguage;

  @override
  void initState() {
    super.initState();
    final Locale deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
    selectedLanguage = deviceLocale.languageCode == 'nl' ? 'Dutch' : 'English';
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      right: 30,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blue.shade900, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedLanguage,
            icon: const Icon(
              Icons.arrow_drop_down_rounded,
              size: 30,
              color: Colors.orange,
            ),
            items: const [
              DropdownMenuItem(
                value: 'English',
                child: Text(
                  'English',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              DropdownMenuItem(
                value: 'Dutch',
                child: Text(
                  'Dutch',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedLanguage = value;
                });
                // Add any logic to update app state or perform navigation here.
              }
            },
            dropdownColor: Colors.white, // Dropdown background color
            style: const TextStyle(
              color: Colors.black, // Text color
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
