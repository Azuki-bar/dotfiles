# https://poyo.hatenablog.jp/entry/2018/06/23/020147#SandS
# https://hidakatsuya.hateblo.jp/entry/2019/11/20/215608
# https://qiita.com/miy4/items/dd0e2aec388138f803c5
"""
$ sudo groupadd uinput
"""
import re
from xkeysnail.transform import *

define_multipurpose_modmap({
    # SandS
    Key.SPACE: [Key.SPACE, Key.LEFT_SHIFT],
    # Capslock is escape when pressed and released. Control when held down.
    Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL],
    Key.LEFT_CTRL: [Key.ESC, Key.LEFT_CTRL]
})

define_modmap({
    Key.MUHENKAN: Key.LEFT_ALT,
    Key.HENKAN: Key.RIGHT_ALT
})
