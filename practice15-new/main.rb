require 'dxruby'
require 'smalrubot'
require_relative 'Scene'
require_relative 'Scene/scene_title/Director'
require_relative 'Scene/scene_game1/Director'
require_relative 'Scene/scene_gameover/Director'
require_relative 'Scene/scene_gameclear/Director'
require_relative 'Scene/senser/senser_all'
require_relative 'Scene/senser/senser_math'
#ゲーム名
Window.caption = 'あくしょんげーむてきな'

#X800,Y600
Window.width = 800
Window.height = 600

#
board = Smalrubot::Board.new(Smalrubot::TxRx::Serial.new)


#シーンの追加
Scene.add(Title::Director.new(board), :title)
Scene.add(Game::Director.new(board), :game1)
Scene.add(Gameover::Director.new(board), :gameover)
Scene.add(Gameclear::Director.new(board), :gameclear)

#Sound
PLAYER_SHOT_SOUND = Sound.new('./Sound/playershot.wav') #プレイヤー弾発射時
EXPLOSION_SOUND = Sound.new('./Sound/explosion.wav')#敵破壊時
BGM_SOUND = Sound.new('./Sound/bgm.wav')#プレイ中BGM
JUMP_SOUND = Sound.new('./Sound/jump.wav')#プレイヤージャンプ時

#タイトル画面へ移行
Scene.move_to(:title)

Window.loop do
    Scene.play

    #break if Input.key_push?(K_ESCAPE)
end
