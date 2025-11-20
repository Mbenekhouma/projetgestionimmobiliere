import 'package:flutter/material.dart';
import '../widgets/bottom_navbar_widget.dart';
import '../widgets/widgets_login/header_login.dart';
import '../widgets/widgets_login/login_form.dart';
import '../widgets/widgets_login/register_form.dart';
import './home_screen.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  String _activeTab = 'accueil';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color mainColor = Colors.indigo;

    return Scaffold(
      appBar: buildHeader(mainColor, _tabController, context),

      body: TabBarView(
        controller: _tabController,
        children: [
          LoginForm(tabController: _tabController),
          RegisterForm(tabController: _tabController),
        ],
      ),

      bottomNavigationBar: BottomNavbarWidget(
        activeTab: _activeTab,

      ),
    );
  }
}
