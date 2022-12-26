//AppTranslation.dart
abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en_US": enUS,
    "es": es,
  };
}

final Map<String, String> enUS = {
  //Loading
  'Cargando Datos...': 'Loading data...',
  //Login
  'Iniciar Sesión': 'Login',
  'Correo Electrónico': 'Email',
  'Contraseña': 'Password',
  'Ingresar': 'Get',
  'O Iniciar Sesión con:': 'Login with',
  '¿Perdió su Acceso?': 'Lost your access?',
  'recupérala aquí': 'get it back here',
  '¿Aún no tienes una cuenta?': 'Do not you have an account yet?',
  'Crea Una': 'Create One',
  'Su Correo Electrónico o la contraseña están mal...':
      'Your Email or password is wrong...',
  'Ingrese un Correo Electrónico Valido...': 'Enter a valid email address...',

//Recuperar Cuenta
  'Recuperar Cuenta': 'Recover your Account',
  'Correo de recuperación': 'Recover Email',
  'Enviar Código': 'Send Code',
  'El Correo Electrónico no Existe...': 'Email Doesn\'t Exist...',
  'Ingrese un Correo Electrónico...': 'Enter an Email...',
//logintemp
  'Ingrese el Código de Acceso de Recuperación o Revise su Correo Electronico.':
      'Enter the Recovery Access Code or Check your Email.',
  'Código de Acceso': 'Access code',
  'Sesión Temporal': 'Temporary Session',
  'Ingrese un Código Valido...': 'Enter a Valid Code...',
  'Ingrese Código de Recuperacón...': 'Enter Recovery Code ...',
  'No hay Conexión a Internet': 'There is no Internet conection',
//Registrarse
  'Registro': 'Register',
  'Regístrese': 'Sign up',
  'Telefono': 'Phone',
  'Nombres': 'Name',
  'Apellidos': 'Last Name',
  'Doc. de Identidad': 'Identification document',
  'Sexo': 'Sex',
  'Fecha de Nacimiento': 'Date of Birth',
  'Estoy de acuerdo con los terminos y condiciones':
      'I agree with the terms and conditions',
  'Registrar Ahora': 'Register Now',
  '¿Ya tienes una cuenta?': 'Do you already have an account?',
  'Estoy de acuerdo con los': 'I agree with the',
  'términos y condiciones': 'terms and conditions',
  'Minimo 8 digitos': 'Minimum 8 digits',
  'Minimo un digito Mayuscula': 'Minimum one uppercase digit',
  'Minimo un numero': 'Minimum one number',
  'La Contraseña Debe ser Mayor a 8...': 'Password must be greater than 8...',
  'Correo Electrónico no Valido...': 'Invalid Email...',
  'Acepte los Términos y Condiciones...': 'Accept the Terms and Conditions...',
  'Complete el Formulario...': 'Complete the Form...',
//Home
  'A Donde Quiere Viajar hoy?': 'Where do you want to travel',
  'Origen': 'Source',
  'Seleccione su Ruta': 'Select your route',
  'LLegada': 'Arrival',
  'Servicios': 'Services',
  'Seleccione el Servicio': 'Select Service',
  'Modo': 'Mode',
  'Seleccione su Modo': 'Select mode',
  'Vehiculo': 'Vehicle',
  'Seleccione su Vehiculo': 'Select Vehicle',
  'Publicar': 'Post',
  'Completo': 'Complete',
  'Colectivo': 'Collective',
  'Independiente': 'Independent',
  'Empresa': 'Business',
//Reservas
/* 'Servicios':'Services', */
  'Modo:': 'MOde',
  'Fecha de salida': 'Departure date',
  'Estado': 'Status',

//Reservas / Agregar
  'Agregar': 'Add',
  'Si no Viajaremos hoy, ¡Viajaremos mañana!':
      'If we dont travel today, we will travel tomorrow!',
  'Fecha y Hora': 'Date and Time',
  'Agregar y Publicar': 'Add and Post',
  'Cancelar': 'Cancel',
//Social
  'Correo': 'Email',
  'Dirección': 'Address',
  //Chat
  'Enviar mensaje': 'Send Message',
  'Camara': 'Camera',
  'Galeria': 'Gallery',
  'Mi Ubicación': 'My Location',
  'Perfil': 'Profile',
// Profile
  'Historial de Viajes': 'Travel History',
  //Detalles
  'Hora de Salida': 'Departure Time',
  'Hora de llegada': 'Check In',
  'N°  Pasajeros:': 'N° Passengers',
  'Calificación': 'Qualification',
  'Vehiculo:': 'Vehicle',
  'Billetera': 'Wallet',
  // Billetera
  'Cobro Automático de suscripciones.': 'Automatic suscription charge.',
  'Recargar': 'Recharge',
  'Pagar': 'Pay',
  'Sin tarjeta registrada': 'No registered card',
  'Agregar más métodos de pago': 'Add more payment methods',
  'Mis movimientos': 'My movements',
  // AJustes-chats
  'Fondos de pantalla': 'Wallpapers',
  'Enter para enviar': 'Log in to send',
  'La tecla Enter enviara tu mensaje': 'The enter key will send your message',
  'Visibilidad de las imagenes': 'Image Visibility',
  'Las imagenes se mostraran en la galeria del dispositivo':
      'The images will be displayed in the gallery of the device',
  'Notificaciones': 'Notifications',
  // Notificaciones
  'Mostrar notificaciones, reproducir sonidos para los mensajes entrantes y salientes':
      'Show notifications, play sounds for incoming and outgoing messages',
  'Tono de notificación': 'Notification tone',
  'Vibración': 'Vibration',
  'Notificaciones de alta prioridad': 'High priority notifications',
  'Mostrar vistas previas de notificaciones': 'Show notifications previews',
  'Ayuda': 'Help',
  'Cerrar Sesión': 'Sing off',
  //Help
  'Centro de ayuda': 'Help Center',
  'Contáctanos': 'Contact us',
  'Condiciones y Privacidad': 'Conditions and Privacy',
  'Info. de la Aplicación': 'Application Info',
  'Preguntas, necesitas ayuda y recomendaciónes':
      'Questions, need help and recommendations',
  //Ajustes
  'Ajustes': 'Settings',
  'Chats': 'Chats',
  'Idioma': 'language',
  'Fondos de pantalla y otros': 'Wallpapers and other',
  'Tonos de mensajes y notificaciones': 'Message and notification tones',
  'Centro de ayuda, contáctanos y politica de privacidad':
      'Help center, contact us and privacy policy',
};

final Map<String, String> es = {
  'Sun': 'Domingo',
  //aAjustes
  'Ajustes': 'Ajustes',
  'Chats': 'Chats',
  'Notificaciones': 'Notificaciones',
  'Ayuda': 'Ayuda',
  'Idioma': 'Idioma',
  'Wallpapers and other': 'Fondos de pantalla y otros',
  'Tonos de mensajes y notificaciones': 'Tonos de mensajes y notificaciones',
  'Centro de ayuda, contáctanos y politica de privacidad':
      'Centro de ayuda, contáctanos y politica de privacidad',
};
