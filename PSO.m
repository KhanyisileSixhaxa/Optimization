%Khanyisile Sixhaxa
%1590202
function PSO
    
    f = @(x1,x2)  0.25*(x1^4) - 0.5*(x1^2) + 0.1*x1 + 0.5*(x2^2);
    c1 = 2;
    c2 = 2;
    w = 0.6;
    %%
    % 
    %   for x = 1:10
    %       disp(x)
    %   end
    % 
    max = 30;
    n = 2;
    N = 25;
    pop = zeros(N,n+1);
    pop1 = zeros(N,n+1);
    x = zeros(1,n);
    g = zeros(1,n);
    velocity = zeros(N,n+1);
    xlower = [-5,-5];
    xupper = [6,6];
    
    %initialize population
    for i=1:N
        for j=1:n
            pop(i,j) = xlower(j) + rand*(xupper(j)-xlower(j));
            velocity(i,j) = 0.1*(rand*(xupper(j)-xlower(j)));
            x(j) = pop(i,j);
        end
        pop(i,n+1) = f(x(1),x(2));
        pop1=pop;
    end
    pop1=sortrows(pop1,-(n+1));
   
    %copy population
    for i=1:N
        for j=1:n
            pop1(i,j) = pop(i,j);
        end
    end
   
    %calculate the best point in population copy just sort and select first
    for j=1:n
        g(j) = pop1(1,j);
        min = pop1(1,n+1);
    end
    
    for i=2:N
        if pop1(i,n+1) < min
            min = pop1(i);
        end
            for j=1:n
                g(j) = pop1(i,j);
            end
       
    end
    
    iteration=0;
    while iteration<= max
        for i=1:N
            for j=1:n
                r1=rand;
                r2=rand;
                velocity(i,j) = w*velocity(i,j) + c1*r1*(pop1(i,j) - pop(i,j)) + c2*r2*(g(j)-pop(i,j));
                pop(i,j) = pop(i,j) + velocity(i,j);
                %maintain feasibility
                if pop(j) <= xlower(j) || pop(j) >= xupper(j)
                    pop(i,j)=xlower(j)+rand*(xupper(j)-xlower(j));
                end
                x(j)= pop(i,j);
            end
            pop(i,n+1) = f(x(1),x(2));
        end
            %update matrix
            for i=1:N
                if pop(i,n+1)<pop1(i,n+1)
                    for j=1:n+1
                        pop1(i,j) = pop(i,j); 
                    end
                end
            end
        
         for j=1:n
             g(j)=pop1(1,j);
             min = pop1(1,n+1);
         end
         %calculate the best point in population copy, sort and select
         for i=2:N
             if pop1(i,n+1)<min
                 min = pop1(i);
             end
             for j=1:n
                g(j) = pop1(i,j);
             end
         end
         iteration= iteration+1;
         pop1 = sortrows(pop1,-(n+1));
     end
   xstar = g
   fmin = f(g(1),g(2))
end