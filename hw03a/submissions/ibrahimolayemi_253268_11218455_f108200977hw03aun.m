clc,clear all, close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Run file for HW 3a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f = @(x) x^2-3;% Example function to check false position method

[student_id,xc] = falsepos(f,0,3,20)

