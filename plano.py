import time
import math

def seno_grados(angulo_grados):
    # Convertir de grados a radianes y calcular el seno
    return math.sin(math.radians(angulo_grados))

while (True):
    # El valor a encontrar 
    aceleracion = 0


    time_out = 5
    tiempo = 0

    gravedad = 9.81
    masa = 1

    weight = masa * gravedad

    velocidad_x = 0
    velocidad_y = 0

    alpha = input("Dame el valor de alpha: \n")
    alpha = float(alpha)
    seno_alpha = seno_grados(alpha)

    cateto_opuesto = 100
    hipotenusa = cateto_opuesto / seno_alpha

    for segundo in range(1, time_out + 1):
        print(f"Segundos transcurridos: {segundo}")
        tiempo = segundo

        velocidad_y = gravedad * tiempo
        aceleracion = (seno_alpha * weight)/masa

        velocidad_x = aceleracion*tiempo

        
        time.sleep(1) 
        print(f"Esta es la velocidad en Y {velocidad_y}")
        print(f"La aceleracion es de {aceleracion}")
        print(f"Velocidad en x es {velocidad_x}")
        print(f"\n")