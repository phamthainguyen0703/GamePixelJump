import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:jump_game/components/player.dart';
import 'package:jump_game/game_jump.dart';

class Heart2 extends SpriteAnimationComponent
    with HasGameRef<GameJump>, CollisionCallbacks {
  Heart2({position, size}) : super(position: position, size: size);

  Player player = Player();

  bool collected = false;

  @override
  FutureOr<void> onLoad() {
    // debugMode = true;
    add(RectangleHitbox(
        position: Vector2(6, 6),
        size: Vector2(4, 10),
        collisionType: CollisionType.passive));

    animation = SpriteAnimation.fromFrameData(
        game.images.fromCache('Items/Door/Heart.png'),
        SpriteAnimationData.sequenced(
            amount: 1, stepTime: 1, textureSize: Vector2.all(16)));
    if (player.heart == 2) {
      gameRef.remove(this);
    }
    return super.onLoad();
  }
}
