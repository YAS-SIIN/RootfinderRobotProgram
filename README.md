# Rootfinder Robot Program 🤖

A line-following robot control system developed for the university robotics team "Aras" using BASCOM-AVR programming language. This project implements path-finding algorithms for autonomous robot navigation with sensor-based decision making.

<img width="1555" height="631" alt="image" src="https://github.com/user-attachments/assets/2c52d4c8-bdf3-4860-8254-8e8a1c15a5e3" />

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Hardware Components](#hardware-components)
- [Software Architecture](#software-architecture)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Circuit Diagram](#circuit-diagram)
- [Team](#team)
- [License](#license)

## 🎯 Overview

The Rootfinder Robot Program is designed to control a line-following robot that can navigate autonomously along predefined paths. The system uses multiple sensors to detect line positions and makes real-time decisions for motor control, enabling the robot to follow both white and black lines with precision.

### Key Capabilities
- **Dual-mode operation**: White line and black line following
- **Real-time sensor processing**: Multiple sensor inputs for accurate path detection
- **PWM motor control**: Variable speed control for smooth navigation
- **LCD feedback**: Real-time status display (ATmega32 version)
- **Multiple microcontroller support**: ATmega8 and ATmega32 variants

## ✨ Features

- **Multi-sensor line detection** with 7 digital sensors
- **Intelligent movement algorithms**:
  - Forward movement (`Mostaghim`)
  - Left turn (`Chap`)
  - Right turn (`Rast`)
  - Stop functionality
- **PWM-based speed control** for precise motor management
- **State-based navigation** with sensor pattern recognition
- **LCD display integration** for debugging and status monitoring
- **Modular code architecture** for different microcontroller variants

## 🔧 Hardware Components

### Microcontrollers
- **ATmega8** (1MHz/4MHz crystal) - Basic line following
- **ATmega32** (3MHz crystal) - Advanced features with LCD

### Key Components
- **L293D Motor Driver** - Dual H-bridge for motor control
- **LM7805 Voltage Regulator** - 5V power supply
- **16x2 LCD Display** (ATmega32 version)
- **Line Detection Sensors** - IR sensor array
- **Crystal Oscillators** - Timing reference
- **DC Motors** - Robot movement
- **Power Supply** - 10V battery system

### Pin Configuration

#### ATmega8 Version
```
Sensors: PORTD (PD0-PD6) - Input with pull-up
Motors: PORTB (PB0, PB3, PB4, PB5) - Output
PWM: Timer1 (OC1A, OC1B) - Motor speed control
```

#### ATmega32 Version
```
LCD: PORTA (PA0-PA5) - Display interface
Sensors: PORTB (PB0-PB6) - Input with pull-up
Motors: PORTD (PD0-PD3) - Output
PWM: Timer1 (OC1A, OC1B) - Motor speed control
```

## 🏗️ Software Architecture

### Core Functions

1. **Sensor Scanning (`Scan`)**
   - Continuous monitoring of sensor inputs
   - Pattern matching for line detection
   - Decision routing to movement functions

2. **Movement Control**
   - `Mostaghim()` - Forward movement
   - `Chap()` - Left turn with differential speed
   - `Rast()` - Right turn with differential speed
   - `R_stop()` - Complete stop

3. **PWM Motor Control**
   - Variable speed control (0-255 range)
   - Differential steering for turns
   - Smooth acceleration/deceleration

### Algorithm Logic

The robot uses binary pattern matching on sensor inputs:

```bascom
Select Case PinD/PinB:
    Case &B00001000: Goto Forward    ' Center sensor active
    Case &B00000100: Goto LeftTurn   ' Left sensor active
    Case &B00010000: Goto RightTurn  ' Right sensor active
    Case &B01111111: Goto Stop       ' All sensors active
End Select
```

## 📁 Project Structure

```
RootfinderRobotProgram/
├── final.bas                 # ATmega8 basic version
├── FINAL_8/
│   └── final.bas            # ATmega8 optimized version
├── FINAL_32/
│   └── final.bas            # ATmega32 version with LCD
├── *.HEX                    # Compiled hex files
├── *.BIN                    # Binary files
├── *.RPT                    # Compilation reports
├── PDF/
│   └── ISIS Professional - UNTITLED.pdf  # Circuit diagram
├── Screenshot 2025-09-08 232658.jpg      # Circuit schematic
└── README.md               # This file
```

## 🚀 Installation

### Prerequisites
- **BASCOM-AVR** compiler
- **AVR programmer** (USBasp, STK500, etc.)
- **Proteus ISIS** (for simulation)

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/RootfinderRobotProgram.git
   cd RootfinderRobotProgram
   ```

2. **Select appropriate version**
   - For ATmega8: Use `final.bas` or `FINAL_8/final.bas`
   - For ATmega32: Use `FINAL_32/final.bas`

3. **Compile with BASCOM-AVR**
   ```
   Open .bas file in BASCOM-AVR
   Press F7 to compile
   Generate .hex file
   ```

4. **Program the microcontroller**
   ```bash
   avrdude -p m8 -c usbasp -U flash:w:final.hex
   # or for ATmega32:
   avrdude -p m32 -c usbasp -U flash:w:final.hex
   ```

## 🎮 Usage

### Basic Operation

1. **Power on** the robot
2. **Place on track** - The robot will automatically detect line type
3. **Monitor LCD** (ATmega32 version) for status updates:
   - "Mostaghim" - Moving forward
   - "Chap" - Turning left  
   - "Rast" - Turning right
   - "STOP" - Stopped

### Line Types
- **White lines on black surface** (`Scansefid` mode)
- **Black lines on white surface** (`Scansiyah` mode)

### Speed Adjustment
Modify PWM values in the code:
```bascom
Pwm1a = 60    ' Left motor speed (0-255)
Pwm1b = 60    ' Right motor speed (0-255)
```

## 📊 Circuit Diagram

The project includes a complete circuit schematic showing:
- Microcontroller connections
- Sensor array interface
- Motor driver circuit
- Power supply regulation
- LCD display connections

See `PDF/ISIS Professional - UNTITLED.pdf` and the included circuit image for detailed schematics.

## 👥 Team

**University**: Shahid Madani University  
**Robotics Team**: Aras (آراس)

### Contributors
- [**Sadeg Asadnezhad**](https://github.com/sadeq1996) - Hardware Design & Programming
- **Ali Shrimohamadi** - System Integration & Testing

### Special Thanks
- R@M 3d! - Programming contributor

## 📜 License

This project was developed as part of university coursework for educational purposes. Feel free to use and modify for educational and non-commercial purposes.

## 🤝 Contributing

This is a university project archive, but contributions and improvements are welcome:

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📞 Support

For questions or support regarding this project, please create an issue in the GitHub repository.

---

**Note**: This project represents academic work completed during university robotics team participation and serves as a reference for BASCOM-AVR programming and robotics control systems.
