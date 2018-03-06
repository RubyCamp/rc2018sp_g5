require 'dxruby'
require_relative 'Scene'
require_relative 'Scene/scene_title/Director'
require_relative 'Scene/scene_game1/Director'

#ゲーム名
Window.caption = 'あくしょんげーむてきな'

#シーンの追加
Scene.add(Title::Director.new, :title)
Scene.add(Game::Director.new, :game1)

#タイトル画面へ移行
Scene.move_to(:title)

Window.loop do
    Scene.play

    break if Input.key_push?(K_ESCAPE)
end
