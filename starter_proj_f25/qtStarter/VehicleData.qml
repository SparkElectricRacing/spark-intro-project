import QtQuick 2.15

// TODO: Add simulation for voltage, torque, and temperature!

Item {
    // Vehicle properties that the UI can bind to
    property int speed: 0
    property int rpm: 0
    property real battery: 100.0
    property real temperature: 45.0

    // Internal simulation state
    property real time: 0
    property real targetSpeed: 30

    // Main simulation timer
    Timer {
        interval: 50  // 20 FPS updates
        running: true
        repeat: true

        onTriggered: {
            time += 0.05
            updateSimulation()
        }
    }

    // Simple simulation logic
    function updateSimulation() {
        // Randomly change target speed occasionally
        if (Math.random() < 0.01) {  // 1% chance each frame
            targetSpeed = Math.random() * 120  // 0-120 mph
        }

        // Smoothly approach target speed
        var diff = targetSpeed - speed
        speed += diff * 0.02  // 2% of difference each frame
        speed = Math.max(0, Math.min(180, speed))  // Keep in 0-180 range

        // Update dependent values
        rpm = speed * 45 + Math.sin(time * 3) * 100  // RPM follows speed

        // Battery slowly drains
        battery = Math.max(0, battery - 0.01)
        if (battery <= 0) battery = 100  // Reset when empty


    }

}
