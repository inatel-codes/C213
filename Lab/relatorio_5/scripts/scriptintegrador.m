a1 = 0.99736;
b1 = 0.0019800;

Kp = 8;
Ki = 0.2;

Ts = 0.1;
SP = 1;
PV = 0;
resp = 0;
AcaoIntegral = 0;
tempo = 0:0.1:240;

for i = 0.1:0.1:240
  Erro = SP - PV;
  AcaoProporcional = Kp*Erro;
  AcaoIntegral = AcaoIntegral + Ki*Ts*Erro;
  AcaoControlador = AcaoProporcional + AcaoIntegral;
  PV = a1*PV + b1*AcaoControlador;
  resp = [resp PV];
end

plot(tempo,resp)
