// Get player inputs
var keyLeft = keyboard_check(vk_left) or keyboard_check(ord("A"));
var keyRight = keyboard_check(vk_right) or keyboard_check(ord("D"));
var keyUp = keyboard_check(vk_up) or keyboard_check(ord("W"));
var keyDown = keyboard_check(vk_down) or keyboard_check(ord("S"));
var keyActivate = keyboard_check(vk_space);
var keyRun = keyboard_check(vk_shift);
var keyAttack = keyboard_check(ord("F"));
var keyItem = keyboard_check(vk_control);

var inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
var inputMagnitude = (keyRight-keyLeft != 0) || (keyDown-keyUp!=0);

// Movement
hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

x += hSpeed;
y += vSpeed;

// Update Sprite Index
var _oldSprite = sprite_index;
if (inputMagnitude != 0 ){
	direction = inputDirection;
	sprite_index = spriteRun;
}else {
	sprite_index = spriteIdle;
}

if(_oldSprite != sprite_index) localFrame=0;

// Updating image index
PlayerAnimateSprite();