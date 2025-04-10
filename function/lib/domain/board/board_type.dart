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