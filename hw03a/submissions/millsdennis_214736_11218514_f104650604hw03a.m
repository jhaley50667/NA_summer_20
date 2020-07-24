%{
    Inputs:
        f:
            A function that we will be estimating
            a root for.

        a:
            The lower bound of our function
            for our algorithm to use to initially
            approximate the root.

        b:
            The upper bound of our function
            for our algorithm to use to initially
            approximate the root.

        n:
            The maximum number of iterations that our
            program is allowed to run for before stopping
            and returning a value.

    Outputs:
        student_id:
            An integer representing my student ID.

        xc:
           A number that is an approximation to the
           root of our function.
%}

function [student_id, xc] = f104650604hw03a(f, a, b, n)

    xc = 0; % Assign the value of xc initially.
    student_id = 104650604; % Initializes our student_id value.

    %{
        Repeat the algorithm for as many times as
        we have specified in our call to the function.
    %}
    for i = 1 : n
        % If the signs on each side of the interval are the same we have to
        % print an error stating that the problem occured.
        if (f(a) * f(b) > 0)
            error("Error: f(a) * f(b) is not less than 0."); % Indicates the error and exits the function.
        end
        rootApproximation = ((b * f(a)) - (a * f(b))) / (f(a) - f(b)); % Applying our formula that we were given
        xc = rootApproximation; % Stores our current root approximation.
        
        %{
            If we happen to luck out and our approximation
            gives us a value that results in a zero to our function,
            then we can exit and return the value we found.
        %}
        if f(rootApproximation) == 0
            break; % Break out of the loop
        end
        
        %{
            If a and rootApproximation are on opposite sides of the
            root, then we know that we can shrink our interval by making b
            equal to rootApproximation.
        %}
        if f(a) * f(rootApproximation) < 0
            b = rootApproximation;
        else % If a and rootApproximation are on the same side of the root
            a = rootApproximation; % Leave b alone and make a equal to the root approximation
        end
    end
    student_id % print our student_id.
    format long
    xc % Lastly, return the approximation of the root.
end

