voz=audiorecorder
disp('Grabando...')
recordblocking(voz,5);
disp('Fin de la grabación');
play(voz);
figure(1)
y=getaudiodata(voz);
plot(y)
sound(y,8000)
figure(2)
audiofourier=(fftshift(fft(y)));
plot(abs(audiofourier));
original=ifft(fftshift(audiofourier));
figure(3)
plot(original);
sound(original,8000);

for i=1:1:1000
    audiofourier(i)=0;
    audiofourier(length(audiofourier)-(i-1))=0;
end
