enum GameStatusEnum {
  onGoing,
  draw,
  xWon,
  oWon;

  static GameStatusEnum fromString(String value) {
    switch (value) {
      case 'Ongoing':
        return GameStatusEnum.onGoing;
      case 'Draw':
        return GameStatusEnum.draw;
      case 'XWon':
        return GameStatusEnum.xWon;
      case 'OWon':
        return GameStatusEnum.oWon;
      default:
        return GameStatusEnum.onGoing;
    }
  }

  @override
  String toString() {
    return switch (this) {
      GameStatusEnum.onGoing => 'Ongoing',
      GameStatusEnum.draw => 'Draw',
      GameStatusEnum.xWon => 'X Won',
      GameStatusEnum.oWon => 'O Won',
    };
  }
}
