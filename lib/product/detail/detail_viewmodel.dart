import '../../core/base/state/base_state.dart';
import '../../modules/service/manager.dart';
import 'detail_view.dart';

abstract class DetailViewmodel extends BaseState<DetailView> {
  List<String> images = ["assets/images/sevgi.png", "assets/images/sevgi.png"];
  String name = "Sevgi Düğün Salonu";
  bool favorited = false;

  final ServiceModelManager _manager = ServiceModelManager();

  List<ServiceModel> sideServices = [];
  List<ServiceModel> mainServices = [];

  onFavoriteClicked() {
    setState(() => favorited = !favorited);
  }

  init() async {
    changeLoading();
    mainServices = await _manager.getMainServices();
    sideServices = await _manager.getSideServices();
    changeLoading();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
