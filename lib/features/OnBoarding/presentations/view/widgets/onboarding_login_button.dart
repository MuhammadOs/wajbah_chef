import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

class OnboardingLoginButton extends StatelessWidget {
  const OnboardingLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: wajbah_primary, borderRadius: BorderRadius.circular(15)),
      width: MediaQuery.of(context).size.width * .3,
      height: MediaQuery.of(context).size.height * 0.06,
      child: TextButton(
        child: const Padding(
          padding: EdgeInsets.only(left: 13),
          child: Row(
            children: [
              Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
              SizedBox(
                width: 7,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              )
            ],
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'login');
        },
      ),
    );
  }
}
