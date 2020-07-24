%{
    Inputs:
        f: 
            A function that we want to estimate a root of.

        a:
            The lower bound of our interval.

        b:
            The upper bound of our interval.
        
        tol:
            This can be thought of as the largest
            amount of error that our function can
            have in order to get an answer that is considered to
            be correct to a certain degree of precision.
            
        max_steps:
            This is a hard cutoff for the number of
            iterations that our function can run for.
            If we exceed the number of max steps, then
            we simply return what we found in the process.
            This is designed in order to prevent the algorithm
            from running for too long and stalling the program.

    Outputs:
        student_id:
            An integer that corresponds to my student ID.
        
        c:
            This is a vector that stores every estimate
            that we've calculated so far in our algorithm.

    Restrictions:
        For this algorithm to work, f(a) and f(b) must never
        share the same sign. We state this mathematically as
        f(a) * f(b) < 0. The algorithm ensures this is true after each
        iteration, but it requires that the user make sure that the
        initial a and b values meet this criteria for the first iteration.
%}
function [student_id, c] = f104650604hw02a(f, a, b, tol, max_steps)
    
    %{
        For this algorithm to work we need a zero to be somewhere between
        a and b in our interval. We assume that f(a) and that f(b) will
        have different signs. Since f(a) has a different sign than f(b),
        we know that we must have a zero somewhere between a and b.
        This method works well when a and b are close to each other
        around a zero of the function, but it can fail if the interval
        we've provided is too large.
    %}
    if sign(f(a)) * sign(f(b)) >= 0
        error("(f(a) * f(b)) must be less than 0.")
    else % If f(a) and f(b) didn't have the same sign, then we can continue
        fa = f(a); % Initializes fa to the value of the function f at x = a
        fb = f(b); % Initializes fb to the value of the function f at x = b
        counter = 1; % Initializes a counter to 1 to keep track of the iterations we've done so far
        intervalLength = (b - a) / 2; % We create a variable to represent the length of our interval
        c = [] % An empty vector to add our results to
        %{
            As long as our interval is still too large,
            we need to continually shrink the interval
            and refine our guesses for the zero of the function
            as we do so.
        %}
        while intervalLength > tol
            if counter > max_steps
                fprintf("Maximum steps reached. \n")
                break
            end
            midpoint = (b + a) / 2; % Creates a variable to represent the midpoint of the interval
            fMid = f(midpoint); % Stores the value of our function at the midpoint
            if fMid == 0 % If the midpoint we found was a 0, then we're done with our algorithm
                break
            else % If we didn't luck out and find a zero to the function, we have to narrow the interval
                
                %{
                    When we pick the new interval we have to
                    be sure that we maintain the property that 
                    f(b) * f(a) < 0. If the sign of the fMid variable
                    times the sign of the fa variable are less
                    than 0, then we have maintained that property
                    and we can change our b value to the midpoint of the
                    interval.
                %}
                if sign(fMid) * sign(fa) < 0
                    b = midpoint; % Make b equal to the midpoint we found
                    fb = fMid; % Our function of b is now equal to what the fMid function was before.
                    
                %{
                    If the signs are the same, then we need to make the
                    opposite adjustment that we did previously 
                    so that a is now our midpoint.
                %}
                else
                    a = midpoint; % Make a equal to the midpoint we found
                    fa = fMid; % Our function of a is now equal to what the fMid function was before.
                end
            end
            c(counter) = midpoint; % Appends our guess to our vector of results
            counter = counter + 1; % Increments our counter to indicate that we've done an iteration
        end
    end
    student_id = 104650604 % outputs our studentID as the first result.
    format long % This was included in order to get more decimals in my testing. It should not impact the answer.
    c % Returns the vector that we accumulated through our iterations.
end