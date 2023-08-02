import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/widgets/circular_image_with_gradient_border.dart';
import 'package:video_player/video_player.dart';

class NewsFeedVideoCard extends StatefulWidget {
  const NewsFeedVideoCard({super.key});

  @override
  State<NewsFeedVideoCard> createState() => _NewsFeedVideoCardState();
}

class _NewsFeedVideoCardState extends State<NewsFeedVideoCard> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      ),
    );

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        VideoPlayer(_controller),
                        InkWell(
                          onTap: () {
                            // Wrap the play or pause in a call to `setState`. This ensures the
                            // correct icon is shown.
                            setState(() {
                              // If the video is playing, pause it.
                              if (_controller.value.isPlaying) {
                                _controller.pause();
                              } else {
                                // If the video is paused, play it.
                                _controller.play();
                              }
                            });
                          },
                          // Display the correct icon depending on the state of the player.
                          child: _controller.value.isPlaying
                              ? null
                              : Icon(Icons.play_circle_outline_outlined, color: Colors.white, size: 60),
                        )
                      ],
                    ),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircularImageWithBorder(
                        backgroundImageURL: 'lib/assets/images/desktop.png',
                        foregroundImageURL: "https://i.imgur.com/OB0y6MR.jpg",
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'name',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  InkWell(
                    child: Icon(Icons.more_vert_outlined, color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    child: Icon(
                      Icons.favorite_border_outlined,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Icon(
                      Icons.maps_ugc_outlined,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Icon(
                      Icons.send_outlined,
                      size: 30,
                    ),
                  ),
                ],
              ),
              InkWell(
                child: Icon(
                  Icons.bookmark_border_outlined,
                  size: 30,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
