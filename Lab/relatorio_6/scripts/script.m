pkg load control
pkg load signal

a1 = 0.99736
b1 = 0.0019800 
tempo = 0:0.001:6;

sysZ = tf([0.095163], [1 -0.904837], 0.1);
sysS = d2c(sysZ);

acao_proporcional = tf(5);
acao_integral = tf([5], [1 0]);
acao_derivativa = tf([2, 0], [1]);

acao_controlador = acao_proporcional + acao_integral + acao_derivativa;

MA = acao_controlador*sysS;

MF = feedback(MA, 1);

resp = step(MF, tempo);
plot(tempo, resp)