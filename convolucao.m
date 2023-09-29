[h, Fh] = audioread('Church Schellingwoude.wav');
[u, Fs] = audioread('ze-da-maaanga.wav');

hmono = h(:,1);
umono = u(:,1);

#GRAVAÇÃO:

rec = audiorecorder(Fh,16,1,-1);
disp("gravando");

recordblocking(rec,5);
disp("finazado");

x = getaudiodata(rec, 'double');

#CONVOLUÇÃO:

y = conv(hmono, x);

#TRATAMENTO DE AUDIO
ganho1 = sqrt(var(hmono));
ganho2 = sqrt(var(y));

ys=(ganho1/ganho2)*y;

audiowrite('teste.wav',ys,Fs);

