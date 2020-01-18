
abstract class BaseVideoService{
    getVideo();

}


class VideoService extends BaseVideoService{
    static  final VideoService _instance = VideoService.internal();
    factory VideoService()=> _instance;
    VideoService.internal();

  final List<String> _videoUrls = [];



  String getVideo() => _videoUrls.isEmpty ? _initVideoService() :_videoUrls.removeLast();


  // PRIVATE

    String _initVideoService() {
        // add video urls ;
        _videoUrls.add('https://sandbox.markhamenterprises.com/videos/video0.mp4');
        _videoUrls.add('https://sandbox.markhamenterprises.com/videos/video1.mp4');
        _videoUrls.add('https://sandbox.markhamenterprises.com/videos/video2.mp4');
        _videoUrls.add('https://sandbox.markhamenterprises.com/videos/video3.mp4');
        _videoUrls.add('https://sandbox.markhamenterprises.com/videos/video4.mp4');
        _videoUrls.add('https://sandbox.markhamenterprises.com/videos/video5.mp4');
        _videoUrls.add('https://sandbox.markhamenterprises.com/videos/video6.mp4');
        _videoUrls.add('https://sandbox.markhamenterprises.com/videos/video7.mp4');
        _videoUrls.add('https://sandbox.markhamenterprises.com/videos/video8.mp4');
        _videoUrls.add('https://sandbox.markhamenterprises.com/videos/video9.mp4');
//        _videoUrls.add('https://sandbox.markhamenterprises.com/videos/video10.mp4');
//        _videoUrls.add('https://sandbox.markhamenterprises.com/videos/video11.mp4');
//        _videoUrls.add('https://sandbox.markhamenterprises.com/videos/video12.mp4');
//        _videoUrls.add('https://sandbox.markhamenterprises.com/videos/video13.mp4');
        _videoUrls.shuffle();
        return _videoUrls.removeLast();
    }

}
