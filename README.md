# Infrared Camera Based Rider Safety System

## Overview

The **Infrared Camera Based Rider Safety System** is a capstone project aimed at improving two-wheeler road safety through automated helmet detection and vehicle control.

The system utilizes an **IR-CUT OV2640 camera**, **STM32VGT6 microcontroller**, and **TFT LCD display** to monitor rider helmet compliance under both daytime and nighttime conditions. Based on the detection results, the system can provide visual feedback and interface with vehicle ignition control logic.

---

## Project Objectives

- Detect helmet usage in real time.
    
- Operate reliably during day and night conditions.
    
- Provide immediate rider feedback through a TFT display.
    
- Demonstrate vehicle safety interlocking concepts.
    
- Develop a low-cost embedded solution suitable for two-wheelers.
    

---

## Final Hardware Configuration

|Component|Purpose|
|---|---|
|STM32VGT6 Microcontroller|Main processing and control unit|
|OV2640 IR-CUT Camera|Image acquisition|
|TFT LCD Display|User feedback|
|12V → 5V Buck Converter|Vehicle power regulation|
|Type-C to Type-C Cable|Power/programming|
|Aviation Connectors|Reliable field connections|
|4-Core Insulated Wire|Power and signal routing|
|Acrylic Base|Mechanical mounting support|

> **Note:** Early versions included a custom buck converter design. During final implementation, an off-the-shelf buck converter was selected to improve reliability and reduce integration complexity.

---

## System Architecture

```text
                OV2640 IR-CUT Camera
                          │
                          ▼
                STM32VGT6 Controller
                          │
            ┌─────────────┴─────────────┐
            ▼                           ▼
      TFT LCD Display           Vehicle Control
                               (Ignition Logic)
```

---

## Repository Structure

```text
.
├── README.md
├── hardware_setup.jpg
├── InfraRed Camera Based Rider Safety.png
│
├── Final review/
│   ├── Capstone_project_report.pdf
│   ├── video1.mp4
│   ├── video2.mp4
│   └── InfraRed Camera Based Rider Safety.png
│
├── Helmet-detection-using-deep-learning-main/
│   ├── detection_script.m
│   ├── Export_model_script.m
│   ├── Export_ONNX_model.m
│   ├── Sample_for_prediction.m
│   ├── short_TrainYOLOv2ObjectDetector.mlx
│   ├── README.md
│   └── Supporting model files
│
├── Electrical simulations/
│   ├── Buck converter circuit design.docx
│   ├── buck_converter_64V_5V.asc
│   ├── LT8610_DC1749A.asc
│   └── TPS54360_TINA_TRANS/
│
├── SimulinkModel.slx
├── Simulink model.slx
├── commented_blocks.slx
├── motor_test.slx
├── MOSFET_based_Latching_circuit.slx
│
├── Simulation_Model.pdf
├── Buck Converter calculation.pdf
├── Buck Converter graphs.pdf
└── Additional project assets
```

---

## Software & Development Tools

### MATLAB / Simulink

- MATLAB
    
- Simulink
    
- Deep Learning Toolbox
    
- Computer Vision Toolbox
    
- Image Processing Toolbox
    

### Embedded Platform

- STM32VGT6
    
- Embedded C/C++
    

### Supporting Tools

- LTspice
    
- TINA-TI
    
- ONNX Export Utilities
    

---

## Machine Learning Workflow

The project development pipeline consists of:

1. Dataset collection
    
2. Data annotation
    
3. YOLOv2 model training
    
4. Model validation
    
5. MATLAB/Simulink integration
    
6. Embedded deployment
    
7. Hardware testing
    

---

## Important Files

### Documentation

|File|Description|
|---|---|
|[Capstone Project Report](https://chatgpt.com/c/Final%20review/Capstone_project_report.pdf)|Final project report|
|[Simulation Model](https://chatgpt.com/c/Simulation_Model.pdf)|System simulation documentation|
|[Buck Converter Calculations](https://chatgpt.com/c/Buck%20Converter%20calculation.pdf)|Power supply design calculations|
|[Buck Converter Graphs](https://chatgpt.com/c/Buck%20Converter%20graphs.pdf)|Converter performance plots|

### Simulink Models

|File|Description|
|---|---|
|[SimulinkModel.slx](https://chatgpt.com/c/SimulinkModel.slx)|Main simulation model|
|[Simulink model.slx](https://chatgpt.com/c/Simulink%20model.slx)|Alternative model version|
|[commented_blocks.slx](https://chatgpt.com/c/commented_blocks.slx)|Annotated design model|
|[MOSFET_based_Latching_circuit.slx](https://chatgpt.com/c/MOSFET_based_Latching_circuit.slx)|Vehicle control simulation|
|[motor_test.slx](https://chatgpt.com/c/motor_test.slx)|Motor testing simulation|

### Detection Scripts

Located under:

```text
Helmet-detection-using-deep-learning-main/
```

Key files:

- `detection_script.m`
    
- `Sample_for_prediction.m`
    
- `Export_model_script.m`
    
- `Export_ONNX_model.m`
    
- `short_TrainYOLOv2ObjectDetector.mlx`
    

---

## Results

### Hardware Prototype

![Hardware Setup](https://chatgpt.com/c/hardware_setup.jpg)

### Final System Concept

![System Overview](https://chatgpt.com/c/InfraRed%20Camera%20Based%20Rider%20Safety.png)

The prototype successfully demonstrated:

- Helmet detection capability
    
- TFT display feedback
    
- Embedded control integration
    
- Day/night image acquisition using IR-CUT camera
    
- Vehicle safety control concepts
    

---

## Demonstration Videos

- [Video Demonstration 1](https://chatgpt.com/c/Final%20review/video1.mp4)
    
- [Video Demonstration 2](https://chatgpt.com/c/Final%20review/video2.mp4)
    

---

## Future Improvements

- Dedicated Edge AI accelerator
    
- Rider and pillion differentiation
    
- Wireless telemetry
    
- Mobile application integration
    
- Vehicle CAN bus support
    
- Weatherproof industrial enclosure
    
- Real-time performance optimization
    

---

## Authors

Capstone Project Team

Department of Electrical and Electronics Engineering

---

## Disclaimer

This project was developed for academic and research purposes. Any real-world deployment involving vehicle control systems should undergo extensive safety validation, testing, and regulatory compliance procedures.

---

## License

This repository is intended for educational and research use.