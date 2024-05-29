 markdown
# Aplicación Triqui

Este repositorio contiene los archivos necesarios para desplegar y ejecutar una aplicación en un contenedor Docker, así como los archivos Terraform necesarios para desplegar automáticamente la infraestructura en AWS.

## Requisitos Previos

1. Tener instalado [Git](https://git-scm.com/).
2. Tener instalado [Docker](https://www.docker.com/get-started).
3. Tener instalado [Terraform](https://www.terraform.io/downloads).
4. Una cuenta de AWS y configurar las credenciales de AWS en tu máquina local.

## Instrucciones

### 1. Clonar el Repositorio

Para clonar este repositorio, abre una terminal y ejecuta el siguiente comando:


git clone https://github.com/MarinNoSkill/apptriqui.git

cd apptriqui


### 2. Instalar Terraform y Configurar la Cuenta de AWS

#### Instalación de Terraform

1. Descarga Terraform desde la [página oficial](https://www.terraform.io/downloads).
2. Extrae el archivo descargado y coloca el ejecutable en un directorio incluido en tu variable de entorno `PATH`.

Para verificar la instalación, ejecuta:


terraform -v


Deberías ver la versión de Terraform instalada.

#### Configurar las Credenciales de AWS

Terraform requiere acceso a tu cuenta de AWS para desplegar la infraestructura. Para configurar tus credenciales de AWS, sigue estos pasos:

1. Instala AWS CLI desde la [página oficial](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

2. Crea un directorio llamado `.aws` en tu carpeta de inicio si no existe:


mkdir ~/.aws


3. Dentro de ese directorio, crea un archivo llamado `credentials`:


touch ~/.aws/credentials


4. Abre el archivo `credentials` en un editor de texto y añade tu `AWS Access Key ID` y `AWS Secret Access Key` en el siguiente formato:

plaintext
[default]
aws_access_key_id = TU_ACCESS_KEY_ID
aws_secret_access_key = TU_SECRET_ACCESS_KEY


### 5. Desplegar la Infraestructura en AWS con Terraform

#### Inicializar Terraform

Antes de aplicar los cambios, debes inicializar el entorno de trabajo de Terraform. Desde el directorio donde clonaste el repositorio, ejecuta:


terraform init


Este comando descarga los proveedores necesarios y prepara el entorno de trabajo.

#### Aplicar los Cambios

Para desplegar la infraestructura, utiliza el comando `terraform apply`. Este comando creará todos los recursos definidos en los archivos de configuración de Terraform. Ejecuta:


terraform apply


Se te pedirá confirmar la acción escribiendo `yes`. Terraform comenzará a crear los recursos en AWS.

#### Verificar el Despliegue

Una vez completado el comando `terraform apply`, puedes verificar en la consola de AWS que los recursos han sido creados correctamente.

## Contribuciones

Si deseas contribuir a este proyecto, por favor realiza un fork del repositorio y envía un pull request con tus cambios.

## Licencia

Este proyecto está bajo la Licencia MIT. Para más detalles, consulta el archivo [LICENSE](LICENSE).
