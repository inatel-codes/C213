[L, C] = size(resp); %Dimensões do vetor resp - [L, C] - L linhas e C colunas
if (L > 1) %Número de linhas do vetor coluna
  F = [resp(1:L-1,1) degrau(1:L-1,1)];
  J = [resp(2:L,1)];
elseif (C > 1) %Número de colunas do vetor linha
  F = [resp(1,1:C-1); degrau(1,1:C-1)]';
  J = [resp(1,2:C)]';
end

Theta = inv(F'*F)*F'*J; %Cálculo matricial

a1 = Theta(1)
b1 = Theta(2)
clear L
clear C
clear F
clear J
clear Theta

sysZ = tf(b1,[1 -a1],0.1) %Tempo de amostragem de 0.1 segundos
sysS = d2c(sysZ)
