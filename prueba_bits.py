import wave
import struct

""" Leemos el audio """
audio = open('muestra2448.wav','rb')
audio.read(2)
print(audio.read(2))
# """ Calculamos el numero de muestras """
# nframes = audio.getnframes()
# """ Almacenamos las muestras en bytes """
# muestras_audio = audio.readframes(1)

Stream_out = open("aesebu_output.aes", "w")
# x = 'Sergiomarickmlmklon'

# x=muestras_audio
# map(ord, list(x))

# print([ord(i) for i in x])

s1 = struct.unpack('h', audio)
Stream_out.write(s1[0])

Stream_out.close()
