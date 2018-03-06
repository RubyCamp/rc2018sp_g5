require 'dxruby'
require_relative 'Scene'
require_relative 'Scene/scene_title/Director'
require_relative 'Scene/scene_game1/Director'

#ゲーム名
Window.caption = 'あくしょんげーむてきな'

#テスト用 舞台裏
# Window.width = 1024
# Window.height = 800

#シーンの追加
Scene.add(Title::Director.new, :title)
Scene.add(Game::Director.new, :game1)

#Sound
PLAYER_SHOT_SOUND = Sound.new('./Sound/playershot.wav') #プレイヤー弾発射時
EXPLOSION_SOUND = Sound.new('./Sound/explosion.wav')#敵破壊時
BGM_SOUND = Sound.new('./Sound/bgm.wav')#プレイ中BGM
JUMP_SOUND = Sound.new('./Sound/jump.wav')#プレイヤージャンプ時

#タイトル画面へ移行
Scene.move_to(:title)

Window.loop do
    Scene.play

    break if Input.key_push?(K_ESCAPE)
end
