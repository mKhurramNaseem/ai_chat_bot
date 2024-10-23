import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/activity/presentation/bloc/activity_bloc/activity_bloc.dart';
import 'package:ai_chat_bot/features/activity/presentation/pages/activity_page/widgets/ap_activity_list.dart';
import 'package:ai_chat_bot/features/activity/presentation/pages/activity_page/widgets/ap_empty_activites.dart';
import 'package:ai_chat_bot/injection_container.dart';

class ActivityPage extends StatelessWidget {
  static const pageName = '/activityPage';
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityBloc(getActivitesUsecase: sl()),
      child: const ActivityPageBody(),
    );
  }
}

class ActivityPageBody extends StatefulWidget {
  const ActivityPageBody({super.key});

  @override
  State<ActivityPageBody> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPageBody> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<ActivityBloc>().add(ActivityEventFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApAppBar(),
      body: Center(
        child: Column(
          children: [
            const Expanded(
              flex: 8,
              child: ApUserStatistics(),
            ),
            const Expanded(
              flex: 3,
              child: ApDetailText(),
            ),
            const Spacer(
              flex: 3,
            ),
            const Expanded(
              flex: 37,
              child: ApGraph(),
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 8,
              child: BlocBuilder<ActivityBloc, ActivityState>(
                  builder: (context, state) {
                if (state is ActivityDoneState) {
                  return ApDetailsChatActivity(
                    activites: state.activites,
                  );
                } else {
                  return const SizedBox();
                }
              }),
            ),
            Expanded(
              flex: 39,
              child: BlocBuilder<ActivityBloc, ActivityState>(
                  builder: (context, state) {
                if (state is ActivityDoneState) {
                  return ApActivityList(activites: state.activites);
                } else if (state is ActivityEmptyState) {
                  return const ApEmptyActivites();
                }
                return const SizedBox();
              }),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
