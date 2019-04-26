function Write_AES_EBU(StreamWav)
% ETSI Telecomunicacion
% Universidad Rey Juan Carlos
% Genera una trama de audio AES-EBU
close('all');

StreamOut= 'Ficero_Salida_AES_EBU.aes';
%%
SubFrameL=int32(0)
SubFrameR=int32(0);

%% Ejemplo bitshift
a = intmax('uint8');
s1 = 'Initial uint8 value %5d is %08s in binary\n';
s2 = 'Shifted uint8 value %5d is %08s in binary\n';
fprintf(s1,a,dec2bin(a))
 for i = 1:8
    a = bitshift(a,4);
    fprintf(s2,a,dec2bin(a))
 end
%%
% LEEMOS el stream de entrada
%%
[AudioData,Fs] = audioread('muestra2448.wav')
sound(AudioData,Fs);
%%

% Nuestro data esta en tipo float double

%%lo pasamos a int32%
IntData = int32(AudioData)
%%
% Hacemos un bucle para crear tramas 192 tramas Subframes

for Sf=1:192
    
    %Este If es para ajustar el preambulo (XYZ)
    % Si e el prinmer subframe al L le ponemos le preambulo Z
    if Sf==1
        %Preambulo Z 
    else
        
        % Al L le escribmos el preambulo X y al R el Y
        
    end
    
    % Insertamos las muestras de audio entre le bit b28 y el b4 para el L y
    % R
    
    bitshift(IndData,4)  % Se desplazan 4 posiciones
    
    % insertamos los bits de V, U, C
    
    
    bitor(0,1) %para poner bit a 1 falta incrustarlo en la cabecera, usaremos de nuevo bitshift
    
    % Vamos a poner el bit de U=1 porque queremo enviar datos auxilaires en
    % los 4 bits en lugar de  audio
  %%
    
    % Escribo el Subframe L
    fwrite(FileIDOut,SubFrameL);
    
    %Escribo el Subframe R
    fwrite(FileIDOut,SubFrameR);
    
    
end


fclose(FileIDOut);






