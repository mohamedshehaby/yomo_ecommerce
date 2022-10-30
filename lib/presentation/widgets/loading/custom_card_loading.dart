import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class CustomCardLoading extends StatelessWidget {
  const CustomCardLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CardLoading(
                        height: 30,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        width: 100,
                        margin: EdgeInsets.only(bottom: 10),
                      ),
                      CardLoading(
                        height: 100,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        margin: EdgeInsets.only(bottom: 10),
                      ),
                      CardLoading(
                        height: 30,
                        width: 200,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        margin: EdgeInsets.only(bottom: 10),
                      ),
                    ],
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ),
      ],
    );
  }
}
