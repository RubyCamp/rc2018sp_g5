class Scene
    @@scenes  = {}
    @@current_scene_name = nil
    @@light_open = 0
    @@light_close = 0

    @@scene_kumo_x = 0
    @@scene_tatemono_x = 0

    def self.add(scene_obj,scene_name)
        #to_sym レシーバのシンボル自身を返す
        @@scenes[scene_name.to_sym] = scene_obj
    end

    def self.move_to(scene_name)
        @@current_scene_name = scene_name.to_sym
    end

    def self.play
        @@scenes[@@current_scene_name].play
    end

    def self.ligh_open_getter
      @@light_open
    end

    def self.ligh_close_getter
      @@light_close
    end

    def self.ligh_opent_setter(val)
      @@light_open = val
    end

    def self.ligh_close_setter(val)
      @@light_close = val
    end

    def self.kumo_x_getter
      @@scene_kumo_x
    end

    def self.tatemono_x_getter
      @@scene_tatemono_x
    end

    def self.kumo_x_setter(val)
      @@scene_kumo_x = val
    end

    def self.tatemono_x_setter(val)
      @@scene_tatemono_x = val
    end

=begin
    def self.board_getter
      @@board
    end
    def self.board_setter(val)
      @@board = val
    end
=end

end
