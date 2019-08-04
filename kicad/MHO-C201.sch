EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Battery_Cell B1
U 1 1 5D463550
P 4400 4300
F 0 "B1" H 4518 4396 50  0000 L CNN
F 1 "CR2032 3V Lithium" H 4518 4305 50  0000 L CNN
F 2 "" V 4400 4360 50  0001 C CNN
F 3 "~" V 4400 4360 50  0001 C CNN
	1    4400 4300
	1    0    0    -1  
$EndComp
$Comp
L pspice:C C2
U 1 1 5D463648
P 3700 4700
F 0 "C2" V 3923 4700 50  0000 C CNN
F 1 "C" H 3878 4655 50  0001 L CNN
F 2 "" H 3700 4700 50  0001 C CNN
F 3 "~" H 3700 4700 50  0001 C CNN
	1    3700 4700
	0    -1   -1   0   
$EndComp
$Comp
L pspice:C C3
U 1 1 5D463747
P 3700 4250
F 0 "C3" V 3923 4250 50  0000 C CNN
F 1 "C" H 3878 4205 50  0001 L CNN
F 2 "" H 3700 4250 50  0001 C CNN
F 3 "~" H 3700 4250 50  0001 C CNN
	1    3700 4250
	0    -1   -1   0   
$EndComp
$Comp
L pspice:C C4
U 1 1 5D4637E8
P 3700 3700
F 0 "C4" V 3923 3700 50  0000 C CNN
F 1 "C" H 3878 3655 50  0001 L CNN
F 2 "" H 3700 3700 50  0001 C CNN
F 3 "~" H 3700 3700 50  0001 C CNN
	1    3700 3700
	0    -1   -1   0   
$EndComp
$Comp
L pspice:C C1
U 1 1 5D463895
P 5050 1350
F 0 "C1" H 5228 1350 50  0000 L CNN
F 1 "C" H 5228 1305 50  0001 L CNN
F 2 "" H 5050 1350 50  0001 C CNN
F 3 "~" H 5050 1350 50  0001 C CNN
	1    5050 1350
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push S1
U 1 1 5D463B89
P 3000 1700
F 0 "S1" H 3000 1985 50  0000 C CNN
F 1 "Toggle C/F" H 3000 1894 50  0000 C CNN
F 2 "" H 3000 1900 50  0001 C CNN
F 3 "" H 3000 1900 50  0001 C CNN
	1    3000 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D463E3A
P 3150 1750
F 0 "#PWR?" H 3150 1500 50  0001 C CNN
F 1 "GND" H 3155 1577 50  0000 C CNN
F 2 "" H 3150 1750 50  0001 C CNN
F 3 "" H 3150 1750 50  0001 C CNN
	1    3150 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 1700 3150 1700
Wire Wire Line
	3150 1700 3150 1750
$Comp
L Connector:Conn_01x10_Female P1
U 1 1 5D4644B6
P 1200 4650
F 0 "P1" H 1100 5200 50  0000 C CNN
F 1 "Conn_01x10_Female" H 1094 4016 50  0001 C CNN
F 2 "" H 1200 4650 50  0001 C CNN
F 3 "~" H 1200 4650 50  0001 C CNN
	1    1200 4650
	-1   0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR?
U 1 1 5D4653E3
P 1700 2700
F 0 "#PWR?" H 1700 2550 50  0001 C CNN
F 1 "+BATT" H 1715 2873 50  0000 C CNN
F 2 "" H 1700 2700 50  0001 C CNN
F 3 "" H 1700 2700 50  0001 C CNN
	1    1700 2700
	1    0    0    -1  
$EndComp
Text GLabel 1700 3250 1    50   Input ~ 0
1
Text GLabel 1850 3250 1    50   Input ~ 0
2
Text GLabel 2000 3250 1    50   Input ~ 0
3
Text GLabel 2150 3250 1    50   Input ~ 0
4
Text GLabel 2300 3250 1    50   Input ~ 0
5
Text GLabel 2450 3250 1    50   Input ~ 0
6
Text GLabel 2600 3250 1    50   Input ~ 0
7
Text GLabel 2750 3250 1    50   Input ~ 0
8
Text GLabel 2750 2850 3    50   Input ~ 0
9
Text GLabel 2600 2800 3    50   Input ~ 0
10
Text GLabel 2450 2800 3    50   Input ~ 0
11
Text GLabel 2300 2800 3    50   Input ~ 0
12
Text GLabel 2150 2800 3    50   Input ~ 0
13
Text GLabel 2000 2800 3    50   Input ~ 0
14
Text GLabel 1700 2800 3    50   Input ~ 0
16
Text GLabel 5450 2700 1    50   Input ~ 0
U1_1
$Comp
L power:GND #PWR?
U 1 1 5D468EDA
P 1750 5300
F 0 "#PWR?" H 1750 5050 50  0001 C CNN
F 1 "GND" H 1755 5127 50  0000 C CNN
F 2 "" H 1750 5300 50  0001 C CNN
F 3 "" H 1750 5300 50  0001 C CNN
	1    1750 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 4450 1750 4450
Wire Wire Line
	1400 4350 3100 4350
Wire Wire Line
	1400 4950 2750 4950
Wire Wire Line
	2450 4650 1400 4650
Wire Wire Line
	1750 4450 1750 5300
Wire Wire Line
	1400 5050 2600 5050
Wire Wire Line
	1400 5150 2900 5150
Wire Wire Line
	2150 4750 1400 4750
Wire Wire Line
	1400 4850 1850 4850
$Comp
L power:GND #PWR?
U 1 1 5D48783C
P 4400 4850
F 0 "#PWR?" H 4400 4600 50  0001 C CNN
F 1 "GND" H 4405 4677 50  0000 C CNN
F 2 "" H 4400 4850 50  0001 C CNN
F 3 "" H 4400 4850 50  0001 C CNN
	1    4400 4850
	1    0    0    -1  
$EndComp
Text GLabel 5600 2700 1    50   Input ~ 0
U1_2
Text GLabel 5750 2700 1    50   Input ~ 0
U1_3
Text GLabel 5900 2700 1    50   Input ~ 0
U1_4
Wire Wire Line
	2000 1500 2000 1400
Wire Wire Line
	2300 1400 2300 1500
Wire Wire Line
	2000 1400 2150 1400
$Comp
L power:+BATT #PWR?
U 1 1 5D49CCF5
P 2150 1300
F 0 "#PWR?" H 2150 1150 50  0001 C CNN
F 1 "+BATT" H 2165 1473 50  0000 C CNN
F 2 "" H 2150 1300 50  0001 C CNN
F 3 "" H 2150 1300 50  0001 C CNN
	1    2150 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1300 2150 1400
Connection ~ 2150 1400
Wire Wire Line
	2150 1400 2300 1400
Text GLabel 5900 2050 3    50   Input ~ 0
U1_5
Text GLabel 5750 2050 3    50   Input ~ 0
U1_6
Text GLabel 5600 2050 3    50   Input ~ 0
U1_7
Text GLabel 5450 2050 3    50   Input ~ 0
U1_8
Text Notes 5900 2400 2    50   ~ 0
SHT30-DIS
Wire Wire Line
	5600 2050 5600 1800
Wire Wire Line
	5600 1800 5450 1800
Wire Wire Line
	5450 1800 5450 2050
$Comp
L power:GND #PWR?
U 1 1 5D4B8122
P 5050 2050
F 0 "#PWR?" H 5050 1800 50  0001 C CNN
F 1 "GND" H 5055 1877 50  0000 C CNN
F 2 "" H 5050 2050 50  0001 C CNN
F 3 "" H 5050 2050 50  0001 C CNN
	1    5050 2050
	1    0    0    -1  
$EndComp
Connection ~ 5450 1800
Wire Wire Line
	5450 2700 5450 3050
Text Label 5450 2900 1    50   ~ 0
SDA
Text Label 5900 2900 1    50   ~ 0
SCL
Wire Wire Line
	5600 2700 5600 3550
Text Label 5600 2900 1    50   ~ 0
ADDR
Text Label 5750 2950 1    50   ~ 0
ALERT
Text Label 5900 2000 1    50   ~ 0
VDD
Text Label 5450 1850 3    50   ~ 0
VSS
Text Label 5750 1800 3    50   ~ 0
~RESET
Text Notes 2000 3100 0    50   ~ 0
HT66F0182
Wire Wire Line
	3950 4250 4050 4250
Wire Wire Line
	4050 4250 4050 4700
Wire Wire Line
	4050 4700 3950 4700
Wire Wire Line
	3100 4350 3100 4700
Wire Wire Line
	3100 4700 3450 4700
Wire Wire Line
	4400 4400 4400 4700
Wire Wire Line
	4400 3250 4400 3400
Wire Wire Line
	4050 4250 4050 3700
Wire Wire Line
	4050 3700 3950 3700
Connection ~ 4050 4250
Wire Wire Line
	3450 3700 3300 3700
Connection ~ 4050 4700
$Comp
L power:+BATT #PWR?
U 1 1 5D512E34
P 4400 3250
F 0 "#PWR?" H 4400 3100 50  0001 C CNN
F 1 "+BATT" H 4415 3423 50  0000 C CNN
F 2 "" H 4400 3250 50  0001 C CNN
F 3 "" H 4400 3250 50  0001 C CNN
	1    4400 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4700 4400 4700
Connection ~ 4400 4700
Wire Wire Line
	4400 4700 4400 4850
Wire Wire Line
	3300 3400 4400 3400
Wire Wire Line
	3300 3400 3300 3700
Connection ~ 4400 3400
Wire Wire Line
	4400 3400 4400 4100
$Comp
L power:GND #PWR?
U 1 1 5D466B26
P 1700 3450
F 0 "#PWR?" H 1700 3200 50  0001 C CNN
F 1 "GND" H 1705 3277 50  0000 C CNN
F 2 "" H 1700 3450 50  0001 C CNN
F 3 "" H 1700 3450 50  0001 C CNN
	1    1700 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 3250 1700 3450
Wire Wire Line
	1850 3250 1850 4850
Wire Wire Line
	1700 2700 1700 2800
Wire Wire Line
	2600 1700 2600 2800
Wire Wire Line
	2600 1700 2800 1700
Text GLabel 1850 2800 3    50   Input ~ 0
15
Wire Wire Line
	2750 2850 2750 2750
Wire Wire Line
	2750 2750 2900 2750
Wire Wire Line
	1400 4550 1700 4550
$Comp
L power:+BATT #PWR?
U 1 1 5D5842BA
P 1700 4050
F 0 "#PWR?" H 1700 3900 50  0001 C CNN
F 1 "+BATT" H 1715 4223 50  0000 C CNN
F 2 "" H 1700 4050 50  0001 C CNN
F 3 "" H 1700 4050 50  0001 C CNN
	1    1700 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 4050 1700 4550
Wire Wire Line
	2450 2800 2450 2550
Wire Wire Line
	2450 2550 3400 2550
Wire Wire Line
	2150 2800 2150 2350
Wire Wire Line
	1850 2800 1850 2150
Wire Wire Line
	2750 3250 2750 4950
Wire Wire Line
	2900 2750 2900 5150
Wire Wire Line
	2600 3250 2600 5050
Wire Wire Line
	2450 3250 2450 4650
Wire Wire Line
	2150 3250 2150 4750
Wire Wire Line
	1400 4250 3450 4250
Connection ~ 2000 2250
Connection ~ 2300 2450
Wire Wire Line
	5450 1800 5050 1800
Wire Wire Line
	5050 1800 5050 2050
$Comp
L power:+BATT #PWR?
U 1 1 5D4BA9EF
P 5050 950
F 0 "#PWR?" H 5050 800 50  0001 C CNN
F 1 "+BATT" H 5065 1123 50  0000 C CNN
F 2 "" H 5050 950 50  0001 C CNN
F 3 "" H 5050 950 50  0001 C CNN
	1    5050 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 1600 5050 1800
Connection ~ 5050 1800
Wire Wire Line
	5050 950  5050 1050
Wire Wire Line
	5050 1050 5900 1050
Wire Wire Line
	5900 1050 5900 2050
Connection ~ 5050 1050
Wire Wire Line
	5050 1050 5050 1100
Wire Wire Line
	5750 1700 5750 2050
Wire Wire Line
	3900 2150 3900 1700
Wire Wire Line
	3900 1700 5750 1700
Wire Wire Line
	1850 2150 3900 2150
Wire Wire Line
	4850 2250 4850 3050
Wire Wire Line
	4850 3050 5450 3050
Wire Wire Line
	2000 2250 4850 2250
Wire Wire Line
	4750 2350 4750 3150
Wire Wire Line
	4750 3150 5750 3150
Wire Wire Line
	5750 2700 5750 3150
Wire Wire Line
	2150 2350 4750 2350
Wire Wire Line
	4650 2450 4650 3250
Wire Wire Line
	4650 3250 5900 3250
Wire Wire Line
	5900 2700 5900 3250
Wire Wire Line
	2300 2450 4650 2450
Text Notes 5050 3850 0    50   ~ 0
From SHT3X-DIS datasheet:\nAddress pin; input; connect to either\nlogic high or low, do not leave floating
Wire Wire Line
	2000 3250 2000 3500
NoConn ~ 2000 3500
Wire Wire Line
	2300 3250 2300 3500
NoConn ~ 2300 3500
Text Notes 3200 2700 0    79   ~ 0
???
Text Notes 5650 3550 0    79   ~ 0
???
NoConn ~ 2000 1800
NoConn ~ 2300 1800
NoConn ~ 2300 1500
NoConn ~ 2000 1500
Wire Wire Line
	2000 2250 2000 1800
Wire Wire Line
	2300 2450 2300 1800
Wire Wire Line
	2000 2250 2000 2800
Wire Wire Line
	2300 2450 2300 2800
Text Label 1400 4350 0    50   ~ 0
+11.6V
Text Label 1400 4250 0    50   ~ 0
+3.4V
Text Label 1450 4650 0    50   ~ 0
?
Text Label 1450 4750 0    50   ~ 0
?
Text Label 1450 4850 0    50   ~ 0
?
Text Label 1450 4950 0    50   ~ 0
?
Text Label 1450 5050 0    50   ~ 0
?
Text Label 1450 5150 0    50   ~ 0
?
Text Notes 1950 1700 1    50   ~ 0
R1
Text Notes 2250 1700 1    50   ~ 0
R2
$EndSCHEMATC
