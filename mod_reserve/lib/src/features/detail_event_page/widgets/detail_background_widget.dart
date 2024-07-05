import 'package:common/common_theme_export.dart';
import 'package:common/common_widgets_export.dart';
import 'package:core/domain/entities/brand_service_detail_programme/brand_service_detail_programme.dart';
import 'package:flutter/material.dart';
import 'package:mod_reserve/src/common/utils/constants/app_assets.dart';
import 'package:mod_reserve/src/common/utils/extensions/context_extension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

class DetailBackgroundWidget extends StatefulWidget {
  final List<BrandServiceDetailProgramme>? brandServiceDetailProgramme;
  final PageController pageController;
  final VoidCallback onBackButtonTap;

  const DetailBackgroundWidget({
    required this.brandServiceDetailProgramme,
    required this.pageController,
    required this.onBackButtonTap,
    super.key,
  });

  @override
  State<DetailBackgroundWidget> createState() => DetailBackgroundWidgetState();
}

class DetailBackgroundWidgetState extends State<DetailBackgroundWidget> {
  final List<VideoPlayerController> _videoPlayers = [];

  @override
  void initState() {
    super.initState();

    if (widget.brandServiceDetailProgramme!.isNotEmpty) {
      if (widget
          .brandServiceDetailProgramme!.first.brandServiceVideos!.isNotEmpty) {
        final videos = widget.brandServiceDetailProgramme!
            .expand((detail) => detail.brandServiceVideos!);
        for (final video in videos) {
          final videoUrl = video.video;
          final videoController = VideoPlayerController.networkUrl(
            Uri.parse(
              videoUrl,
            ),
          );

          videoController.initialize().then((_) {
            videoController
              ..play()
              ..setLooping(true)
              ..setVolume(0);
            setState(() {});
          });
          _videoPlayers.add(videoController);
        }
      }
    }
  }

  @override
  void dispose() {
    super.dispose();

    for (final controller in _videoPlayers) {
      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.brandServiceDetailProgramme!.isEmpty) {
      return _LoaderWidget(
        widget: widget,
      );
    }
    final detailProgramme = widget.brandServiceDetailProgramme!.first;
    return SizedBox(
      width: context.deviceWidth,
      child: Stack(
        children: [
          _VideoPhotoSlider(
            widget: widget,
            videoPlayers: _videoPlayers,
            detailProgramme: detailProgramme,
          ),
          CustomAppBar(
            backgroundColor: context.theme.transparent,
            svgAssetPath: AppAssets.arrowLeftIcon,
            onTap: widget.onBackButtonTap,
          ),
          Positioned(
            top: (context.deviceHeight / 2) - 90,
            width: context.adaptiveDeviceWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  effect: ScaleEffect(
                    activeDotColor: context.theme.mainColor,
                    dotColor: context.theme.secondaryColor,
                  ),
                  controller: widget.pageController,
                  count: detailProgramme.brandServiceVideos != null
                      ? detailProgramme.brandServicePhotos.length +
                          detailProgramme.brandServiceVideos!.length
                      : detailProgramme.brandServicePhotos.length,
                  onDotClicked: widget.pageController.jumpToPage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VideoPhotoSlider extends StatefulWidget {
  const _VideoPhotoSlider({
    required this.widget,
    required List<VideoPlayerController> videoPlayers,
    required this.detailProgramme,
  }) : _videoPlayers = videoPlayers;

  final DetailBackgroundWidget widget;
  final List<VideoPlayerController> _videoPlayers;
  final BrandServiceDetailProgramme detailProgramme;

  @override
  State<_VideoPhotoSlider> createState() => _VideoPhotoSliderState();
}

class _VideoPhotoSliderState extends State<_VideoPhotoSlider> {
  bool isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight / 2,
      child: PageView(
        controller: widget.widget.pageController,
        children: [
          for (final videoController in widget._videoPlayers)
            Stack(
              children: [
                SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: SizedBox(
                      height: videoController.value.size.height,
                      width: videoController.value.size.width,
                      child: VideoPlayer(
                        videoController,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: (context.deviceHeight / 2) / 10,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            isPlaying == true
                                ? Icons.pause_outlined
                                : Icons.play_arrow_rounded,
                            color:
                                context.theme.quaternaryColor.withOpacity(.4),
                            // TODO(dev): remove magic number
                            size: 150,
                          ),
                          onPressed: () {
                            isPlaying == true
                                ? videoController.pause()
                                : videoController.play();

                            setState(() {
                              isPlaying = !isPlaying;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          for (final photoPath in widget.detailProgramme.brandServicePhotos)
            Image.network(
              photoPath.image,
              fit: BoxFit.cover,
              width: context.deviceWidth,
              height: context.deviceHeight / 1.8,
            ),
        ],
      ),
    );
  }
}

class _LoaderWidget extends StatelessWidget {
  const _LoaderWidget({
    required this.widget,
  });

  final DetailBackgroundWidget widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.deviceWidth,
      child: Stack(
        children: [
          SizedBox(
            height: context.deviceHeight / 1.9,
            child: PageView(
              controller: widget.pageController,
              children: const [
                Placeholder(),
              ],
            ),
          ),
          CustomAppBar(
            backgroundColor: context.theme.transparent,
            svgAssetPath: AppAssets.arrowLeftIcon,
            onTap: widget.onBackButtonTap,
          ),
          Positioned(
            top: context.deviceHeight / 2.4,
            width: context.adaptiveDeviceWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  effect: ScaleEffect(
                    activeDotColor: context.theme.mainColor,
                    dotColor: context.theme.secondaryColor,
                  ),
                  controller: widget.pageController,
                  count: 1,
                  onDotClicked: widget.pageController.jumpToPage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
