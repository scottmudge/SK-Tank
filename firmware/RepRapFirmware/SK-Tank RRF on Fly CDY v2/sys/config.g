; Configuration file for Fly-CDYv2 (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.2.1-LPC on Mon Mar 15 2021 13:39:35 GMT+0800 (Taipei Standard Time)

; General preferences
G90                                                     ; send absolute coordinates...
M83                                                     ; ...but relative extruder moves
M550 P"SK-Tank"                                         ; set printer name
M669 K1                                                 ; select CoreXY mode

; Network
M552 S1                                                 ; enable network
M586 P0 S1                                              ; enable HTTP
M586 P1 S0                                              ; disable FTP
M586 P2 S0                                              ; disable Telnet



; Drives
M569 P0 S0                                              ; physical drive 0 goes backwards using default driver timings
M569 P1 S0                                              ; physical drive 1 goes backwards using default driver timings
M569 P2 S1                                              ; physical drive 2 goes forwards using default driver timings
M569 P3 S1                                              ; physical drive 3 goes forwards using default driver timings
M569 P4 S0                                              ; physical drive 4 goes backwards using default driver timings
M569 P5 S1                                              ; physical drive 5 goes forwards using default driver timings
M584 X0 Y1 Z2:4:5 E3                                    ; set drive mapping
M671 X-4:330:157 Y-11:-11:334 S50                       ; set z drive coordinates
M350 X16 Y16 Z16:16:16 E16 I1                           ; configure microstepping with interpolation
M92 X200.00 Y200.00 Z2000.00 E420.00                    ; set steps per mm
M566 X600.00 Y600.00 Z24.00 E300.00                     ; set maximum instantaneous speed changes (mm/min)
M203 X30000.00 Y30000.00 Z450.00 E6000.00               ; set maximum speeds (mm/min)
;M201 X2000.00 Y1250.00 Z100.00 E2000.00                ; set accelerations (mm/s^2)
M201 X2000.00 Y1500.00 Z100.00 E2000.00                 ; set accelerations (mm/s^2)
M906 X1000 Y1000 Z600 E700 I30                          ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                                 ; Set idle timeout

; Axis Limits
M208 X0:330 Y-12:330 Z0:400                             ; set axis limits

; Endstops
M574 X1 S1 P"xstop"                                     ; configure active-high endstop for low end on X via pin xstop
M574 Y1 S1 P"ystop"                                     ; configure active-high endstop for low end on Y via pin ystop
M574 Z1 S1 P"zstop"                                     ; configure active-high endstop for low end on Z via pin zstop

; Z-Probe
M558 P5 C"zstopmax" H10 F600 T12000                     ; set Z probe type as filtered digital (P5), dive height to 10.
G31 P500 X-23 Y14 Z1.5                                  ; set Z probe trigger value, offset and trigger height
M557 X0:290 Y2:292 S36.25                               ; define mesh grid

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B3950          ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bed" T0                                       ; create bed heater output on bed and map it to sensor 0
M307 H0 R0.408 C337.1 D4.16 S1.00 V0.0
M140 H0                                                 ; map heated bed to heater 0
M143 H0 S120                                            ; set temperature limit for heater 0 to 120C
M308 S1 P"e0temp" Y"thermistor" T100000 B4725 C7.06e-8  ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                                    ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 R2.204 C269.4 D5.26 S1.00 V0.0
M143 H1 S250                                            ; set temperature limit for heater 1 to 280C

; Fans
; Ernest: pin fan0 has been short-circuited and POPPED in my Mellow FLY CDY v2.
M950 F0 C"fan2" Q500                                    ; create fan 0 on pin fan2 and set its frequency.
M106 P0 S0 H-1                                          ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q500                                    ; create fan 1 on pin fan1 and set its frequency
M106 P1 S0 H1 T50                                       ; set fan 1 value. Thermostatic control is turned on

; Tools
M563 P0 S"fanTool0" D0 H1 F0                            ; define tool 0
G10 P0 X0 Y0 Z0                                         ; set tool 0 axis offsets
G10 P0 R0 S0                                            ; set initial tool 0 active and standby temperatures to 0C

; 4.3" display
M575 P1 S0 B57600                                       ; set baud rate 57600

; Custom settings are not defined

; Miscellaneous
M501                                                    ; load saved parameters from non-volatile memory

