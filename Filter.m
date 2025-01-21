classdef Filter < handle
    %FILTER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = public)
        f_s = 44100; % Sampling Frequency
        f_l; % Lower Cut-off Frequency
        f_h; % Higher Cut-off Frequency
        B; % Denominator Coefficents
        A; % Numerator Coefficients
        N = 4; % LPF Order
        round_place = 20;
        numerator = [""];
        denominator = [""];
        numerator_arr = [];
        denominator_arr = [];
        numerator_response_sym;
        denominator_response_sym;
        numerator_response = 0;
        denominator_response = 0;
    end
    
    methods (Access = public)
        function obj = Filter(f_l, f_h)
            %FILTER Construct an instance of this class
            obj.f_l = f_l;
            obj.f_h = f_h;
            obj.SetFilter();
            disp("Filter has been Set.");
            obj.DisplayFilterFunction();
        end

        function obj = SetFilter(obj)
            % Make a filter
            [obj.B, obj.A] = butter(obj.N, [obj.f_l, obj.f_h]/(obj.f_s/2), "bandpass");
        end

        function obj = DisplayFilterFunction(obj)
            syms z;

            numerator_rounded = round(obj.B, obj.round_place);
            denominator_rounded = round(obj.A, obj.round_place);
            obj.numerator_arr = numerator_rounded;
            obj.denominator_arr = denominator_rounded;

            for n = 1:(2*obj.N)+1
                z_exp = ["*z^" + num2str((2*obj.N)+1-n)];
                numerator_term = [num2str(numerator_rounded(n)) + z_exp];
                denominator_term = [num2str(denominator_rounded(n)) + z_exp];
                obj.numerator(n) = numerator_term;
                obj.denominator(n) = denominator_term;
            end

            obj.numerator_response_sym = poly2sym(obj.numerator_arr, z);
            obj.denominator_response_sym = poly2sym(obj.denominator_arr, z);
            display(mat2str(obj.numerator));
            fprintf("--------------------------------------------------------\n");
            display(mat2str(obj.denominator));
        end

        function obj = FilterResponse(obj, f)
            w = 2 * pi * f / obj.f_s;
            z = exp(j * w);
            obj.numerator_response = eval(obj.numerator_response_sym);
            obj.denominator_response = eval(obj.denominator_response_sym);

            filter_response = obj.numerator_response / obj.denominator_response;
            fprintf("\nFrequency: %dHz\n", f);
            fprintf("Filter Response: %0.4f %0.4fi (%0.4f)\n", real(filter_response), imag(filter_response), abs(filter_response));
            fprintf("Signal*Filter (1 Period): %0.4f %0.4fi (%0.4f)\n", real(22050 * filter_response), imag(22050 * filter_response), abs(22050 * filter_response));
        end
    end
end

