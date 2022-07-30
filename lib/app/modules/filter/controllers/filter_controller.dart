import 'package:get/get.dart';

class FilterController extends GetxController {
  // For Range Slider
  var startValue = 1200.0.obs;
  var endValue = 3000.0.obs;

  // For Counter
  var countBedrooms = 0.obs;
  var countBathrooms = 0.obs;
  var countBeds = 0.obs;
  var countAdults = 0.obs;
  var countChildren = 0.obs;
  var countInfants = 0.obs;

  void incrementBedrooms() {
    countBedrooms++;
  }

  void decrementBedrooms() {
    if (countBedrooms > 0) {
      countBedrooms--;
    } else {
      countBedrooms == 0;
    }
  }

  void incrementBathrooms() {
    countBathrooms++;
  }

  void decrementBathrooms() {
    if (countBathrooms > 0) {
      countBathrooms--;
    } else {
      countBathrooms == 0;
    }
  }

  void incrementBeds() {
    countBeds++;
  }

  void decrementBeds() {
    if (countBeds > 0) {
      countBeds--;
    } else {
      countBeds == 0;
    }
  }

  void incrementAdults() {
    countAdults++;
  }

  void decrementAdults() {
    if (countAdults > 0) {
      countAdults--;
    } else {
      countAdults == 0;
    }
  }

  void incrementChildren() {
    countChildren++;
  }

  void decrementChildren() {
    if (countChildren > 0) {
      countChildren--;
    } else {
      countChildren == 0;
    }
  }

  void incrementInfants() {
    countInfants++;
  }

  void decrementInfants() {
    if (countInfants > 0) {
      countInfants--;
    } else {
      countInfants == 0;
    }
  }

  // https://stackoverflow.com/questions/62343728/how-to-make-this-custom-rangeslider-in-flutter
  // To Create Custom Range Slider
}
