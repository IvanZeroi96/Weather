class Common {
  String selectImageUrl(String option) {
    String _imageUrl = '';

    switch (option) {
      case 'Clouds':
        _imageUrl =
            "https://img.icons8.com/fluency/240/null/partly-cloudy-day.png";
        break;
      case 'Clear':
        _imageUrl = "https://img.icons8.com/fluency/240/null/sun.png";
        break;

      default:
        _imageUrl = 'https://img.icons8.com/fluency/240/null/sun.png';
        break;
    }
    return _imageUrl;
  }
}
