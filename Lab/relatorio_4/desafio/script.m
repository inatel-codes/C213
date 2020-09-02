pkg load control
pkg load signal
tempo = 0:0.1:240;

# malha aberta
a1 = 0.99736;
b1 = 0.0019800;
sys = tf(b1, [1 -a1], 0.1);
resp_degrau_malha_aberta = step(sys, tempo);
figure()
plot(tempo, resp_degrau_malha_aberta)

# malha fechada
sys_malha_fechada = feedback(sys, 1);
resp_degrau_malha_fechada = step(sys_malha_fechada, tempo);
figure()
plot(tempo, resp_degrau_malha_fechada)

# malha fechada com ganho
ganho = 5;
sys_com_ganho = sys*ganho;
sys_malha_fechada_com_ganho = feedback(sys_com_ganho);
resp_degrau_malha_fechada_com_ganho = step(sys_malha_fechada_com_ganho, tempo);
figure()
plot(tempo, resp_degrau_malha_fechada_com_ganho)

figure()
plot(tempo, resp_degrau_malha_aberta, tempo, resp_degrau_malha_fechada, tempo, resp_degrau_malha_fechada_com_ganho)