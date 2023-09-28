import 'package:test/test.dart';
import 'package:tic_tac_toe/models/game_board_model.dart';
import 'package:tic_tac_toe/models/game_status_enum.dart';

void main() {
  group('GameBoardModel', () {
    late GameBoardModel gameBoard;

    setUp(() {
      gameBoard = GameBoardModel();
    });

    test('markCell should mark a cell on the board with the given symbol', () {
      gameBoard.markCell(0, 0, 'X');
      expect(gameBoard.getCellSymbol(0, 0), 'X');
    });

    test('markCell should do nothing if the cell is already marked', () {
      gameBoard.markCell(1, 1, 'X');
      gameBoard.markCell(1, 1, 'O');
      expect(gameBoard.getCellSymbol(1, 1), 'X');
    });

    test('isCellEmpty should return true for an empty cell', () {
      expect(gameBoard.isCellEmpty(0, 2), true);
    });

    test('isCellEmpty should return false for a marked cell', () {
      gameBoard.markCell(1, 1, 'X');
      expect(gameBoard.isCellEmpty(1, 1), false);
    });

    test('resetBoard should reset the board to its initial state', () {
      gameBoard.markCell(0, 0, 'X');
      gameBoard.resetBoard();
      expect(gameBoard.isCellEmpty(0, 0), true);
    });

    test('getCellSymbol should retrieve the symbol in the specified cell', () {
      gameBoard.markCell(1, 2, 'O');
      expect(gameBoard.getCellSymbol(1, 2), 'O');
    });

    test('getGameStatus should return GameStatusEnum.onGoing initially', () {
      expect(gameBoard.getGameStatus(), GameStatusEnum.onGoing);
    });

    test('getGameStatus should return the correct status when a row is filled',
        () {
      gameBoard.markCell(0, 0, 'X');
      gameBoard.markCell(0, 1, 'X');
      gameBoard.markCell(0, 2, 'X');
      expect(gameBoard.getGameStatus(), GameStatusEnum.fromString('XWon'));
    });
  });
}
