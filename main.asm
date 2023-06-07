; ======================================================================================================
; SCRIPT NAME: main.asm
;
; PURPOSE: x86 implementation of the Canny Edge Detection filter to an image.
; DESCRIPTION:  The general objective of the project is to apply the Canny Edge Detection filter 
;               to a grayscale image using an assembler application for the x86 architecture, 
;               in order to compare the performance and the improvement obtained when running it 
;               on an architecture with a dynamic scheduler by hardware and without it, 
;               using SIMICS as a simulation tool.
;
; REVISION HISTORY:
;
; AUTHOR				    DATE			    DETAILS
; --------------------- --------------- --------------------------------
; @angelortizv          2023-06-07	    Setup Project
;
; REFERENCES: https://docs.opencv.org/3.4/da/d22/tutorial_py_canny.html
; 
; ======================================================================================================


section .text   
global _start
