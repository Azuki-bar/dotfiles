# https://poyo.hatenablog.jp/entry/2018/06/23/020147#SandS
# https://hidakatsuya.hateblo.jp/entry/2019/11/20/215608
# https://qiita.com/miy4/items/dd0e2aec388138f803c5
"""
$ sudo groupadd uinput
"""
import re
from xkeysnail.transform import *

define_modmap({
    Key.MUHENKAN: Key.LEFT_ALT,
    Key.HENKAN: Key.RIGHT_ALT,
    Key.CAPSLOCK: Key.LEFT_CTRL
})

exclude_apps = [r"Inkscape", r"Gimp", r"Minecraft.*"]
exclude_apps_pattern = rf"(?!({'|'.join(exclude_apps)}))"

define_conditional_multipurpose_modmap(
    re.compile(exclude_apps_pattern),
    {
        Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL],
        Key.LEFT_CTRL: [Key.ESC, Key.LEFT_CTRL],
        # SandS
        Key.SPACE: [Key.SPACE, Key.LEFT_SHIFT],
    })
