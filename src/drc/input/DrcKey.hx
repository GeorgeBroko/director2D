package drc.input;

@:enum
abstract DrcKey(Int) from Int to Int
{
	public var ANY:Int = -1;
	
	public var LEFT = 37;
	public var UP = 38;
	public var RIGHT = 39;
	public var DOWN = 40;

	public var ENTER = 13;
	public var COMMAND = 15;
	public var CONTROL = 17;
	public var SPACE = 32;
	public var SHIFT = 16;
	public var BACKSPACE = 8;
	public var CAPS_LOCK = 20;
	public var DELETE = 46;
	public var END = 35;
	public var ESCAPE = 27;
	public var HOME = 36;
	public var INSERT = 45;
	public var TAB = 9;
	public var PAGE_DOWN = 34;
	public var PAGE_UP = 33;
	public var LEFT_SQUARE_BRACKET = 219;
	public var RIGHT_SQUARE_BRACKET = 221;
	public var TILDE = 192;
	
	public var A = 65;
	public var B = 66;
	public var C = 67;
	public var D = 68;
	public var E = 69;
	public var F = 70;
	public var G = 71;
	public var H = 72;
	public var I = 73;
	public var J = 74;
	public var K = 75;
	public var L = 76;
	public var M = 77;
	public var N = 78;
	public var O = 79;
	public var P = 80;
	public var Q = 81;
	public var R = 82;
	public var S = 83;
	public var T = 84;
	public var U = 85;
	public var V = 86;
	public var W = 87;
	public var X = 88;
	public var Y = 89;
	public var Z = 90;

	public var F1 = 112;
	public var F2 = 113;
	public var F3 = 114;
	public var F4 = 115;
	public var F5 = 116;
	public var F6 = 117;
	public var F7 = 118;
	public var F8 = 119;
	public var F9 = 120;
	public var F10 = 121;
	public var F11 = 122;
	public var F12 = 123;
	public var F13 = 124;
	public var F14 = 125;
	public var F15 = 126;

	public var DIGIT_0 = 48;
	public var DIGIT_1 = 49;
	public var DIGIT_2 = 50;
	public var DIGIT_3 = 51;
	public var DIGIT_4 = 52;
	public var DIGIT_5 = 53;
	public var DIGIT_6 = 54;
	public var DIGIT_7 = 55;
	public var DIGIT_8 = 56;
	public var DIGIT_9 = 57;

	public var NUMPAD_0 = 96;
	public var NUMPAD_1 = 97;
	public var NUMPAD_2 = 98;
	public var NUMPAD_3 = 99;
	public var NUMPAD_4 = 100;
	public var NUMPAD_5 = 101;
	public var NUMPAD_6 = 102;
	public var NUMPAD_7 = 103;
	public var NUMPAD_8 = 104;
	public var NUMPAD_9 = 105;
	public var NUMPAD_ADD = 107;
	public var NUMPAD_DECIMAL = 110;
	public var NUMPAD_DIVIDE = 111;
	public var NUMPAD_ENTER = 108;
	public var NUMPAD_MULTIPLY = 106;
	public var NUMPAD_SUBTRACT = 109;
}