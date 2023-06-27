% Simulation parameters
totalTime = 100;            % Total simulation time
peakPeriod = 40:60;         % Peak usage period (iterations)
baseStations = 5;           % Initial number of base stations
radioResources = zeros(1, totalTime);  % Array to store the number of radio resources

% Simulating the scaling of radio resource allocation microservice
for t = 1:totalTime
    % Check if it is a peak usage period
    if ismember(t, peakPeriod)
        % Increase the number of base stations
        baseStations = baseStations + 1;
    else
        % Decrease the number of base stations
        baseStations = max(1, baseStations - 1);
    end
    
    % Perform resource allocation based on the number of base stations
    radioResources(t) = performResourceAllocation(baseStations);
end

% Plotting the results
figure;
plot(1:totalTime, radioResources, 'b-', 'LineWidth', 2);
hold on;
plot(peakPeriod, radioResources(peakPeriod), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
xlabel('Time');
ylabel('Number of Radio Resources');
title('Scaling of Radio Resource Allocation');
grid on;

% Customizing plot appearance
set(gca, 'FontSize', 12);
set(gca, 'GridLineStyle', '--');
set(gca, 'GridAlpha', 0.5);
set(gca, 'XMinorTick', 'on');
set(gca, 'YMinorTick', 'on');

% Saving the plot as an image file (optional)
saveas(gcf, 'scaling_simulation_plot.png');

% Function to perform resource allocation based on the number of base stations
function numResources = performResourceAllocation(numBaseStations)
    % Perform resource allocation logic here
    % Example: Calculate the number of radio resources based on the number of base stations
    numResources = 100 + numBaseStations * 10;
end
