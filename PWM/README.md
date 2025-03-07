# PWM
Implementación de PWM en FPGA con Quartus y Verilog

📌 Descripción

Este proyecto implementa un PWM para el movimiento de un servo, modificando su duty cycle para generar el movimiento cuando detecta un pulso de botón, ya sea el botón de incremento o decremento

⚙️ Requisitos

Quartus Prime (Intel FPGA)

FPGA compatible (Ejemplo: Cyclone IV, MAX10)

Cable de programación JTAG

Servomotor compatible con señal PWM (ejemplo: SG90, MG995)

Fuente de alimentación externa para el servomotor (5V)

Conexiones de cables jumper


📂 Estructura del Proyecto

/PWM

│── PWM.v # Módulo principal 

│── PWM_tb.v # Testbench para simulación

│── PWM.qpf # Archivo del proyecto en Quartus

│── PWM.qsf # Archivo de configuración del FPGA

│── README.md # Este archivo

/Capturas


│── Capturas del funcionamiento
