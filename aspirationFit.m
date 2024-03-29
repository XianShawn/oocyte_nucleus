function [fitresult, gof] = aspirationFit(time, distance)
%CREATEFIT(TIME,DISTANCE)
%  Create a fit.
%
%  Data for 'aspiration' fit:
%      X Input : time
%      Y Output: distance
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 10-Apr-2019 11:07:10


%% Fit: 'aspiration'.
[xData, yData] = prepareCurveData( time, distance );

% Set up fittype and options.
ft = fittype( 'c+a*exp(-b*x)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.575375929112949 0.86563217597516 0.400839561276782];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'aspiration' );
h = plot( fitresult, xData, yData );
legend( h, 'distance vs. time', 'aspiration', 'Location', 'NorthEast' );
% Label axes
xlabel time
ylabel distance
grid on


