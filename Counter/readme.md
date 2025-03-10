Counter con Load, up y down en FPGA con Quartus y Verilog

📌 Descripción

Este proyecto implementa de un counter en segundos, con la posibilidad de cargar un valor en binario y poder decidir si cuenta para arriba o para abajo.

⚙️ Requisitos

Quartus Prime (Intel FPGA)

FPGA compatible (Ejemplo: Cyclone IV, MAX10)

Cable de programación JTAG

📂 Estructura del Proyecto

/gates_project

│── mainCounterClkDiv.v         # Módulo principal con compuertas lógicas

│── ClockDiv.v      # Módulo de clock divider

│── mainCounterClkDiv.qpf       # Archivo del proyecto en Quartus

│── ClockDiv.qsf       # Archivo de configuración del FPGA

│── README.md       # Este archivo