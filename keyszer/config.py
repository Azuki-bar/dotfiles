# https://poyo.hatenablog.jp/entry/2018/06/23/020147#SandS
# https://hidakatsuya.hateblo.jp/entry/2019/11/20/215608
# https://qiita.com/miy4/items/dd0e2aec388138f803c5
# https://github.com/joshgoebel/keyszer/issues/74

modmap("CapsLock",{
    Key.CAPSLOCK: Key.LEFT_CTRL,
})

multipurpose_modmap("SandS",
                    {
                        Key.SPACE: [Key.SPACE, Key.LEFT_SHIFT],
                        Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL],
# modmap("Alt-To-Muhenkan-when-single", )
                        # Key.LEFT_CTRL: [Key.ESC, Key.LEFT_CTRL],
                        Key.LEFT_ALT: [Key.MUHENKAN, Key.LEFT_ALT],
                        Key.RIGHT_ALT: [Key.HENKAN, Key.RIGHT_ALT],
                    }
                    )

emergency_eject_key(Key.F23)



