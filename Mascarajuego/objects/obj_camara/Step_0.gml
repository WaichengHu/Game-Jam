

if (instance_exists(target)) {

    var _xTo = target.x - (base_w / 2);
    var _yTo = target.y - (base_h / 2);


    var _curX = camera_get_view_x(cam);
    var _curY = camera_get_view_y(cam);


    var _newX = lerp(_curX, _xTo, spd);
    var _newY = lerp(_curY, _yTo, spd);


    _newX = clamp(_newX, 0, room_width - base_w);
    _newY = clamp(_newY, 0, room_height - base_h);

    camera_set_view_pos(cam, floor(_newX), floor(_newY));

}

var _scale = min(display_get_gui_width() / base_w, display_get_gui_height() / base_h);
_scale = floor(_scale);
if (_scale < 1) _scale = 1;


var _vp_w = base_w * _scale;
var _vp_h = base_h * _scale;


var _vp_x = floor((display_get_gui_width() - _vp_w) / 2);
var _vp_y = floor((display_get_gui_height() - _vp_h) / 2);


view_set_wport(0, _vp_w);
view_set_hport(0, _vp_h);
view_set_xport(0, _vp_x);
view_set_yport(0, _vp_y);