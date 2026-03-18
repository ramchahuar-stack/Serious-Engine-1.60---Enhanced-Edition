# Serious Engine 1.60 - Enhanced Edition

Motor de juegos clásico con estabilidad y rendimiento mejorados, incluyendo soporte para motores gráficos modernos y el innovador sistema de scripting SeriousScript.

## 🚀 Características Principales

### Motor Gráfico Extendido
- **DirectX 8/11** y **OpenGL** con soporte completo
- **Sistema de shaders avanzado** con compatibilidad moderna
- **Gestión de memoria mejorada** para mejor rendimiento
- **Herramientas de depuración mejoradas**
- **Compatibilidad total** con contenido existente de Serious Sam

### SeriousScript - Sistema de Scripting Avanzado
- **Lenguaje híbrido** que combina scripting interpretado con código nativo
- **Sintaxis en español** para mayor accesibilidad
- **Sistema de entidades** orientado a objetos
- **Corrutinas y scripts** para lógica compleja
- **Eventos y procedimientos** para arquitectura modular
- **Integración nativa** con el motor C++

### Herramientas de Desarrollo
- **SeriousScript Compiler** - Compilador del lenguaje de scripting
- **World Editor** - Editor de mundos y niveles
- **Serious Ska Studio** - Editor de animaciones
- **UI Tool** - Herramienta de interfaces de usuario
- **Font Generator** - Generador de fuentes
- **Modeler Tools** - Herramientas de modelado

## 🛠️ Compilación

### Requisitos
- Visual Studio 2010 o superior
- DirectX SDK (para soporte D3D11)
- Windows SDK

### Compilar el Motor
```bash
cd Build
build_enhanced_graphics.bat
```

### Compilar SeriousScript
```bash
cd Tools/SeriousScriptCompiler
msbuild SeriousScriptCompiler.vcxproj
```

## 📖 SeriousScript - Guía Rápida

### Estructura Básica de una Entidad
```seriousscript
entidad MiEntidad : EntidadBase {
    nombre "Mi Entidad Personalizada"
    
    propiedades:
        1 numero vida "Puntos de Vida" = 100.0
        2 texto nombre "Nombre" = "Entidad"
        3 booleano activo "Está Activo" = verdadero
    
    funciones:
        funcion RecibirDaño(cantidad: numero) -> booleano {
            vida = vida - cantidad
            si vida <= 0 entonces
                Morir()
                retornar verdadero
            fin
            retornar falso
        }
        
        script ActualizarLogica() {
            // Lógica de actualización
            esperar()
        }
        
        // Función nativa para rendimiento crítico
        nativo ProcesarFisica() {
            // Código C++ optimizado
        }
    
    procedimientos:
        Principal() {
            InicializarComoModelo()
            mientras verdadero hacer
                ActualizarLogica()
            fin
        }
}
```

### Características del Lenguaje
- **Tipos de datos**: numero, texto, booleano, vector3, tabla, entidad
- **Estructuras de control**: si/sino, mientras, para cada
- **Funciones híbridas**: Combinan scripting con código nativo
- **Corrutinas**: Para lógica asíncrona con `esperar`
- **Eventos**: Sistema de comunicación entre entidades
- **Importación de módulos**: `importar Utilidades, Fisica, Audio`

## 🎮 Comandos de Consola

### Información del Sistema
```
gfx_info()              # Información del sistema gráfico
se_version()            # Detalles de la versión del motor
ss_compile(archivo)     # Compilar archivo SeriousScript
ss_reload()             # Recargar scripts modificados
```

### Depuración
```
debug_entities()        # Listar entidades activas
debug_scripts()         # Estado de scripts en ejecución
debug_memory()          # Información de memoria
```

### Gráficos
```
gfx_api(tipo)          # Cambiar API gráfica (ogl, d3d, d3d11)
gfx_shaders(estado)    # Habilitar/deshabilitar shaders
gfx_vsync(estado)      # Control de sincronización vertical
```

## 🏗️ Arquitectura del Motor

### Componentes Principales
```
Sources/Engine/
├── Graphics/           # Sistema gráfico extendido
├── SeriousScript/      # Sistema de scripting
│   ├── Compiler/       # Compilador del lenguaje
│   ├── Runtime/        # Runtime y VM
│   └── Examples/       # Ejemplos de código
├── Network/            # Sistema de red
├── Sound/              # Sistema de audio
├── Physics/            # Motor de física
├── Entities/           # Sistema de entidades
└── World/              # Gestión de mundos
```

### Herramientas
```
Tools/
├── SeriousScriptCompiler/  # Compilador de scripts
├── WorldEditor/            # Editor de mundos
├── SeriousSkaStudio/       # Editor de animaciones
├── UITool/                 # Editor de interfaces
├── Modeler/                # Herramientas de modelado
└── FontGen/                # Generador de fuentes
```

## 🔧 APIs Gráficas Soportadas

### DirectX 11 (Nuevo)
- Soporte completo para características modernas
- Shaders programables avanzados
- Mejor rendimiento en hardware moderno
- Compatibilidad con Windows 10/11

### DirectX 8 (Legado)
- Compatibilidad total con contenido existente
- Soporte para hardware más antiguo

### OpenGL (Multiplataforma)
- Soporte básico para compatibilidad
- Ideal para desarrollo multiplataforma

## 📝 Ejemplos de Uso

### Crear un Enemigo Básico
Ver `Sources/Engine/SeriousScript/Examples/JuegoCompleto.ss` para un ejemplo completo de:
- Sistema de jugador con inventario
- IA de enemigos con persecución
- Sistema de experiencia y niveles
- Gestión de items y coleccionables
- Efectos visuales y sonoros

### Integración con C++
```cpp
// Registrar función nativa desde C++
void RegisterNativeFunction() {
    SeriousScript::RegisterNative("MiFuncionNativa", 
        [](SSContext* ctx) -> SSValue {
            // Implementación en C++
            return SSValue::CreateNumber(42.0f);
        });
}
```

## 🔄 Compatibilidad

- **100% compatible** con todo el contenido existente de Serious Sam
- **Mods existentes** funcionan sin modificación
- **Mapas y modelos** del motor original soportados
- **Scripts legacy** pueden coexistir con SeriousScript

## 📋 Requisitos del Sistema

### Mínimos
- Windows 7 SP1 o superior
- DirectX 9.0c compatible
- 2 GB RAM
- Tarjeta gráfica compatible con DirectX 9

### Recomendados
- Windows 10/11
- DirectX 11 compatible
- 4 GB RAM o más
- Tarjeta gráfica moderna con soporte de shaders

## 🤝 Contribución

1. Fork del repositorio
2. Crear rama para nueva característica
3. Implementar cambios con documentación
4. Probar compatibilidad con contenido existente
5. Enviar pull request

## 📄 Licencia

Misma licencia que el Serious Engine original. Ver archivos de licencia para detalles específicos.

## 🆕 Últimas Actualizaciones

### v1.60 Enhanced Edition
- ✅ **SeriousScript**: Sistema completo de scripting en español
- ✅ **DirectX 11**: Soporte para gráficos modernos
- ✅ **Herramientas mejoradas**: Compilador y editores actualizados
- ✅ **Compatibilidad total**: Con contenido existente
- ✅ **Rendimiento optimizado**: Mejor gestión de memoria y recursos
- ✅ **Depuración avanzada**: Herramientas mejoradas para desarrollo