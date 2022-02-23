import 'package:dark_and_light_mode/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              top: 40.0,
              child: Align(
                alignment: Alignment.topCenter,
                child: Consumer<ThemeProvider>(
                  builder: (context, provider, child) {
                    return DropdownButton(
                      value: provider.currentTheme,
                      items: ["light","dark"].map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        provider.changeTheme(value ?? "light");
                      },
                    );
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
