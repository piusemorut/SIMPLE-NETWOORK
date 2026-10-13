
classdef SimpleNetwork
    % Simple water distribution network

    properties
        NodeNames
        Demands
        PipeNames
        PipeLengths
        PipeDiameters
    end

    methods
        % Constructor
        function obj = SimpleNetwork()

            obj.NodeNames = {'R1','J1','J2','J3'};

            % Demands in litres per second
            obj.Demands = [0, 1.5, 1.0, 0.8];

            obj.PipeNames = {'P1','P2','P3'};

            % Pipe lengths in metres
            obj.PipeLengths = [500, 400, 300];

            % Pipe diameters in millimetres
            obj.PipeDiameters = [150, 150, 100];

        end

        % Calculate flow in each pipe
        function results = calculateFlows(obj)

            % Flows calculated using continuity
            % for this simple branching network
            flow = [3.3; 1.8; 0.8];

            results = table( ...
                obj.PipeNames(:), ...
                obj.PipeLengths(:), ...
                obj.PipeDiameters(:), ...
                flow, ...
                'VariableNames', ...
                {'Pipe','Length_m', ...
                 'Diameter_mm','Flow_LPS'});

        end

        % Display network diagram
        function displayNetwork(obj)

            x = [0 1 2 3];
            y = [0 0 0 0];

            figure;
            plot(x, y, 'bo-', ...
                'LineWidth', 2, ...
                'MarkerSize', 10);

            text(x, y + 0.15, obj.NodeNames, ...
                'HorizontalAlignment', 'center');

            title('Simple Water Distribution Network');
            xlabel('Network position');
            ylabel('Schematic layout');
            grid on;

        end

    end
end
