import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yomo_ecommerce/presentation/widgets/loading/loading_screen/loading_screen_controller.dart';

// Vandad Implementation
class LoadingScreen {
  // Singleton pattern
  // Cause in all the app there's only one Loading Screen
  LoadingScreen._sharedInstance();

  static final LoadingScreen _shared = LoadingScreen._sharedInstance();

  factory LoadingScreen.instance() => _shared;

  LoadingScreenController? _controller;

  void show({
    required BuildContext context,
    required String text,
  }) {
    if (_controller?.update(text) ?? false) {
      return;
    } else {
      _controller = _showOverLay(
        context: context,
        text: text,
      );
    }
  }

  void hide() {
    _controller?.close();
    _controller = null;
  }

// Return LoadingScreenController and build ui
  LoadingScreenController _showOverLay({
    required BuildContext context,
    required String text,
  }) {
    final textStream = StreamController<String>();
    textStream.add(text);

    // Get the Overlay State to control overlays
    final overlayState = Overlay.of(context);

    // Get the size of the current widget
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final overlayEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(150),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: size.width * 0.8,
                maxHeight: size.height * 0.8,
                minWidth: size.width * 0.5,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      const CircularProgressIndicator.adaptive(),
                      const SizedBox(height: 10),
                      StreamBuilder(
                        stream: textStream.stream,
                        builder: (context, snapshot) {
                          return (snapshot.hasData)
                              ? Text(
                                  snapshot.data as String,
                                  textAlign: TextAlign.center,
                                )
                              : Container();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    overlayState?.insert(overlayEntry);

    // This will control the overlay
    return LoadingScreenController(
      close: () {
        textStream.close();
        overlayEntry.remove();
        return true;
      },
      update: (text) {
        textStream.add(text);
        return true;
      },
    );
  }
}

// My Implementation
// class LoadingScreen {
//   // Singleton pattern
//   // Cause in all the app there's only one Loading Screen
//   LoadingScreen._sharedInstance();
//
//   static final LoadingScreen _shared = LoadingScreen._sharedInstance();
//
//   factory LoadingScreen.instance() => _shared;
//
//   final textStream = StreamController<String>();
//
//   late final OverlayEntry overlayEntry;
//
//   bool isShown = false;
//
//   void show({
//     required BuildContext context,
//     required String text,
//   }) {
//     if (!isShown) {
//       _showOverlay(context, text);
//       isShown = true;
//     } else {
//       update(text);
//     }
//   }
//
//   hide() {
//     isShown = false;
//     close();
//   }
//
//   _showOverlay(BuildContext context, String text) {
//     // Get the Overlay State to control overlays
//     final overlayState = Overlay.of(context);
//
//     // Get the size of the current widget
//     final renderBox = context.findRenderObject() as RenderBox;
//     final size = renderBox.size;
//     textStream.add(text);
//     overlayEntry = OverlayEntry(
//       builder: (context) {
//         return Material(
//           color: Colors.black.withAlpha(AppSize.s150.toInt()),
//           child: Center(
//             child: Container(
//               constraints: BoxConstraints(
//                 maxWidth: size.width * 0.8,
//                 maxHeight: size.height * 0.8,
//                 minWidth: size.width * 0.5,
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(AppSize.s10),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(AppPadding.p16),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const SizedBox(height: AppSize.s10),
//                       const CircularProgressIndicator.adaptive(),
//                       const SizedBox(height: AppSize.s20),
//                       StreamBuilder(
//                         stream: textStream.stream,
//                         builder: (context, snapshot) {
//                           return (snapshot.hasData)
//                               ? Text(
//                                   snapshot.data as String,
//                                   textAlign: TextAlign.center,
//                                 )
//                               : Container();
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//     overlayState?.insert(overlayEntry);
//   }
//
//   close() {
//     textStream.close();
//     overlayEntry.remove();
//     return true;
//   }
//
//   update(text) {
//     textStream.add(text);
//     return true;
//   }
//
//
// }
