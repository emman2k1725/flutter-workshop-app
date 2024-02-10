import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/styles/textstyles.dart';

class ThreadContainer extends StatelessWidget {
  const ThreadContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Icon(
              Icons.person_pin,
              size: 30,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'nkcardel',
                      style: TextStyles.titleText,
                    ),
                    Row(
                      children: [
                        Text(
                          '26m',
                          style:
                              TextStyles.bodyText.copyWith(color: Colors.grey),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.more_horiz,
                          size: 25,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipi scing elit. Praesent eget diam sed turpis ullamcorper bibendum. Nullam imperdiet dui arcu, ut tincidunt tellus gravida id. Donec vel justo condimentum quam congue',
                  style: TextStyles.bodyText,
                  overflow: TextOverflow.clip,
                ),
                const SizedBox(height: 12),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border_rounded,
                      size: 22,
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.mode_comment_outlined,
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.compare_arrows_rounded,
                      size: 22,
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.share_outlined,
                      size: 21,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '25 replies · View Activity',
                  style: TextStyles.bodyText.copyWith(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}