import 'package:material_ui/material_ui.dart';

const Color kBlue = Color(0xFF00559F);
const Color kTextDark = Color(0xFF1B2333);
const Color kBorder = Color(0xFFE3E8F2);

void main() => runApp(const PinoySweetsApp());

/// App root: MaterialApp -> LoginScreen
class PinoySweetsApp extends StatelessWidget {
  const PinoySweetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinoy Sweets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: kBlue),
      ),
      home: const LoginScreen(),
    );
  }
}

/// Custom StatelessWidget: the static Login screen from my Figma wireframe.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      appBar: AppBar(
        title: const Text('Pinoy Sweets'),
        centerTitle: true,
        backgroundColor: kBlue,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            child: Column(
              children: [
                // Logo circle
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F3FF),
                    shape: BoxShape.circle,
                    border: Border.all(color: kBlue, width: 2),
                  ),
                  child: const Icon(Icons.icecream_outlined,
                      size: 44, color: kBlue),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Welcome to Pinoy Sweets',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: kTextDark,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Crave. Click. Kain.',
                  style: TextStyle(fontSize: 14, color: kTextDark),
                ),
                const SizedBox(height: 48),

                // Input fields (visual only)
                _buildField('Email Address', 'Enter your email'),
                const SizedBox(height: 16),
                _buildField('Password', 'Enter your password',
                    isPassword: true),
                const SizedBox(height: 48),

                // Buttons (visual only, no behavior)
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kBlue,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Login', style: TextStyle(fontSize: 17)),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: kBlue,
                      side: const BorderSide(color: kBlue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child:
                        const Text('Sign Up', style: TextStyle(fontSize: 17)),
                  ),
                ),
                const SizedBox(height: 16),

                // Row: centered "Forgot Password" action
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: kBlue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Label + text field, written as a helper to keep build() readable.
  Widget _buildField(String label, String hint, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: kTextDark,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 13),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: isPassword
                ? const Icon(Icons.visibility_off_outlined, size: 20)
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kBorder),
            ),
          ),
        ),
      ],
    );
  }
}