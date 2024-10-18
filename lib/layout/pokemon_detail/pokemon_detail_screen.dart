import 'package:poke_app/core/constraint/asset_path.dart';
import 'package:poke_app/core/extention/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/widgets/custom_icon_button.dart';

import '../../core/base/base_state.dart';
import '../../core/constraint/spacer.dart';
import '../../initial/locale/localizations.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_loading.dart';
import 'bloc/pokemon_detail_bloc.dart';
import 'components/first_body_detail.dart';
import 'components/header_detail.dart';
import 'components/second_body_detail.dart';

class PokemonDetailScreen extends StatefulWidget {
  final String name;

  const PokemonDetailScreen({super.key, required this.name});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen>
    with BaseState {


  @override
  void afterFirstLayout(BuildContext context) {
    context.read<PokemonDetailBloc>().add(GetPokemonDetail(name: widget.name));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
              context, lang(context).pokemonDetail ?? "Pokemon Detail",
          ),
          body: RefreshIndicator(
              onRefresh: () async {
                context.read<PokemonDetailBloc>().add(
                    GetPokemonDetail(name: widget.name));
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Builder(
                  builder: (context) {
                    if (state.status.isLoading) {
                      return Container(
                        width: double.infinity,
                        height: context.getHeight() * 0.9,
                        alignment: Alignment.center,
                        child: const CustomLoading(size: 20,),
                      );
                    }
                    return state.detail != null ? Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          eightPx,
                          HeaderDetail(detail: state.detail!),
                          FirstBodyDetail(detail: state.detail!),
                          SecondBodyDetail(detail: state.detail!)
                        ],
                      ),
                    ) : const SizedBox.shrink();
                  },
                ),
              )
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

}





