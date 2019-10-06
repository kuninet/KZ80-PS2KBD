EESchema Schematic File Version 4
LIBS:KZ80-PS2KBD-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "KZ80 PS/2 Keyboard Interface board"
Date "2019-08-18"
Rev "1"
Comp "KUNI-NET"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_ATmega:ATmega328P-PU U4
U 1 1 5D5B4103
P 2000 5650
F 0 "U4" H 1359 5696 50  0000 R CNN
F 1 "ATmega328P-PU" H 1359 5605 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm_Socket" H 2000 5650 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 2000 5650 50  0001 C CNN
	1    2000 5650
	1    0    0    -1  
$EndComp
$Comp
L Interface:8255 U3
U 1 1 5D5B41CE
P 6150 4850
F 0 "U3" H 6550 6350 50  0000 C CNN
F 1 "8255" H 5800 6400 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 6150 5150 50  0001 C CNN
F 3 "http://aturing.umcs.maine.edu/~meadow/courses/cos335/Intel8255A.pdf" H 6150 5150 50  0001 C CNN
	1    6150 4850
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Mini-DIN-6 J2
U 1 1 5D5B42BC
P 3500 1900
F 0 "J2" H 3500 2267 50  0000 C CNN
F 1 "PS/2 KB" H 3500 2176 50  0000 C CNN
F 2 "conn-din:din6-schurter-4850261" H 3500 1900 50  0001 C CNN
F 3 "http://service.powerdynamics.com/ec/Catalog17/Section%2011.pdf" H 3500 1900 50  0001 C CNN
	1    3500 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 4450 2950 4450
Wire Wire Line
	2600 4550 3050 4550
Wire Wire Line
	2600 4650 3150 4650
Wire Wire Line
	2600 4750 3250 4750
Wire Wire Line
	2600 4850 3350 4850
Wire Wire Line
	2600 4950 3450 4950
Wire Wire Line
	2600 5050 3550 5050
Wire Wire Line
	2600 5150 3650 5150
$Comp
L Device:R_Network08_US RN1
U 1 1 5D5B4562
P 3350 4100
F 0 "RN1" H 3730 4146 50  0000 L CNN
F 1 "10k" H 3730 4055 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 3825 4100 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 3350 4100 50  0001 C CNN
	1    3350 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 4300 2950 4450
Wire Wire Line
	2950 4450 5450 4450
Wire Wire Line
	3050 4300 3050 4550
Wire Wire Line
	3050 4550 5450 4550
Wire Wire Line
	3150 4300 3150 4650
Wire Wire Line
	3150 4650 5450 4650
Wire Wire Line
	3250 4300 3250 4750
Wire Wire Line
	3350 4300 3350 4850
Wire Wire Line
	3350 4850 3950 4850
Wire Wire Line
	3450 4300 3450 4950
Wire Wire Line
	3450 4950 4000 4950
Wire Wire Line
	3550 4300 3550 5050
Wire Wire Line
	3550 5050 5450 5050
Wire Wire Line
	3650 4300 3650 5150
Wire Wire Line
	3650 5150 5450 5150
$Comp
L power:VCC #PWR011
U 1 1 5D5B4DC4
P 2950 3800
F 0 "#PWR011" H 2950 3650 50  0001 C CNN
F 1 "VCC" H 2967 3973 50  0000 C CNN
F 2 "" H 2950 3800 50  0001 C CNN
F 3 "" H 2950 3800 50  0001 C CNN
	1    2950 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 3800 2950 3900
Wire Wire Line
	2600 5350 5450 5350
Wire Wire Line
	2600 5450 5450 5450
Wire Wire Line
	2600 5550 5450 5550
Wire Wire Line
	2600 5650 5450 5650
NoConn ~ 1400 4450
$Comp
L power:VCC #PWR013
U 1 1 5D5B8156
P 2000 4000
F 0 "#PWR013" H 2000 3850 50  0001 C CNN
F 1 "VCC" H 2017 4173 50  0000 C CNN
F 2 "" H 2000 4000 50  0001 C CNN
F 3 "" H 2000 4000 50  0001 C CNN
	1    2000 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 4000 2000 4050
Wire Wire Line
	2000 4050 2100 4050
Wire Wire Line
	2100 4050 2100 4150
Connection ~ 2000 4050
Wire Wire Line
	2000 4050 2000 4150
$Comp
L power:GND #PWR019
U 1 1 5D5B8A12
P 6150 6550
F 0 "#PWR019" H 6150 6300 50  0001 C CNN
F 1 "GND" H 6155 6377 50  0000 C CNN
F 2 "" H 6150 6550 50  0001 C CNN
F 3 "" H 6150 6550 50  0001 C CNN
	1    6150 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 6450 6150 6550
$Comp
L power:GND #PWR020
U 1 1 5D5B8EA7
P 2000 7250
F 0 "#PWR020" H 2000 7000 50  0001 C CNN
F 1 "GND" H 2005 7077 50  0000 C CNN
F 2 "" H 2000 7250 50  0001 C CNN
F 3 "" H 2000 7250 50  0001 C CNN
	1    2000 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 7150 2000 7250
$Comp
L 74xx:74LS139 U1
U 1 1 5D5B4E95
P 8450 2850
F 0 "U1" H 8450 2800 50  0000 C CNN
F 1 "74HC139" H 8450 2500 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 8450 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 8450 2850 50  0001 C CNN
	1    8450 2850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U1
U 2 1 5D5B4ED2
P 8450 3600
F 0 "U1" H 8450 3550 50  0000 C CNN
F 1 "74HC139" H 8450 3250 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 8450 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 8450 3600 50  0001 C CNN
	2    8450 3600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U1
U 3 1 5D5B5011
P 8450 5700
F 0 "U1" H 8400 5700 50  0000 L CNN
F 1 "74HC139" H 8100 5350 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 8450 5700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 8450 5700 50  0001 C CNN
	3    8450 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 5950 2600 5950
Text GLabel 4800 6050 2    50   Input ~ 0
RESET
Wire Wire Line
	4750 6050 4800 6050
Text GLabel 7000 3550 2    50   Input ~ 0
RESET
Wire Wire Line
	6850 3550 7000 3550
Text GLabel 7000 3950 2    50   Input ~ 0
~IORD
Text GLabel 7000 4050 2    50   Input ~ 0
~IOWR
Wire Wire Line
	6850 3950 7000 3950
Wire Wire Line
	6850 4050 7000 4050
Text GLabel 7700 2250 2    50   Input ~ 0
A[0..1]
Wire Wire Line
	6850 4350 7000 4350
Wire Wire Line
	6850 4450 7000 4450
Entry Wire Line
	7000 4350 7100 4250
Entry Wire Line
	7000 4450 7100 4350
Wire Bus Line
	7100 4150 7600 4150
Text Label 6900 4350 0    50   ~ 0
A0
Text Label 6900 4450 0    50   ~ 0
A1
Text GLabel 7350 4600 2    50   Input ~ 0
D[0..1]
Wire Wire Line
	6850 4750 7000 4750
Entry Wire Line
	7000 4750 7100 4650
Entry Wire Line
	7000 4850 7100 4750
Text Label 6900 4750 0    50   ~ 0
D0
Wire Wire Line
	6850 4850 7000 4850
Text Label 6900 4850 0    50   ~ 0
D1
Wire Wire Line
	6850 4950 7000 4950
Entry Wire Line
	7000 4950 7100 4850
Entry Wire Line
	7000 5050 7100 4950
Text Label 6900 4950 0    50   ~ 0
D2
Wire Wire Line
	6850 5050 7000 5050
Text Label 6900 5050 0    50   ~ 0
D3
Wire Wire Line
	6850 5150 7000 5150
Entry Wire Line
	7000 5150 7100 5050
Entry Wire Line
	7000 5250 7100 5150
Text Label 6900 5150 0    50   ~ 0
D4
Wire Wire Line
	6850 5250 7000 5250
Text Label 6900 5250 0    50   ~ 0
D5
Wire Wire Line
	6850 5350 7000 5350
Entry Wire Line
	7000 5350 7100 5250
Entry Wire Line
	7000 5450 7100 5350
Text Label 6900 5350 0    50   ~ 0
D6
Wire Wire Line
	6850 5450 7000 5450
Text Label 6900 5450 0    50   ~ 0
D7
Wire Bus Line
	7100 4600 7350 4600
Text GLabel 7000 3850 2    50   Input ~ 0
PPI-CE
Wire Wire Line
	7000 3850 6850 3850
Wire Wire Line
	7700 2750 7950 2750
Wire Wire Line
	7700 2850 7950 2850
Wire Wire Line
	7700 3500 7950 3500
Wire Wire Line
	7700 3600 7950 3600
Entry Wire Line
	7600 2850 7700 2750
Entry Wire Line
	7600 2950 7700 2850
Entry Wire Line
	7600 3600 7700 3500
Entry Wire Line
	7600 3700 7700 3600
Wire Bus Line
	7700 2250 7600 2250
Wire Wire Line
	7900 3800 7950 3800
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J5
U 1 1 5D5C6A62
P 9250 3600
F 0 "J5" H 9300 3800 50  0000 C CNN
F 1 "ADR-JP1" H 9350 3300 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Vertical" H 9250 3600 50  0001 C CNN
F 3 "~" H 9250 3600 50  0001 C CNN
	1    9250 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 3500 9750 3500
Wire Wire Line
	9750 3500 9750 3600
Wire Wire Line
	9750 3800 9550 3800
Wire Wire Line
	9550 3600 9750 3600
Connection ~ 9750 3600
Wire Wire Line
	9750 3600 9750 3700
Wire Wire Line
	9550 3700 9750 3700
Connection ~ 9750 3700
Wire Wire Line
	9750 3700 9750 3800
Wire Wire Line
	7950 3050 7800 3050
Wire Wire Line
	7800 3050 7800 3250
Wire Wire Line
	7800 3250 9750 3250
Wire Wire Line
	9750 3250 9750 3500
Connection ~ 9750 3500
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J4
U 1 1 5D5CACA8
P 9250 2850
F 0 "J4" H 9300 3050 50  0000 C CNN
F 1 "ADR-JP2" H 9350 2550 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Vertical" H 9250 2850 50  0001 C CNN
F 3 "~" H 9250 2850 50  0001 C CNN
	1    9250 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 3500 9050 3500
Wire Wire Line
	8950 3600 9050 3600
Wire Wire Line
	8950 3700 9050 3700
Wire Wire Line
	8950 3800 9050 3800
Wire Wire Line
	8950 2750 9050 2750
Wire Wire Line
	8950 2850 9050 2850
Wire Wire Line
	8950 2950 9050 2950
Wire Wire Line
	8950 3050 9050 3050
Wire Wire Line
	9550 2750 9750 2750
Wire Wire Line
	9750 2750 9750 2850
Wire Wire Line
	9750 3050 9550 3050
Wire Wire Line
	9550 2850 9750 2850
Connection ~ 9750 2850
Wire Wire Line
	9750 2850 9750 2950
Wire Wire Line
	9550 2950 9750 2950
Connection ~ 9750 2950
Wire Wire Line
	9750 2950 9750 3050
Text GLabel 9900 2750 2    50   Output ~ 0
PPI-CE
Wire Wire Line
	9900 2750 9750 2750
Connection ~ 9750 2750
Text Label 7800 3500 0    50   ~ 0
A6
Text Label 7800 3600 0    50   ~ 0
A5
Text Label 7800 2750 0    50   ~ 0
A4
Text Label 7800 2850 0    50   ~ 0
A3
Wire Bus Line
	7600 4150 7600 4400
Connection ~ 7600 4150
Entry Wire Line
	7600 4400 7700 4500
$Comp
L Jumper:Jumper_3_Open JP1
U 1 1 5D5E4FC1
P 8300 4500
F 0 "JP1" H 8100 4400 50  0000 C CNN
F 1 "A7_JP" H 8300 4650 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 8300 4500 50  0001 C CNN
F 3 "~" H 8300 4500 50  0001 C CNN
	1    8300 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	7700 4500 7900 4500
Wire Wire Line
	8300 4200 8300 4350
Wire Wire Line
	7900 3800 7900 4200
Wire Wire Line
	7900 4200 8300 4200
Wire Wire Line
	7900 4500 7900 4850
Wire Wire Line
	7900 4850 9550 4850
Wire Wire Line
	9550 4850 9550 4500
Wire Wire Line
	9550 4500 9450 4500
Connection ~ 7900 4500
Wire Wire Line
	7900 4500 8050 4500
Wire Wire Line
	8750 4500 8550 4500
$Comp
L power:VCC #PWR07
U 1 1 5D5EF960
P 6150 3150
F 0 "#PWR07" H 6150 3000 50  0001 C CNN
F 1 "VCC" H 6167 3323 50  0000 C CNN
F 2 "" H 6150 3150 50  0001 C CNN
F 3 "" H 6150 3150 50  0001 C CNN
	1    6150 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 3150 6150 3200
$Comp
L power:VCC #PWR015
U 1 1 5D5F417C
P 8450 5100
F 0 "#PWR015" H 8450 4950 50  0001 C CNN
F 1 "VCC" H 8467 5273 50  0000 C CNN
F 2 "" H 8450 5100 50  0001 C CNN
F 3 "" H 8450 5100 50  0001 C CNN
	1    8450 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5D5F6651
P 8450 6300
F 0 "#PWR018" H 8450 6050 50  0001 C CNN
F 1 "GND" H 8455 6127 50  0000 C CNN
F 2 "" H 8450 6300 50  0001 C CNN
F 3 "" H 8450 6300 50  0001 C CNN
	1    8450 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 5100 8450 5150
Wire Wire Line
	8450 5150 9000 5150
Wire Wire Line
	9000 5150 9000 5200
Connection ~ 8450 5150
Wire Wire Line
	8450 5150 8450 5200
Wire Wire Line
	8450 6200 8450 6250
Wire Wire Line
	8450 6250 9000 6250
Wire Wire Line
	9000 6250 9000 6200
Connection ~ 8450 6250
Wire Wire Line
	8450 6250 8450 6300
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J3
U 1 1 5D607B84
P 1800 2300
F 0 "J3" H 1850 3417 50  0000 C CNN
F 1 "SBC8080 BUS" H 1850 3326 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x20_P2.54mm_Horizontal" H 1800 2300 50  0001 C CNN
F 3 "~" H 1800 2300 50  0001 C CNN
	1    1800 2300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR01
U 1 1 5D607C18
P 1400 1300
F 0 "#PWR01" H 1400 1150 50  0001 C CNN
F 1 "VCC" H 1417 1473 50  0000 C CNN
F 2 "" H 1400 1300 50  0001 C CNN
F 3 "" H 1400 1300 50  0001 C CNN
	1    1400 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 1300 1400 1400
Wire Wire Line
	1400 1500 1600 1500
Wire Wire Line
	1600 1400 1400 1400
Connection ~ 1400 1400
Wire Wire Line
	1400 1400 1400 1500
$Comp
L power:GND #PWR02
U 1 1 5D60D430
P 2500 1600
F 0 "#PWR02" H 2500 1350 50  0001 C CNN
F 1 "GND" H 2505 1427 50  0000 C CNN
F 2 "" H 2500 1600 50  0001 C CNN
F 3 "" H 2500 1600 50  0001 C CNN
	1    2500 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 1400 2200 1400
Wire Wire Line
	2500 1400 2500 1600
Wire Wire Line
	2100 1500 2200 1500
Wire Wire Line
	2200 1500 2200 1400
Connection ~ 2200 1400
Wire Wire Line
	2200 1400 2500 1400
Wire Wire Line
	1400 1800 1600 1800
Wire Wire Line
	2100 1800 2300 1800
Text Label 2150 1800 0    50   ~ 0
D1
Text Label 1400 1800 0    50   ~ 0
D0
Wire Wire Line
	1400 1900 1600 1900
Text Label 1400 1900 0    50   ~ 0
D2
Wire Wire Line
	1400 2000 1600 2000
Text Label 1400 2000 0    50   ~ 0
D4
Wire Wire Line
	1400 2100 1600 2100
Text Label 1400 2100 0    50   ~ 0
D6
Wire Wire Line
	2100 1900 2300 1900
Text Label 2150 1900 0    50   ~ 0
D3
Wire Wire Line
	2100 2000 2300 2000
Text Label 2150 2000 0    50   ~ 0
D5
Wire Wire Line
	2100 2100 2300 2100
Text Label 2150 2100 0    50   ~ 0
D7
$Comp
L power:VCC #PWR016
U 1 1 5D62D339
P 9850 5300
F 0 "#PWR016" H 9850 5150 50  0001 C CNN
F 1 "VCC" H 9867 5473 50  0000 C CNN
F 2 "" H 9850 5300 50  0001 C CNN
F 3 "" H 9850 5300 50  0001 C CNN
	1    9850 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5D62D360
P 9850 5800
F 0 "#PWR017" H 9850 5550 50  0001 C CNN
F 1 "GND" H 9855 5627 50  0000 C CNN
F 2 "" H 9850 5800 50  0001 C CNN
F 3 "" H 9850 5800 50  0001 C CNN
	1    9850 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 5D62D3D6
P 1050 1750
F 0 "C1" H 1168 1796 50  0000 L CNN
F 1 "10u" H 1168 1705 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 1088 1600 50  0001 C CNN
F 3 "~" H 1050 1750 50  0001 C CNN
	1    1050 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5D62D4F7
P 1550 4050
F 0 "C3" V 1298 4050 50  0000 C CNN
F 1 "0.1u" V 1389 4050 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 1588 3900 50  0001 C CNN
F 3 "~" H 1550 4050 50  0001 C CNN
	1    1550 4050
	0    1    1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 5D62D530
P 5850 3200
F 0 "C2" V 6102 3200 50  0000 C CNN
F 1 "0.1u" V 6011 3200 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 5888 3050 50  0001 C CNN
F 3 "~" H 5850 3200 50  0001 C CNN
	1    5850 3200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6000 3200 6150 3200
Connection ~ 6150 3200
Wire Wire Line
	6150 3200 6150 3250
$Comp
L power:GND #PWR09
U 1 1 5D639F84
P 5500 3250
F 0 "#PWR09" H 5500 3000 50  0001 C CNN
F 1 "GND" H 5505 3077 50  0000 C CNN
F 2 "" H 5500 3250 50  0001 C CNN
F 3 "" H 5500 3250 50  0001 C CNN
	1    5500 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3250 5500 3200
Wire Wire Line
	5500 3200 5700 3200
Wire Wire Line
	1700 4050 2000 4050
$Comp
L power:GND #PWR014
U 1 1 5D642E15
P 1300 4100
F 0 "#PWR014" H 1300 3850 50  0001 C CNN
F 1 "GND" H 1305 3927 50  0000 C CNN
F 2 "" H 1300 4100 50  0001 C CNN
F 3 "" H 1300 4100 50  0001 C CNN
	1    1300 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 4100 1300 4050
Wire Wire Line
	1300 4050 1400 4050
Wire Wire Line
	1050 1600 1050 1500
Wire Wire Line
	1050 1500 1400 1500
Connection ~ 1400 1500
$Comp
L power:GND #PWR04
U 1 1 5D64C7C1
P 1050 2000
F 0 "#PWR04" H 1050 1750 50  0001 C CNN
F 1 "GND" H 1055 1827 50  0000 C CNN
F 2 "" H 1050 2000 50  0001 C CNN
F 3 "" H 1050 2000 50  0001 C CNN
	1    1050 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 1900 1050 2000
$Comp
L Device:C C4
U 1 1 5D651737
P 9850 5550
F 0 "C4" H 9965 5596 50  0000 L CNN
F 1 "0.1u" H 9965 5505 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 9888 5400 50  0001 C CNN
F 3 "~" H 9850 5550 50  0001 C CNN
	1    9850 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 5300 9850 5350
Wire Wire Line
	9850 5700 9850 5750
$Comp
L Device:C C5
U 1 1 5D65B6E0
P 10300 5550
F 0 "C5" H 10415 5596 50  0000 L CNN
F 1 "0.1u" H 10415 5505 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 10338 5400 50  0001 C CNN
F 3 "~" H 10300 5550 50  0001 C CNN
	1    10300 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 5350 10300 5350
Wire Wire Line
	10300 5350 10300 5400
Connection ~ 9850 5350
Wire Wire Line
	9850 5350 9850 5400
Wire Wire Line
	10300 5700 10300 5750
Wire Wire Line
	10300 5750 9850 5750
Connection ~ 9850 5750
Wire Wire Line
	9850 5750 9850 5800
NoConn ~ 2600 5750
NoConn ~ 2600 5850
NoConn ~ 3200 2000
NoConn ~ 3200 1800
Text GLabel 4000 2000 2    50   Output ~ 0
DATA
Wire Wire Line
	3800 2000 4000 2000
$Comp
L power:VCC #PWR03
U 1 1 5D6957A0
P 3000 1750
F 0 "#PWR03" H 3000 1600 50  0001 C CNN
F 1 "VCC" H 3017 1923 50  0000 C CNN
F 2 "" H 3000 1750 50  0001 C CNN
F 3 "" H 3000 1750 50  0001 C CNN
	1    3000 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1750 3000 1900
Wire Wire Line
	3000 1900 3200 1900
Text GLabel 4000 1800 2    50   Output ~ 0
CLK
Wire Wire Line
	3800 1800 4000 1800
$Comp
L power:GND #PWR05
U 1 1 5D6A0C00
P 3900 2150
F 0 "#PWR05" H 3900 1900 50  0001 C CNN
F 1 "GND" H 3905 1977 50  0000 C CNN
F 2 "" H 3900 2150 50  0001 C CNN
F 3 "" H 3900 2150 50  0001 C CNN
	1    3900 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 1900 3900 1900
Wire Wire Line
	3900 1900 3900 2150
Text GLabel 1400 2200 0    50   Input ~ 0
~IORD
Text GLabel 1400 2300 0    50   Input ~ 0
~IOWR
Wire Wire Line
	1400 2200 1600 2200
Wire Wire Line
	1600 2300 1400 2300
NoConn ~ 1600 2400
Text GLabel 1400 2500 0    50   Input ~ 0
RESET
Wire Wire Line
	1400 2500 1600 2500
NoConn ~ 2100 2200
NoConn ~ 2100 2300
NoConn ~ 2100 2400
NoConn ~ 2100 2500
Wire Wire Line
	1400 2600 1600 2600
Text Label 1400 2600 0    50   ~ 0
A0
Wire Wire Line
	2100 2600 2300 2600
Text Label 2150 2600 0    50   ~ 0
A1
Wire Wire Line
	2100 2700 2300 2700
Text Label 2150 2700 0    50   ~ 0
A3
Wire Wire Line
	2100 2800 2300 2800
Text Label 2150 2800 0    50   ~ 0
A5
Wire Wire Line
	2100 2900 2300 2900
Text Label 2150 2900 0    50   ~ 0
A7
Wire Wire Line
	1400 2800 1600 2800
Text Label 1400 2800 0    50   ~ 0
A4
Wire Wire Line
	1400 2900 1600 2900
Text Label 1400 2900 0    50   ~ 0
A6
NoConn ~ 1600 2700
NoConn ~ 1600 3000
NoConn ~ 1600 3100
NoConn ~ 1600 3200
NoConn ~ 1600 3300
NoConn ~ 2100 3300
NoConn ~ 2100 3200
NoConn ~ 2100 3100
NoConn ~ 2100 3000
$Comp
L Connector_Generic:Conn_01x06 J1
U 1 1 5D76EC10
P 6950 1550
F 0 "J1" H 6950 1850 50  0000 L CNN
F 1 "232C(DEBUG)" H 6850 1150 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 6950 1550 50  0001 C CNN
F 3 "~" H 6950 1550 50  0001 C CNN
	1    6950 1550
	1    0    0    -1  
$EndComp
Text Notes 7050 1400 0    50   ~ 0
GND
Text Notes 7050 1500 0    50   ~ 0
RTS
Text Notes 7050 1600 0    50   ~ 0
+5V
Text Notes 7050 1700 0    50   ~ 0
RxD
Text Notes 7050 1800 0    50   ~ 0
TxD
Text Notes 7050 1900 0    50   ~ 0
CTS
NoConn ~ 6750 1850
NoConn ~ 6750 1550
NoConn ~ 6750 1450
$Comp
L power:GND #PWR06
U 1 1 5D784631
P 6600 2000
F 0 "#PWR06" H 6600 1750 50  0001 C CNN
F 1 "GND" H 6605 1827 50  0000 C CNN
F 2 "" H 6600 2000 50  0001 C CNN
F 3 "" H 6600 2000 50  0001 C CNN
	1    6600 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 1350 6600 1350
Wire Wire Line
	6600 1350 6600 2000
Text GLabel 6400 1650 0    50   BiDi ~ 0
TxD
Wire Wire Line
	6400 1650 6750 1650
Text GLabel 6400 1750 0    50   BiDi ~ 0
RxD
Wire Wire Line
	6400 1750 6750 1750
Text GLabel 2850 6150 2    50   BiDi ~ 0
TxD
Text GLabel 2850 6250 2    50   BiDi ~ 0
RxD
Wire Wire Line
	2600 6150 2850 6150
Wire Wire Line
	2850 6250 2600 6250
Text GLabel 2850 6450 2    50   Input ~ 0
DATA
Text GLabel 2850 6350 2    50   Input ~ 0
CLK
Wire Wire Line
	2600 6350 2850 6350
Wire Wire Line
	2600 6450 2850 6450
NoConn ~ 2600 6550
NoConn ~ 2600 6650
NoConn ~ 2600 6750
NoConn ~ 2600 6850
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J6
U 1 1 5D7F9F69
P 4400 3750
F 0 "J6" H 4450 4067 50  0000 C CNN
F 1 "ICSP" H 4450 3976 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 4400 3750 50  0001 C CNN
F 3 "~" H 4400 3750 50  0001 C CNN
	1    4400 3750
	1    0    0    -1  
$EndComp
Connection ~ 2950 4450
Connection ~ 3050 4550
Connection ~ 3150 4650
Connection ~ 3250 4750
Connection ~ 3350 4850
Connection ~ 3450 4950
Connection ~ 3550 5050
Connection ~ 3650 5150
Wire Wire Line
	3950 3650 4200 3650
Wire Wire Line
	4200 3750 4000 3750
Wire Wire Line
	4000 3750 4000 4950
Connection ~ 4000 4950
Wire Wire Line
	4000 4950 5450 4950
Wire Wire Line
	3250 4750 4900 4750
Wire Wire Line
	3950 3650 3950 4850
Connection ~ 3950 4850
Wire Wire Line
	3950 4850 5450 4850
$Comp
L power:VCC #PWR010
U 1 1 5D635C62
P 4800 3600
F 0 "#PWR010" H 4800 3450 50  0001 C CNN
F 1 "VCC" H 4817 3773 50  0000 C CNN
F 2 "" H 4800 3600 50  0001 C CNN
F 3 "" H 4800 3600 50  0001 C CNN
	1    4800 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5D635C97
P 4800 3900
F 0 "#PWR012" H 4800 3650 50  0001 C CNN
F 1 "GND" H 4805 3727 50  0000 C CNN
F 2 "" H 4800 3900 50  0001 C CNN
F 3 "" H 4800 3900 50  0001 C CNN
	1    4800 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3750 4900 3750
Wire Wire Line
	4900 3750 4900 4750
Connection ~ 4900 4750
Wire Wire Line
	4900 4750 5450 4750
Wire Wire Line
	4700 3650 4800 3650
Wire Wire Line
	4800 3650 4800 3600
Wire Wire Line
	4700 3850 4800 3850
Wire Wire Line
	4800 3850 4800 3900
$Comp
L 74xx:74HC00 U2
U 1 1 5D67FFC4
P 3050 5950
F 0 "U2" H 3050 5950 50  0000 C CNN
F 1 "74HC00" H 2850 6200 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 3050 5950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 3050 5950 50  0001 C CNN
	1    3050 5950
	-1   0    0    1   
$EndComp
Wire Wire Line
	4200 3850 4100 3850
$Comp
L 74xx:74HC00 U2
U 2 1 5D693116
P 3750 5950
F 0 "U2" H 3750 5950 50  0000 C CNN
F 1 "74HC00" H 3550 6200 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 3750 5950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 3750 5950 50  0001 C CNN
	2    3750 5950
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC00 U2
U 5 1 5D6931AF
P 9000 5700
F 0 "U2" H 9000 5700 50  0000 C CNN
F 1 "74HC00" H 9200 6050 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 9000 5700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 9000 5700 50  0001 C CNN
	5    9000 5700
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC00 U2
U 3 1 5D69D228
P 9050 4500
F 0 "U2" H 9050 4500 50  0000 C CNN
F 1 "74HC00" H 8850 4750 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 9050 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 9050 4500 50  0001 C CNN
	3    9050 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	9350 4400 9450 4400
Wire Wire Line
	9450 4400 9450 4500
Wire Wire Line
	9450 4600 9350 4600
Connection ~ 9450 4500
Wire Wire Line
	9450 4500 9450 4600
Wire Wire Line
	4700 5950 4750 5950
Wire Wire Line
	4750 5950 4750 6050
Wire Wire Line
	4750 6150 4700 6150
Connection ~ 4750 6050
Wire Wire Line
	4750 6050 4750 6150
Wire Wire Line
	4100 3850 4100 5850
$Comp
L Device:R_US R1
U 1 1 5D71058C
P 4100 3400
F 0 "R1" H 4168 3446 50  0000 L CNN
F 1 "10k" H 4168 3355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4140 3390 50  0001 C CNN
F 3 "~" H 4100 3400 50  0001 C CNN
	1    4100 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3550 4100 3850
Connection ~ 4100 3850
$Comp
L power:VCC #PWR08
U 1 1 5D71B0F1
P 4100 3200
F 0 "#PWR08" H 4100 3050 50  0001 C CNN
F 1 "VCC" H 4117 3373 50  0000 C CNN
F 2 "" H 4100 3200 50  0001 C CNN
F 3 "" H 4100 3200 50  0001 C CNN
	1    4100 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3200 4100 3250
Text Label 3950 3650 0    50   ~ 0
MISO
Text Label 4000 3750 0    50   ~ 0
SCK
Text Label 4100 3950 0    50   ~ 0
RESET
Text Label 4750 3750 0    50   ~ 0
MOSI
NoConn ~ 1600 1600
NoConn ~ 1600 1700
NoConn ~ 2100 1600
NoConn ~ 2100 1700
Text Label 7750 4500 0    50   ~ 0
A7
$Comp
L power:VCC #PWR0101
U 1 1 5D78632E
P 8700 1300
F 0 "#PWR0101" H 8700 1150 50  0001 C CNN
F 1 "VCC" H 8717 1473 50  0000 C CNN
F 2 "" H 8700 1300 50  0001 C CNN
F 3 "" H 8700 1300 50  0001 C CNN
	1    8700 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5D786367
P 9050 1450
F 0 "#PWR0102" H 9050 1200 50  0001 C CNN
F 1 "GND" H 9055 1277 50  0000 C CNN
F 2 "" H 9050 1450 50  0001 C CNN
F 3 "" H 9050 1450 50  0001 C CNN
	1    9050 1450
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5D786422
P 9050 1300
F 0 "#FLG0101" H 9050 1375 50  0001 C CNN
F 1 "PWR_FLAG" H 9050 1474 50  0000 C CNN
F 2 "" H 9050 1300 50  0001 C CNN
F 3 "~" H 9050 1300 50  0001 C CNN
	1    9050 1300
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5D7864B1
P 8700 1450
F 0 "#FLG0102" H 8700 1525 50  0001 C CNN
F 1 "PWR_FLAG" H 8700 1623 50  0000 C CNN
F 2 "" H 8700 1450 50  0001 C CNN
F 3 "~" H 8700 1450 50  0001 C CNN
	1    8700 1450
	-1   0    0    1   
$EndComp
Wire Wire Line
	8700 1300 8700 1450
Wire Wire Line
	9050 1300 9050 1450
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 5D7A7086
P 8400 4200
F 0 "#FLG0103" H 8400 4275 50  0001 C CNN
F 1 "PWR_FLAG" V 8400 4328 50  0000 L CNN
F 2 "" H 8400 4200 50  0001 C CNN
F 3 "~" H 8400 4200 50  0001 C CNN
	1    8400 4200
	0    1    1    0   
$EndComp
Wire Wire Line
	8300 4200 8400 4200
Connection ~ 8300 4200
Wire Wire Line
	3350 5850 3400 5850
Wire Wire Line
	3400 5850 3400 5950
Wire Wire Line
	3400 6050 3350 6050
Wire Wire Line
	3400 5950 3450 5950
Connection ~ 3400 5950
Wire Wire Line
	3400 5950 3400 6050
Wire Wire Line
	4050 5850 4100 5850
$Comp
L 74xx:74HC00 U2
U 4 1 5D7DE9CB
P 4400 6050
F 0 "U2" H 4400 6050 50  0000 C CNN
F 1 "74HC00" H 4200 6300 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 4400 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4400 6050 50  0001 C CNN
	4    4400 6050
	-1   0    0    1   
$EndComp
Wire Wire Line
	4050 6050 4100 6050
$Comp
L Connector_Generic:Conn_02x07_Odd_Even J7
U 1 1 5D801A70
P 5200 1700
F 0 "J7" H 5250 2217 50  0000 C CNN
F 1 "CON-A" H 5250 2126 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x07_P2.54mm_Vertical" H 5200 1700 50  0001 C CNN
F 3 "~" H 5200 1700 50  0001 C CNN
	1    5200 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 3550 5450 3550
Wire Wire Line
	5200 3650 5450 3650
Wire Wire Line
	5200 3750 5450 3750
Wire Wire Line
	5200 3850 5450 3850
Wire Wire Line
	5200 3950 5450 3950
Wire Wire Line
	5200 4050 5450 4050
Wire Wire Line
	5200 4150 5450 4150
Wire Wire Line
	5200 4250 5450 4250
Wire Wire Line
	5200 5750 5450 5750
Wire Wire Line
	5200 5850 5450 5850
Wire Wire Line
	5200 5950 5450 5950
Wire Wire Line
	5200 6050 5450 6050
Text Label 5200 3550 0    50   ~ 0
PA0
Text Label 5200 3650 0    50   ~ 0
PA1
Text Label 5200 3750 0    50   ~ 0
PA2
Text Label 5200 3850 0    50   ~ 0
PA3
Text Label 5200 3950 0    50   ~ 0
PA4
Text Label 5200 4050 0    50   ~ 0
PA5
Text Label 5200 4150 0    50   ~ 0
PA6
Text Label 5200 4250 0    50   ~ 0
PA7
Text Label 5200 5750 0    50   ~ 0
PC4
Text Label 5200 5850 0    50   ~ 0
PC5
Text Label 5200 5950 0    50   ~ 0
PC6
Text Label 5200 6050 0    50   ~ 0
PC7
Wire Wire Line
	4750 1400 5000 1400
Wire Wire Line
	4750 1500 5000 1500
Wire Wire Line
	4750 1600 5000 1600
Wire Wire Line
	4750 1700 5000 1700
Wire Wire Line
	4750 1800 5000 1800
Text Label 4750 1400 0    50   ~ 0
PA0
Text Label 4750 1500 0    50   ~ 0
PA2
Text Label 4750 1600 0    50   ~ 0
PA4
Text Label 4750 1700 0    50   ~ 0
PA6
Text Label 4750 1800 0    50   ~ 0
PC4
Wire Wire Line
	4750 1900 5000 1900
Text Label 4750 1900 0    50   ~ 0
PC6
Wire Wire Line
	5500 1400 5750 1400
Wire Wire Line
	5500 1500 5750 1500
Wire Wire Line
	5500 1600 5750 1600
Wire Wire Line
	5500 1700 5750 1700
Wire Wire Line
	5500 1800 5750 1800
Text Label 5600 1400 0    50   ~ 0
PA1
Text Label 5600 1500 0    50   ~ 0
PA3
Text Label 5600 1600 0    50   ~ 0
PA5
Text Label 5600 1700 0    50   ~ 0
PA7
Text Label 5600 1800 0    50   ~ 0
PC5
Wire Wire Line
	5500 1900 5750 1900
Text Label 5600 1900 0    50   ~ 0
PC7
$Comp
L power:VCC #PWR0103
U 1 1 5D8B86A7
P 4550 1900
F 0 "#PWR0103" H 4550 1750 50  0001 C CNN
F 1 "VCC" H 4567 2073 50  0000 C CNN
F 2 "" H 4550 1900 50  0001 C CNN
F 3 "" H 4550 1900 50  0001 C CNN
	1    4550 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1900 4550 2000
Wire Wire Line
	4550 2000 5000 2000
$Comp
L power:GND #PWR0104
U 1 1 5D8C778D
P 5650 2050
F 0 "#PWR0104" H 5650 1800 50  0001 C CNN
F 1 "GND" H 5655 1877 50  0000 C CNN
F 2 "" H 5650 2050 50  0001 C CNN
F 3 "" H 5650 2050 50  0001 C CNN
	1    5650 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2000 5650 2000
Wire Wire Line
	5650 2000 5650 2050
Wire Bus Line
	7100 4150 7100 4350
Wire Bus Line
	7600 2250 7600 4150
Wire Bus Line
	7100 4600 7100 5350
$Comp
L Mechanical:MountingHole MH1
U 1 1 5D9EA3CF
P 10400 3350
F 0 "MH1" H 10500 3396 50  0000 L CNN
F 1 "MountingHole" H 10500 3305 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 10400 3350 50  0001 C CNN
F 3 "~" H 10400 3350 50  0001 C CNN
	1    10400 3350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH2
U 1 1 5D9EA41B
P 10400 3650
F 0 "MH2" H 10500 3696 50  0000 L CNN
F 1 "MountingHole" H 10500 3605 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 10400 3650 50  0001 C CNN
F 3 "~" H 10400 3650 50  0001 C CNN
	1    10400 3650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH3
U 1 1 5D9EA464
P 10400 3950
F 0 "MH3" H 10500 3996 50  0000 L CNN
F 1 "MountingHole" H 10500 3905 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 10400 3950 50  0001 C CNN
F 3 "~" H 10400 3950 50  0001 C CNN
	1    10400 3950
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH4
U 1 1 5D9EA4AB
P 10400 4250
F 0 "MH4" H 10500 4296 50  0000 L CNN
F 1 "MountingHole" H 10500 4205 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 10400 4250 50  0001 C CNN
F 3 "~" H 10400 4250 50  0001 C CNN
	1    10400 4250
	1    0    0    -1  
$EndComp
$EndSCHEMATC
