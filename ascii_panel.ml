open Graphics

type game_unit = {
  char_width : int;
  char_height : int;
  font_size : int;
}

type t = {
  screen_width : int;
  screen_height : int;
  sizes : game_unit;
}

let open_window w h = 
  open_graph (" " ^ (string_of_int w) ^ "x" ^ (string_of_int h));
  {
    screen_width = w;
    screen_height = h;
    sizes = {
      char_width = w / 80;
      char_height = w / 80;
      font_size = 5;
    }
  }

let draw_point x y c t =
  set_color c;
  fill_rect (t.sizes.char_width * x) (t.sizes.char_height * y) 
    t.sizes.char_width t.sizes.char_height;
  t

let draw_char x y c chr t = 
  set_color c;
  moveto (t.sizes.char_width * x) (t.sizes.char_height * y);
  draw_char chr;
  t

let fill_rect x y w h c t =
  set_color c;
  fill_rect (t.sizes.char_width * x) (t.sizes.char_height * y) 
    (t.sizes.char_width * w) (t.sizes.char_width * h);
  t

let clear_graph t =
  clear_graph (); t