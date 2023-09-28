enum PlayerTurnEnum {
  playerX,
  playerO;

  static PlayerTurnEnum fromString(String value) {
    switch (value) {
      case 'X':
        return PlayerTurnEnum.playerX;
      case 'O':
        return PlayerTurnEnum.playerO;
      default:
        return PlayerTurnEnum.playerX;
    }
  }

  static toggleTurn(PlayerTurnEnum playerTurnEnum) {
    if (playerTurnEnum == PlayerTurnEnum.playerX) {
      return PlayerTurnEnum.playerO;
    }
    return PlayerTurnEnum.playerX;
  }
}
