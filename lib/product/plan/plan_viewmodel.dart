import 'package:wedding/product/plan/plan_view.dart';
import '../../core/base/state/base_state.dart';
import '../../core/modules/navigate/manager.dart';
import '../../core/modules/navigate/path.dart';
import '../../modules/plan/manager.dart';
export '../../modules/plan/manager.dart';
export '../../modules/plan/plan_model.dart';

abstract class PlanViewmodel extends BaseState<PlanView> {
  final PlanModelManager _manager = PlanModelManager();

  int currentIndex = 0;

  List<PlanModel> planList = [];
  List<(String, List<PlanModel>)> groupedList = [];

  onItemChanged(PlanModel plan, bool? value) {
    setState(() => plan.value = value);
  }

  init() async {
    changeLoading();
    planList = await _manager.getPlans();
    groupedList = planList.groupedList;
    changeLoading();
  }

   onProfilePressed() async {
    await NavigationManager.instance.nav(path: NavPath.editProfile);
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
