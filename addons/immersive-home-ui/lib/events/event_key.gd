extends EventWithModifiers
## Events emitted by the Virtual Keyboard
class_name EventKey

## The key that was pressed or released
var key: Key
## true if the event is repeated due to a key being held down for a while
var echo: bool

## Modifies a string based on the key pressed
static func key_to_string(key: Key, caps: bool=false, apply_to: String="") -> String:
	match key:
		KEY_INSERT: apply_to += DisplayServer.clipboard_get()
		KEY_BACKSPACE: apply_to = apply_to.substr(0, apply_to.length() - 1)
		KEY_SPACE: apply_to += " "
		KEY_ASCIITILDE: apply_to += "~"
		KEY_SLASH: apply_to += "/"
		KEY_BACKSLASH: apply_to += "\\"
		KEY_COLON: apply_to += ":"
		KEY_COMMA: apply_to += ","
		KEY_PERIOD: apply_to += "."
		KEY_MINUS: apply_to += "-"
		KEY_CAPSLOCK: return apply_to
		_: apply_to += OS.get_keycode_string(key).to_upper() if caps else OS.get_keycode_string(key).to_lower()

	return apply_to