



class User {

  const User({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  final int id;
  final String createdAt;
  final String name;
  final String avatar;
}

void main() {
  const user1 = User(id: 1, createdAt: 'createdAt', name: 'name', avatar: 'avatar');
  const user2 = User(id: 2, createdAt: 'createdAt', name: 'name', avatar: 'avatar');
}