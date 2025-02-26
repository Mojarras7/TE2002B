Conversor de binario a decimal en FPGA con Quartus y Verilog

📌 Descripción

Este proyecto implementa  un conversor de binario a deciman en un FPGA utilizando Quartus y Verilog. Se usa el display de 7 segmentos para mostrar la conversión de la entrada que se le asigne por medio de los pines.

⚙️ Requisitos

Quartus Prime (Intel FPGA)

FPGA compatible (Ejemplo: Cyclone IV, MAX10)

Cable de programación JTAG

📂 Estructura del Proyecto

/BinarioDecimal

│── BCD.v # Módulo principal 

│── BCD_tb.v # Testbench para simulación

│── Binario.qpf # Archivo del proyecto en Quartus

│── BinarioDecimal.qsf # Archivo de configuración del FPGA

│── Display.v # Módulo Display 7 segmentos

│── README.md # Este archivo