# Portal de Viáticos Durandco — versión productiva multiusuario

Esta versión conserva el diseño del `index.html`, pero mueve la información compartida al servidor.

## Incluye

- Login real con contraseña cifrada.
- Sesiones seguras mediante cookie HttpOnly.
- Base SQLite compartida para usuarios, solicitudes, firmas, aprobaciones, catálogos y tarifas.
- Flujo: **Jefe inmediato firma → Giovanni aprueba y marca el recurso listo**.
- Roles y permisos validados también en el servidor.
- Sincronización automática cada 30 segundos.
- Bitácora de operaciones y descarga de respaldo para el usuario maestro.
- Dockerfile y `render.yaml` listos para Render.

## Credenciales iniciales

| Perfil | Correo | Contraseña inicial |
|---|---|---|
| Giovanni / Maestro | `giovanni.gonzalez@empresa.com` | `Giovanni2026!` |
| Jefe inmediato de prueba | `jefe.inmediato@empresa.com` | `Jefe2026!` |
| Usuario de prueba | `direccion@empresa.com` | `Direccion2026!` |

Cambia las contraseñas al ingresar. Mantén el repositorio **privado**, porque las credenciales iniciales también están definidas en el código de instalación.

## Publicar en Render

1. Crea un repositorio privado y sube **el contenido de esta carpeta**, no la carpeta envolvente ni el ZIP.
2. En la raíz de GitHub deben verse directamente:
   - `Dockerfile`
   - `package.json`
   - `server.js`
   - `render.yaml`
   - carpeta `public`
3. En Render selecciona **New → Blueprint** y conecta el repositorio.
4. Render leerá `render.yaml` y creará:
   - servicio Docker Starter;
   - disco persistente de 1 GB montado en `/data`;
   - health check `/api/health`.
5. Espera a que el estado sea **Live**.

## Actualizar la aplicación

- Diseño, formularios, dashboard y Excel: `public/index.html`.
- Backend, seguridad y almacenamiento: `server.js`.
- Después de modificar, sube el archivo a GitHub y haz **Commit changes**. Render desplegará el cambio automáticamente.

## Respaldo

Giovanni puede usar el botón **Descargar respaldo**. El archivo SQLite contiene la base compartida completa.

## Ejecución local

Requiere Node.js 22.5 o superior:

```bash
node server.js
```

Después abre `http://localhost:3000`.
