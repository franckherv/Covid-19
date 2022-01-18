// add google api key here const API = aezt12434qsghklkjhfsr

// my APIkey = AIzaSyBRlRJSUcNNBpmRWF8Z2XENFlLBv1pyLTk

const GOOGLE_API_KEY = "AIzaSyDHKxxMws9-5BGDTo3crti4zGLLZ_HT3hc";

class LocationHelper {
  static String generateLocationPreviewImage(
      {var latitude, var longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';

    //"https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY";
  }
}
