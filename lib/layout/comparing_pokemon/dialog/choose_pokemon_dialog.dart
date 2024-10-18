import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/core/base/base_state.dart';
import 'package:poke_app/core/constraint/asset_path.dart';
import 'package:poke_app/core/extention/extention.dart';
import 'package:poke_app/initial/locale/localizations.dart';
import 'package:poke_app/layout/comparing_pokemon/adapter/choose_comparing_item.dart';
import 'package:poke_app/layout/comparing_pokemon/bloc/comparing_pokemon_bloc.dart';
import 'package:poke_app/layout/comparing_pokemon/component/bottom_comparing_pokemon_dialog.dart';
import 'package:poke_app/widgets/custom_icon_button.dart';
import 'package:poke_app/widgets/custom_text.dart';

import '../../../core/routing/routing.dart';
import '../../../widgets/pagination_scroll_controller.dart';
import '../../state_widgets/empty_state.dart';

class ChoosePokemonDialog extends StatefulWidget {
  const ChoosePokemonDialog({super.key});

  @override
  State<ChoosePokemonDialog> createState() => _ChoosePokemonDialogState();
}

class _ChoosePokemonDialogState extends State<ChoosePokemonDialog>
    with BaseState {
  PaginationScrollController paginationScrollController =
      PaginationScrollController();

  @override
  void initState() {
    paginationScrollController.init(
        loadAction: () => Routing.navigatorKey.currentContext
            ?.read<ComparingPokemonBloc>()
            .add(const GetPokemon(isReload: false)));
    super.initState();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    context.read<ComparingPokemonBloc>().add(const GetPokemon(isReload: true));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComparingPokemonBloc, ComparingPokemonState>(
      builder: (context, state) {
        return Container(
          height: context.getHeight() * 0.9,
          padding: EdgeInsets.only(
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              color: context.getColorScheme().onSecondary),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 70,
                child: Stack(
                  children: [
                    Positioned(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CustomIconButton(
                          width: 30,
                          height: 30,
                          iconData: "${AssetPath.vector}close.svg",
                          color: context.getColorScheme().primary,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      child: Align(
                        alignment: Alignment.center,
                        child: CustomText(
                          textToDisplay: lang(context).comparingTitle ?? "Choose pokemon for comparing",
                          textStyle: context.getTextTheme().titleSmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: context.getColorScheme().secondary,
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    // context.read<PokemonBloc>().add(GetPokemon(isReload: true));
                  },
                  child: CustomScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: paginationScrollController.scrollController,
                    slivers: [
                      state.status.isEmpty
                          ? const SliverToBoxAdapter(
                              child: EmptyState(),
                            )
                          : SliverGrid(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 2 / 3),
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return ChooseComparingItem(
                                    pokemon: state.pokemonList![index],
                                  );
                                },
                                childCount: state.pokemonList?.length,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              if (state.firstPokemon != null) BottomComparingPokemonDialog(first: state.firstPokemon, second: state.secondPokemon,)
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    paginationScrollController.dispose();
    super.dispose();
  }
}
