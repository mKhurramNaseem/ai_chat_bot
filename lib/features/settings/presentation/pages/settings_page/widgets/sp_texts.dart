import 'package:ai_chat_bot/core/core.dart';
import 'package:ai_chat_bot/features/settings/presentation/bloc/settings_bloc/settings_bloc.dart';

class SpTitle extends StatelessWidget {
  const SpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SettingsBloc>();    
    return BlocBuilder<SettingsBloc , SettingsState>(
      builder: (context , state) {
        return LayoutBuilder(
          builder: (context, constraints) {            
            return Align(
              alignment: Alignment.center ,
              child: Text(
                    bloc.userProfile?.name ?? 'Add User Name',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: constraints.maxHeight * 0.3,
                        ),
                  ),
            );
          },
        );
      }
    );
  }
}

class SpEmailText extends StatelessWidget {
  const SpEmailText({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SettingsBloc>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocBuilder<SettingsBloc,SettingsState>(
          builder: (context , state) {
            return Text(
              bloc.email ?? 'Add User Email',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: constraints.maxHeight * 0.4,
                  ),
            );
          }
        );
      },
    );
  }
}
