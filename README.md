# Adivina el Número - Juego en Flutter

Una aplicación móvil desarrollada con Flutter que implementa el clásico juego "Adivina el Número".

## Descripción

En este juego, el sistema genera un número aleatorio entre 1 y 100. El jugador debe:
1. Usar un control deslizante para seleccionar un número
2. Presionar el botón "TRY" para adivinar
3. Obtener puntos basados en la cercanía de su adivinanza

## Características

- Interfaz intuitiva con slider para seleccionar números
- Sistema de puntuación basado en la precisión de la adivinanza
- Historial de los últimos intentos del jugador
- Reinicio del juego

## Implementación del Historial de Intentos

Para mostrar los últimos intentos del usuario, implementamos:

1. **Almacenamiento de datos**:
   - En la clase `Game`, se añadió una lista `_attempts` que almacena los últimos intentos
   - Cada intento contiene el valor adivinado y los puntos obtenidos
   - La lista está limitada a los 2 intentos más recientes

2. **Visualización**:
   - Los intentos se muestran utilizando un `ListView.builder` para una mejor experiencia de usuario
   - Cada intento se presenta como un `Card` con información sobre el valor adivinado y los puntos obtenidos
   - Se utiliza un contenedor con altura y ancho fijos para mantener la consistencia visual
   - La implementación con `ListView` permite escalabilidad, aunque actualmente solo se muestren 2 elementos

3. **Patrón de diseño**:
   - Se utiliza el patrón MVVM (Model-View-ViewModel) para separar la lógica del juego de la interfaz
   - El `ViewModel` expone los intentos a la vista a través de un getter
   - La vista (`ContentView`) observa el `ViewModel` para mantenerse actualizada

Esta implementación proporciona una experiencia más fluida y profesional al usuario, utilizando componentes estándar de Flutter que facilitan el mantenimiento y la escalabilidad del código.

## Beneficios del uso de ListView

- **Rendimiento optimizado**: Aunque actualmente solo se muestran 2 elementos, ListView solo renderiza los elementos visibles en pantalla
- **Escalabilidad**: Si en el futuro se decide aumentar el número de intentos mostrados, el código ya está preparado
- **Experiencia de usuario**: Proporciona una experiencia más fluida y familiar para el usuario
- **Estilo visual mejorado**: Utilizamos Cards para cada intento, mejorando el aspecto visual

## Arquitectura

- Patrón MVVM para separación de responsabilidades
- Gestión de estado con Provider
- Componentes reutilizables como SliderWidget
