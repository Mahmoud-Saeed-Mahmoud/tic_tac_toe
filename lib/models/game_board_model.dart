import 'package:tic_tac_toe/models/game_status_enum.dart';

/// Model class representing the game board.
class GameBoardModel {
  List<List<String>> board;

  static final GameBoardModel _instance = GameBoardModel._internal();

  factory GameBoardModel() {
    return _instance;
  }

  GameBoardModel._internal()
      : board = List.generate(3, (_) => List.filled(3, ''));

  /// Marks a cell on the board with the given symbol.
  ///
  /// If the cell is already marked, it does nothing.
  void markCell(int row, int col, String symbol) {
    if (isCellEmpty(row, col)) {
      board[row][col] = symbol;
    } else {
      // Cell is already marked, do nothing
    }
  }

  /// Checks if a cell on the board is empty.
  bool isCellEmpty(int row, int col) {
    return board[row][col] == '';
  }

  /// Resets the board to its initial state.
  void resetBoard() {
    board = [
      ['', '', ''],
      ['', '', ''],
      ['', '', ''],
    ];
  }

  /// Retrieves the symbol in the specified cell.
  String getCellSymbol(int row, int col) {
    return board[row][col];
  }

  /// Retrieves the current game status.
  ///
  /// Returns [GameStatusEnum] representing the game status.
  GameStatusEnum getGameStatus() {
    // Check rows
    for (int row = 0; row < 3; row++) {
      if (board[row][0] != '' &&
          board[row][0] == board[row][1] &&
          board[row][0] == board[row][2]) {
        return GameStatusEnum.fromString('${board[row][0]}Won');
      }
    }

    // Check columns
    for (int col = 0; col < 3; col++) {
      if (board[0][col] != '' &&
          board[0][col] == board[1][col] &&
          board[0][col] == board[2][col]) {
        return GameStatusEnum.fromString('${board[0][col]}Won');
      }
    }

    // Check diagonals
    if (board[0][0] != '' &&
        board[0][0] == board[1][1] &&
        board[0][0] == board[2][2]) {
      return GameStatusEnum.fromString('${board[0][0]}Won');
    }

    if (board[0][2] != '' &&
        board[0][2] == board[1][1] &&
        board[0][2] == board[2][0]) {
      return GameStatusEnum.fromString('${board[0][2]}Won');
    }

    // Check for draw
    if (isBoardFull()) {
      return GameStatusEnum.draw;
    }

    return GameStatusEnum.onGoing;
  }

  /// Checks if the board is full.
  bool isBoardFull() {
    for (var row in board) {
      if (row.contains('')) {
        return false;
      }
    }
    return true;
  }
}
