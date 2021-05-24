; bed.g
; called to perform automatic bed compensation via G32
;
; generated by RepRapFirmware Configuration Tool v3.2.2 on Thu Jan 28 2021 12:21:33 GMT+0800 (Taipei Standard Time)

; ---------------------------------------------------------------------
; G31: Set or Report Current Probe status
; G32: Run bed.g macro
;
; Please refer to "Inductive ABL sensor setup" and find a proper value
; for G31 Z parameter.
; https://sites.google.com/view/seckit-wiki/sk-tank-350x350x400/sk-tank-tuning/inductive-abl-sensor-setup


M558 P5 C"zstopmax" H15 F600 T12000               ; setup z probe as filtered digital (P5), etc. set a higher dive height H30 to prevent nozzle crash.
G31 P500 X-23 Y14 Z0.95
G28
G30 P0 X3  Y10  Z-99999
G30 P1 X290 Y10  Z-99999
G30 P2 X157 Y315 Z-99999 S3
M558 P5 C"zstopmax" H3 F600 T12000                ; set a low dive height H3 for faster mesh building
G31 P500 X-23 Y14 Z0.95

;----------------------------------------
; uncomment below to include mesh building in G32
;----------------------------------------
;M561 ; clear any bed transform
;G29  ; probe the bed and enable compensation


