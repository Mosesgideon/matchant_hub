import 'package:flutter/material.dart';
import 'package:marchant_hub/core/theme/pallets.dart';


class AppPromptWidget extends StatelessWidget {
  final String? message;
  final String? title;
  final String? retryText;
  final VoidCallback? onTap;
  final String? imagePath;
  final bool? isSvgResource;
  final bool? canTryAgain;

  const AppPromptWidget({
    Key? key,
    this.message = 'Ooops an error occured',
    this.title,
    this.onTap,
    this.imagePath,
    this.isSvgResource = false,
    this.canTryAgain = true,
    this.retryText = 'Try again',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath ?? '',
            height: 150,
          ),
          if (title != null)
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Pallets.primary),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          if (message != null)
            Column(
              children: [
                Text(
                  message!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.blueGrey),
                ),
                // const SizedBox(
                //   height: 16,
                // ),
              ],
            ),
          if (canTryAgain!)
            Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                OutlinedButton(
                  onPressed: onTap,
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.secondary,
                      side: const BorderSide(
                        color: Pallets.primary,
                      ),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(16))),
                  child: Text(retryText!,style: TextStyle(color: Pallets.primary),),
                )
              ],
            )
        ],
      )),
    );
  }
}
