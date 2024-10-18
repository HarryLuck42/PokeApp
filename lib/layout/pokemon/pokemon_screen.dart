import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/core/base/base_state.dart';
import 'package:poke_app/core/routing/routing.dart';
import 'package:poke_app/layout/pokemon/adapter/pokemon_adapter.dart';
import 'package:poke_app/layout/state_widgets/empty_state.dart';
import 'package:poke_app/layout/state_widgets/loading_list.dart';

import '../../widgets/pagination_scroll_controller.dart';
import '../state_widgets/no_connection_state.dart';
import 'bloc/pokemon_bloc.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> with BaseState {

  PaginationScrollController paginationScrollController =
      PaginationScrollController();

  @override
  void initState() {
    paginationScrollController.init(
        loadAction: () => Routing.navigatorKey.currentContext
            ?.read<PokemonBloc>()
            .add(GetPokemon(isReload: false)));
    super.initState();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    context.read<PokemonBloc>().add(GetPokemon(isReload: true));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
      return state.status.isNoConnection
          ? const NoConnecttionState()
          : state.status.isLoading
              ? const LoadingList()
              : RefreshIndicator(
                  onRefresh: () async {
                    context.read<PokemonBloc>().add(GetPokemon(isReload: true));
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
                                  return PokemonAdapter(
                                    pokemon: state.pokemonList![index],
                                  );
                                },
                                childCount: state.pokemonList?.length,
                              ),
                            ),
                    ],
                  ),
                );
    });
  }

  @override
  void dispose() {
    paginationScrollController.dispose();
    super.dispose();
  }
}
