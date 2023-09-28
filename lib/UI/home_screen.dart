import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/game_status_enum.dart';
import 'package:tic_tac_toe/models/player_turn_enum.dart';
import 'package:tic_tac_toe/utils/helpers.dart';

import '../models/game_board_model.dart';
import '../models/player.dart';
import 'confetti_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PlayerTurnEnum playerTurn = PlayerTurnEnum.playerX;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.all(20)),
                const Text('Tic-Tac-Toe', style: TextStyle(fontSize: 30)),
                const Padding(padding: EdgeInsets.all(20)),
                IgnorePointer(
                  ignoring: GameBoardModel().getGameStatus() !=
                      GameStatusEnum.onGoing,
                  child: SizedBox(
                    height: screenHeight(context) * 0.7,
                    width: screenWidth(context),
                    child: GridView.builder(
                      itemCount: 9,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        mainAxisExtent: 170,
                      ),
                      itemBuilder: (context, index) {
                        GameBoardModel gameBoardModel = GameBoardModel();
                        int row = index ~/ 3;
                        int col = index % 3;
                        String symbol = gameBoardModel.getCellSymbol(row, col);
                        return IgnorePointer(
                          ignoring: symbol != '',
                          child: InkWell(
                            onTap: () {
                              playerTurn == PlayerTurnEnum.playerX
                                  ? GameBoardModel().markCell(row, col, 'X')
                                  : GameBoardModel().markCell(row, col, 'O');
                              setState(
                                () {
                                  playerTurn =
                                      PlayerTurnEnum.toggleTurn(playerTurn);
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.blue,
                                    blurRadius: 4,
                                  ),
                                ],
                                border: Border.all(
                                  color: Colors.blue.shade900,
                                ),
                                color: Colors.blue.shade600,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: symbol == 'O'
                                    ? Player.playerO()
                                    : symbol == 'X'
                                        ? Player.playerX()
                                        : Player.empty(),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Text(GameBoardModel().getGameStatus().toString()),
                TextButton(
                  onPressed: () => setState(() {
                    GameBoardModel().resetBoard();
                  }),
                  child: const Text('Reset'),
                )
              ],
            ),
          ),
          GameBoardModel().getGameStatus() == GameStatusEnum.xWon ||
                  GameBoardModel().getGameStatus() == GameStatusEnum.oWon
              ? const ConfettiAnimation()
              : const SizedBox(),
        ],
      ),
    );
  }
}
