T = input('Entre com o valor de Tal: ');
K = input('Entre com o valor do ganho: ');
A = input('Entre com a amplitude do degrau: ');
I = input('Entre com a area do impulso: ');

num = [K];
den = [T 1];

sys = tf(num, den);

figure(1)
step(A*sys)

figure(2)
impulse(A*sys)