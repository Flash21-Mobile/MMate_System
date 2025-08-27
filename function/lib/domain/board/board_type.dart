sealed class BoardType {
  static BoardType getType(String type) {
    return switch (type) {
      'community' => BoardTypeCommunity(),
      _ => BoardTypeNon()
    };
  }
}

class BoardContent {
  static const gallery = 'gallery';
  static const post = 'post';
}

class BoardTypeCommunity extends BoardType {
  BoardTypeCommunity();
}

class BoardTypeNon extends BoardType {
  BoardTypeNon();
}

// todo: 이거 enum으로 바꾸고 유스케이스 매개변수를 enum으로 바꾸기