import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:my_app/model/cardio/cardio_model.dart';

class CardioController extends GetxController {
  CollectionReference _cardioCollection =
      FirebaseFirestore.instance.collection("Cardio");

  RxList<Cardio> cardioList = RxList<Cardio>([]);

  void getCardios() {
    cardioList.bindStream(_cardioCollection
        .snapshots()
        .map((query) => query.docs.map((e) => Cardio.fromJson(e)).toList()));
  }

  void postCardio(Cardio cardioModel) {
    _cardioCollection.add(cardioModel.toJson());
  }

  void updateCardio(String id, Cardio model) {
    _cardioCollection.doc(id).set(model.toJson());
  }

  void remove(String id) {
    _cardioCollection.doc(id).delete();
  }
}
