a1 = 0.99736
b1 = 0.0019800
tempo = 0:0.1:240;

Kp = 4;
Ki = 0.1;
Kd = 1;

Ts = 0.1;
SP = 1;
PV = 0;
resp = 0;
AcaoInt = 0;
ErroAnterior = SP - PV;

for i = 0.1:0.1:240
  Erro = SP - PV;
  AcaoProp = Kp*Erro;
  AcaoInt = AcaoInt + Ki*Ts*Erro;
  AcaoDeriv = ((Erro - ErroAnterior)/Ts)*Kd;
  ErroAnterior = Erro;
  AcaoControlador = AcaoProp + AcaoInt + AcaoDeriv;
  PV = a1*PV + b1*AcaoControlador;
  resp = [resp PV];
end

plot(tempo,resp)
