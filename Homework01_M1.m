%a) create an array of integer indices, n, from -20 to 20
n = -20:20;

%b) create a sequence equal to the unit step function u[n]
u = zeros(size(n));
start = find(n==0);
u(start:end) = 1;

%c) Using what you created in (a) and (b) above, form the following
%sequence:  x[n] = (1/2)^n * cos(2pin/13)*u[n]
innerCal = (2*pi)/13;
x = ((1/2).^n) .* cos(innerCal.*n) .* u;

%now create sequence h[n]:  h[n] = u[n] - u[n-3]
h = zeros(size(n));
for i = 1: length(n)
    pos = n(i);
    
    if pos+18<1
       h(i) = u(pos+21) + 0;
    else
        h(i) = u(pos+21)+u(pos+18);
    end
end

y = conv(h,x,'same');
figure
set(gcf, 'Position', [100, 100, 1000, 800]);

subplot(4,1,1);
stem(n,u,'b');
ylim([0 1]);
title('unit step function');
xlabel('n','FontWeight','bold');
ylabel('u[n]','FontWeight','bold');

subplot(4,1,2);
stem(n,x,'r');
ylim([-0.5 1]);
title('x[n] produced using u[n]');
xlabel('n','FontWeight','bold');
ylabel('x[n]','FontWeight','bold');

subplot(4,1,3);
stem(n,h,'k');
ylim([0 2]);
title('h[n] produced using u[n]');
xlabel('n','FontWeight','bold');
ylabel('h[n]','FontWeight','bold');

subplot(4,1,4);
stem(n,y,'g');
ylim([0 5]);
title('y[n] produced by convolution');
xlabel('n','FontWeight','bold');
ylabel('y[n]','FontWeight','bold');

hold off;
