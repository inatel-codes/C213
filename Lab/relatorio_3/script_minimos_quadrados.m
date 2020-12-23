resp = resp0_2
degrau = degrau0_2
tempo = tempo0_2

[L, C] = size(resp); %Dimens�es do vetor resp - [L, C] - L linhas e C colunas
if (L > 1) %N�mero de linhas do vetor coluna
  F = [resp(1:L-1,1) degrau(1:L-1,1)];
  J = [resp(2:L,1)];
elseif (C > 1) %N�mero de colunas do vetor linha
  F = [resp(1,1:C-1); degrau(1,1:C-1)]';
  J = [resp(1,2:C)]';
end

Theta = inv(F'*F)*F'*J; %C�lculo matricial

a1 = Theta(1)
b1 = Theta(2)
clear L
clear C
clear F
clear J
clear Theta

sysZ = tf(b1,[1 -a1],0.2) %Tempo de amostragem de 0.1 segundos
sysS = d2c(sysZ)
