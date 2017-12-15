/* This file implements Super Mario's logic */

/* mario's temporary variable */
var x
var y
var xVel = 0
var xVelMax = 5
var yVel = 0
var yVelMax = 15
var walkingDuration = 250 // 50~250 action 30~250
var currentTime
var walkingTime
var acceleration = 0.1
var gravity = 1.01


/* binding mario's behaviors with keyboard */
var keys = {
    "right": false,
    "left": false,
    "down": false,
    "action": false,
    "jump": false
}

function keyPress(key) {
    switch(key)
    {
        case Qt.Key_Right:
        keys.right = true
        keys.left = false
//        calculateXVelocity()
        break
        case Qt.Key_Left:
        keys.left = true
        keys.right = false
//        calculateXVelocity()
        break
        case Qt.Key_Down:
        keys.down = true
        break
        case Qt.Key_S:
        keys.action = true
        break
        case Qt.Key_A:
        keys.jump = true
//        calculateYVelocity()
        break
    }
}

function keyRelease(key) {
    switch(key)
    {
        case Qt.Key_Right:
        keys.right = false
        break
        case Qt.Key_Left:
        keys.left = false
        break
        case Qt.Key_Down:
        keys.down = false
        break
        case Qt.Key_S:
        keys.action = false
        break
        case Qt.Key_A:
        keys.jump = false
        break
    }
}


/* update mario's state, position and animation per 16ms, called in every level */
function update() {
    currentTime = (new Date()).getTime()
    calculateXVelocity()
    calculateYVelocity()
    updatePosition()
    handle_state()
}

function calculateXVelocity() {
    if (keys.right) {
        xVel += acceleration
        if (xVel > 0 && xVel < (xVelMax * 0.2)) xVel = xVelMax * 0.2
        if (xVel > xVelMax) xVel = xVelMax
    } else if (keys.left) {
        xVel -= acceleration
        if (xVel > -(xVelMax * 0.2) && xVel < 0) xVel = -(xVelMax * 0.2)
        if (xVel < -xVelMax) xVel = -xVelMax
    } else {
        /* sliding to stop */
        xVel > 0 ? xVel -= acceleration : xVel += acceleration
        if (xVel > 0) {
            xVel < (xVelMax * 0.2) ? xVel = 0 : xVel -= acceleration
        } else {
            xVel > -(xVelMax * 0.2) ? xVel = 0 : xVel += acceleration
        }
    }
}

function calculateYVelocity() {
    if (keys.jump) {
        yVel -= gravity
        if (yVel <= -yVelMax) {
            yVel = -yVelMax
            keys.jump = false
        }
//    } else if (mario.state == "falling") {
    } else {
        yVel += gravity
        if (yVel >= yVelMax) {
            yVel = yVelMax
        }
    }
}


function handle_state() {
    if (yVel == 0) {
        xVel == 0 ? mario.state = "standing" : mario.state = "walking"
    } else if (yVel < 0) {
        mario.state = "jumping"
    } else {
        mario.state = "falling"
    }

    switch(mario.state)
    {
        case "walking":
        walking()
        break
        case "standing":
        standing()
        break
        case "jumping":
        jumping()
        break
        case "falling":
        falling()
        break
    }
}

function standing() {
    xVel = 0
    yVel = 0
    mario.index > 10 ? mario.index = 11 : mario.index = 0
}

function walking() {
//    calculateXVelocity()
//    calculateYVelocity()
//    if(mario.index != 5 && mario.index != 16) updatePosition()
    calculateDuration()

    /* walking animation */
    if (keys.right) {
        if (xVel >= 0) {
            if (mario.index == 11 || mario.index == 0 || mario.index == 5) {
                mario.index = 1
                walkingTime = currentTime
            } else {
                if ((currentTime - walkingTime) < walkingDuration) return
                (0 < mario.index && mario.index < 3) ? mario.index += 1 : mario.index = 1
                walkingTime = currentTime
            }
        } else if(xVel < -(xVelMax * 0.8)) mario.index = 5
    } else if (keys.left) {
        if (xVel <= 0) {
            if (mario.index == 11 || mario.index == 0 || mario.index == 16) {
                mario.index = 12
                walkingTime = currentTime
            } else {
                if ((currentTime - walkingTime) < walkingDuration) return
                (11 < mario.index && mario.index < 14) ? mario.index += 1 : mario.index = 12
                walkingTime = currentTime
            }
        } else if(xVel > (xVelMax * 0.8)) mario.index = 16
    } else {
        if (xVel == 0) return
        if ((currentTime - walkingTime) < walkingDuration) return
        if (mario.index > 10) {
            (11 < mario.index && mario.index < 14) ? mario.index += 1 : mario.index = 12
        } else {
            (0 < mario.index && mario.index < 3) ? mario.index += 1 : mario.index = 1
        }
        walkingTime = currentTime
    }
}

function jumping() {
//    calculateXVelocity()
//    calculateYVelocity()
//    updatePosition()
    mario.index > 10 ? mario.index = 15 : mario.index = 4

}

function falling() {
//    calculateXVelocity()
//    calculateYVelocity()
//    updatePosition()
}


function calculateDuration() {
    walkingDuration = 250 - Math.abs(xVel) * 200 / 5
    if (walkingDuration < 40) {
        walkingDuration = 40
    }
}

function updatePosition() {
    x = mario.x
    y = mario.y
    x += xVel
    y += yVel
    detectCollisions()

    if (x > mario.parent.width / 2) {
        mario.x = mario.parent.width / 2
        mario.camera_x += x - mario.parent.width / 2
    } else {
        mario.x = x
    }

    mario.y = y
}

function detectCollisions() {
    detectMarioGroundCollisions()
    detectMarioPipesCollisions()
    detectMarioStepsCollisions()
    detectMarioBricksCollisions()
    detectMarioCoinBoxCollisions()
    detectMarioEnemiesCollisions()
}

function detectMarioGroundCollisions() {
    var offset = x + mario.camera_x
    for (var i = 0; i < ground.children.length; i++) {
        var rect = ground.children[i]
        if (offset > (rect.x - mario.width) && offset < (rect.x + rect.width)) {
            if (y > (rect.y - mario.height) && y < (rect.y + rect.height)) {
                yVel = 0
                y = rect.y - mario.height
                return true
            }
            if (y > 600){
//                console.log("out of screen")
            }
        }
    }
    return false
}

function detectMarioPipesCollisions() {
    var offset = x + mario.camera_x
    for (var i = 0; i < pipes.children.length; i++) {
        var rect = pipes.children[i]
        if (offset > (rect.x - mario.width) && offset < (rect.x + rect.width)) {
            if (y > (rect.y - mario.height) && y < (rect.y + rect.height)) {
                if (mario.y <= rect.y - mario.height) {
                    yVel = 0
                    y = rect.y - mario.height
                    return true
                } else {
                    x = mario.x
                }
            }
        }
    }
}

function detectMarioStepsCollisions() {
    var offset = x + mario.camera_x
    for (var i = 0; i < steps.children.length; i++) {
        var rect = steps.children[i]
        if (offset > (rect.x - mario.width) && offset < (rect.x + rect.width)) {
            if (y > (rect.y - mario.height) && y < (rect.y + rect.height)) {
                if (mario.y <= rect.y - mario.height) {
                    yVel = 0
                    y = rect.y - mario.height
//                    return true
                } else {
                    x = mario.x
                }
            }
        }
    }
}

function detectMarioBricksCollisions() {
    var offset = x + mario.camera_x
    for (var i = 0; i < bricks.children.length; i++) {
        var rect = bricks.children[i]
        if (offset > (rect.x - mario.width) && offset < (rect.x + rect.width)) {
            if (y > (rect.y - mario.height) && y < (rect.y + rect.height)) {
                if (mario.y <= rect.y - mario.height) {
                    yVel = 0
                    y = rect.y - mario.height
//                    return true
                } else {
                    x = mario.x
                    /* Hit the brick from below */
                    if (mario.y >= rect.y + rect.height) {
                        yVel = 3
                        keys.jump = false
                        y = rect.y + rect.height
                        rect.test(
                        )
                    }
                }
            }
        }
    }
}

function detectMarioCoinBoxCollisions() {
    var offset = x + mario.camera_x
    for (var i = 0; i < coinBoxes.children.length; i++) {
        var rect = coinBoxes.children[i]
        if (offset > (rect.x - mario.width) && offset < (rect.x + rect.width)) {
            if (y > (rect.y - mario.height) && y < (rect.y + rect.height)) {
                if (mario.y <= rect.y - mario.height) {
                    yVel = 0
                    y = rect.y - mario.height
//                    return true
                } else {
                    x = mario.x
                    /* Hit the coin box from below */
                    if (mario.y >= rect.y + rect.height) {
                        yVel = 3
                        keys.jump = false
                        y = rect.y + rect.height
                        rect.isOpen = true
                    }

                }
            }
        }
    }
}

function detectMarioEnemiesCollisions() {
    var offset = x + mario.camera_x
    for (var i = 0; i < enemies.children.length; i++) {
        var rect = enemies.children[i]
        if (offset > (rect.x - mario.width) && offset < (rect.x + rect.width)) {
            if (y > (rect.y - mario.height) && y < (rect.y + rect.height)) {
                rect.isSquished = true
            }
        }
    }
}