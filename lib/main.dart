import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';

void main() {
  final game = MyGame();
  runApp(GameWidget(game: game));
}

class MyGamePage extends StatefulWidget {
  const MyGamePage({Key? key}) : super(key: key);

  @override
  State createState() => _MyGamePageState();
}

class _MyGamePageState extends State<MyGamePage> {
  late final MyGame _game;

  @override
  void initState() {
    super.initState();
    _game = MyGame();
  }

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: _game);
  }
}

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await images.load('fuel-tank.png');
    FuelTank tank = FuelTank(
      position: Vector2(128, canvasSize.y - 70),
    );
    add(tank);
  }
}

class FuelTank extends SpriteAnimationComponent with HasGameRef<MyGame> {
  FuelTank({required super.position,}) : super(size: Vector2.all(64), anchor: Anchor.center);

  @override 
  Future<void> onLoad() async {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('fuel-tank.png'),
      SpriteAnimationData.sequenced(
        amount: 1,
        textureSize: Vector2.all(8),
        stepTime: 1,
      )
    );
  }
}