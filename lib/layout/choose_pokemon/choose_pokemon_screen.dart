import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/core/base/base_state.dart';
import 'package:poke_app/layout/choose_pokemon/adapter/choose_pokemon_adapter.dart';
import 'package:poke_app/layout/choose_pokemon/bloc/choose_pokemon_bloc.dart';
import 'package:poke_app/layout/choose_pokemon/component/bottom_comparing_pokemon.dart';

import '../../core/routing/routing.dart';
import '../../widgets/pagination_scroll_controller.dart';
import '../state_widgets/empty_state.dart';
import '../state_widgets/loading_list.dart';
import '../state_widgets/no_connection_state.dart';

class ChoosePokemonScreen extends StatefulWidget {
  const ChoosePokemonScreen({super.key});

  @override
  State<ChoosePokemonScreen> createState() => _ChoosePokemonScreenState();
}

class _ChoosePokemonScreenState extends State<ChoosePokemonScreen>
    with BaseState {
  PaginationScrollController paginationScrollController =
      PaginationScrollController();

  @override
  void initState() {
    paginationScrollController.init(
        loadAction: () => Routing.navigatorKey.currentContext
            ?.read<ChoosePokemonBloc>()
            .add(const GetPokemon(isReload: false)));
    super.initState();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    context.read<ChoosePokemonBloc>().add(const GetPokemon(isReload: true));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChoosePokemonBloc, ChoosePokemonState>(
        builder: (context, state) {
      return state.status.isNoConnection
          ? const NoConnecttionState()
          : state.status.isLoading
              ? const LoadingList()
              : Column(
                  children: [
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          context
                              .read<ChoosePokemonBloc>()
                              .add(GetPokemon(isReload: true));
                        },
                        child: CustomScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller:
                              paginationScrollController.scrollController,
                          slivers: [
                            state.status.isEmpty
                                ? const SliverToBoxAdapter(
                                    child: EmptyState(),
                                  )
                                : SliverGrid(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            childAspectRatio:
                                                2 / 3),
                                    delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                        return ChoosePokemonAdapter(
                                          pokemon: state.pokemonList![index],
                                          isSelected: state.pokemonList![index] == state.first || state.pokemonList![index] == state.second,
                                        );
                                      },
                                      childCount: state.pokemonList?.length,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    if (state.first != null) BottomComparingPokemon(first: state.first, second: state.second,)
                  ],
                );
    });
  }

  @override
  void dispose() {
    paginationScrollController.dispose();
    super.dispose();
  }
}
