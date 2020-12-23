a1 = 0.9955714342212201;
b1 = 0.003742636623226406;

Kp = 4.560255754290251;
Ki = 0.2591464783808238;

Ts = 0.2;
SP = 50;
PV = 0;
resp = 0;
AcaoIntegral = 0;
tempo = 0:0.2:1735;

for i = 0.1:0.2:1735
  Erro = SP - PV;
  AcaoProporcional = Kp*Erro;
  AcaoIntegral = AcaoIntegral + Ki*Ts*Erro;
  AcaoControlador = AcaoProporcional + AcaoIntegral;
  PV = a1*PV + b1*AcaoControlador;
  resp = [resp PV];
end

plot(tempo,resp)
