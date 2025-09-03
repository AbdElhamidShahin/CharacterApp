import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/business_logic/cubit/state/bloc/cubit.dart';
import 'package:project_bloc/business_logic/cubit/state/bloc/state.dart';
import 'package:project_bloc/constance/my-colors.dart';
import 'package:project_bloc/data/models/repostry/api/Carcters.dart';

import 'Presnetaion/widget/Screens/CarctersItem.dart';

class CharactarsScreen extends StatefulWidget {
  CharactarsScreen({super.key});
  @override
  State<CharactarsScreen> createState() => _CharactarsScreenState();
}

class _CharactarsScreenState extends State<CharactarsScreen> {
  late List<Caracter> allCaracters;
  late List<Caracter> SearchedForCaracter;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  Widget _buildSearchFeild() {
    return TextField(
      controller: _searchTextController,
      cursorColor: myColors.myGray,
      decoration: InputDecoration(
        hintText: "find a character",
        border: InputBorder.none,
        hintStyle: TextStyle(color: myColors.myGray, fontSize: 18),
      ),
      style: TextStyle(color: myColors.myGray, fontSize: 18),
      onChanged: (searchedCaracrter) {
        addSearchForItem(
          searchedCaracrter, //دي الحروف الي المستخدم هيكتبها في textFeild
        );
      },
    );
  }

  void addSearchForItem(String searchedCaracrter) {
    SearchedForCaracter = allCaracters
        .where(
          //تطبيق شرط معين (هات كل العناصر الي في الليست لما يطبق الشرط الي جاي )
          (character) =>
              character.name!.toLowerCase().startsWith(searchedCaracrter),
        )
        .toList();
    setState(() {});
  }

  List<Widget> _buildApperAction() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: myColors.myGray),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _StartSearch,
          icon: Icon(Icons.search, color: myColors.myGray),
        ),
      ];
    }
  }

  void _StartSearch() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    allCaracters = BlocProvider.of<CaractersCubit>(context).getAllCharactars();
  }

  Widget BuildLodedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: myColors.myGray,
        child: Column(children: [BuildCaractersList()]),
      ),
    );
  }

  Widget BuildCaractersList() {
    return GridView.builder(
      shrinkWrap: true, // مهم
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
      ),
      itemCount: _searchTextController.text.isEmpty
          ? allCaracters.length
          : SearchedForCaracter.length,
      itemBuilder: (context, index) {
        return CarctersItem(
          allCaracters: _searchTextController.text.isEmpty
              ? allCaracters[index]
              : SearchedForCaracter[index],
        );
      },
    );
  }

  Widget BuildBlocWidget() {
    return BlocBuilder<CaractersCubit, CaractersState>(
      builder: (context, state) {
        if (state is CaractersLaodedState) {
          allCaracters = (state).caracters;
          return BuildLodedListWidget();
        } else {
          return Center(
            child: CircularProgressIndicator(color: myColors.myYello),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColors.myYello,
        leading: _isSearching
            ? BackButton(color: myColors.myGray)
            : Container(),
        title: _isSearching
            ? _buildSearchFeild()
            : Center(
                child: Text(
                  "Charactar",
                  style: TextStyle(color: myColors.myWhite, fontSize: 32),
                ),
              ),
        actions: _buildApperAction(),
      ),
      body: BuildBlocWidget(),
    );
  }
}
