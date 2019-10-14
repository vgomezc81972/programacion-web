var FormatoFecha = "AAAA-MM-DD";
var SepMiles = ",";
var SepDecimal = ".";
var AnoInicial = 1870;
var AnoFinal = 2060;

var Rutinas = {
  Version: '1.0.0.3',

  Browser: {
    IE:     !!(window.attachEvent && navigator.userAgent.indexOf('Opera') === -1),
    Opera:  navigator.userAgent.indexOf('Opera') > -1,
    WebKit: navigator.userAgent.indexOf('AppleWebKit/') > -1,
    Gecko:  navigator.userAgent.indexOf('Gecko') > -1 && navigator.userAgent.indexOf('KHTML') === -1,
    MobileSafari: !!navigator.userAgent.match(/Apple.*Mobile.*Safari/)
  }
};


function validarTecla(event,li_tipo){
   var tecla = (document.all) ? event.keyCode : event.which; 
    if (tecla==8) return true; 
    if (tecla==0) return true; 
    
    
    if (event.ctrlKey){
      return true;
    }
    if (event.altKey){
      return true;
    }

    // retornar si las teclas son enter , tab o shit
    if (tecla==9){
       return true;
    }
	
    if (tecla==13  && li_tipo != "ALSE" ){
      if (Rutinas.Browser.IE){
        event.returnValue=false;
      }
      else {       
        event.preventDefault();
      }  
	  return true;
    }
    
    var patron =""; 
    switch(li_tipo){
		case "LE": // Permite unicamente letras, espacio blanco, ñ, Ñ, tilde de vocales mayusculas y minusculas
                  patron = /[A-Za-z_ ]/; 
			break;
		case "AL": // Elimina Unicamente comilla y doble comilla
		case "ALSE": // Elimina Unicamente comilla y doble comilla
		case "NO": // Permite unicamente numeros y letras
                  patron = /[A-Za-z0-9{}_áéíóúñÑ;,:.!#@$%&/()=?¡"\s-]/; 
			break;
		case "F2": // Unicamente permite numeros y el /
                  patron =/[0123456789/]/; 
			break;
		case "FE": // Unicamente permite numeros y el -
                  patron =/[0123456789/-]/; 
			break;
		case "EN": // Unicamente permite numeros
                  patron = /\d/;  
			break;
		case "DE": // Permite numeros y el punto decimal
                  patron =/[0123456789.-]/; 
			break;
		case "HO": // Unicamente permite numeros y el :
                  patron =/[0123456789:]/; 
			break;
    }	
    var te = String.fromCharCode(tecla); 
    if (patron.test(te)==false ){
      if (Rutinas.Browser.IE){
        event.returnValue=false;
      }
      else {       
        event.preventDefault();
      }       
    }
}


function Mostrar(){
 try{   
   for (var i=0;i<document.forms.length;i++){
     len     =       document.forms[i].elements.length;
     var     index   =       0;
     for( index=0; index < len; index++ ){
       if (document.forms[i].elements[index].type=="submit" || document.forms[i].elements[index].type=="button"){
          document.forms[i].elements[index].style.display='';
      }
     }    
   }
  }
  catch(e){
  }
  return true;
}

function validarEmail(email) 
{
     if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)){
       return (true)
     }
     return (false);
}  

function jesfecha(fstring)
{
	var ano;
	var mes;
	var dia;
	if(FormatoFecha == "AAAA-MM-DD"){
		ano = parseInt(fstring.substring(0,4),10);
		mes = parseInt(fstring.substring(5,7),10);
		dia = parseInt(fstring.substring(8,10),10);
	}
	else if(FormatoFecha == "DD/MM/AAAA"){
		dia = parseInt(fstring.substring(0,2),10);
		mes = parseInt(fstring.substring(3,5),10);
		ano = parseInt(fstring.substring(6,10),10);
	}
	var vanoini = AnoInicial;
	var vanofin = AnoFinal;

       /*
	if(isNaN(parseInt(anoini, 10)) == false)
		vanoini = parseInt(anoini, 10);

	if(isNaN(parseInt(anofin, 10)) == false)
		vanofin = parseInt(anofin, 10);
		
      */

	if(fstring.length != 10)
	{
		mostrar_error(7, fstring, FormatoFecha);
		return false;
	}
	if(isNaN(dia) == true)
	{
		mostrar_error(8, fstring.substring(8, 10));
		return false;
	}
	if(isNaN(mes) == true)
	{
		mostrar_error(9, fstring.substring(5, 7));
		return false;
	}
	if(isNaN(ano) == true)
	{
		mostrar_error(10, fstring.substring(0, 4));
		return false;
	}
	if(ano < vanoini || ano > vanofin)
	{
		mostrar_error(11, ano, vanoini, vanofin);
		return false;
	}
	if(mes < 1 || mes > 12)
	{
		mostrar_error(12, mes);
		return false;
	}
	if(dia < 1 || dia > 31)
	{
		mostrar_error(13, dia);
		return false;
	}
	var bisiesto = (Math.floor(ano/4) * 4 ) - ano;
	/* si da cero es bisiesto */
	if(( (mes==2 || mes==4 || mes==6 || mes==9 || mes==11) && dia==31)
	   || (mes==2 && bisiesto==0 && dia>29) || (mes==2 && bisiesto!=0 && dia>28))
	{
		mostrar_error(14, dia);
		return false;
	}
	return true;
}

function mostrar_error(error)
{
	var args = mostrar_error.arguments;
	var Errores = new Array();
	Errores[0] = "Sesion no valida.";
	Errores[1] = "El campo " + args[1] + " es obligatorio.";
	Errores[2] = "El campo " + args[1] + "( " + args[2] + " ) debe ser numérico.";
	Errores[3] = "El campo " + args[1] + "( " + args[2] + " ) debe ser mayor o igual a " + args[3];
	Errores[4] = "El campo " + args[1] + "( " + args[2] + " ) debe ser menor o igual a " + args[3];
	Errores[5] = "El campo " + args[1] + " no debe tener decimales ";
	Errores[6] = "El campo " + args[1] + " debe ser una fecha válida (" + args[2] + ")";
	Errores[7] = "La fecha " + args[1] + " debe estar en formato " + args[2];
	Errores[8] = "El día " + args[1] + " no es un número.";
	Errores[9] = "El mes " + args[1] + " no es un número.";
	Errores[10] = "El año " + args[1] + " no es un número.";
	Errores[11] = "El año " + args[1] + " debe estar entre " + args[2] + " y " + args[3] + ".";
	Errores[12] = "El mes " + args[1] + " es inválido.";
	Errores[13] = "El día " + args[1] + " es inválido.";
	Errores[14] = "El día " + args[1] + " es inválido para el mes digitado.";
	Errores[15] = "El campo " + args[1] + " no puede tener mas de " + args[2] + " caracteres.";
	Errores[16] = "El campo " + args[1] + "( " + args[2] + " ) debe ser un email válido.";
	Errores[17] = "";
	Errores[18] = "";
	Errores[19] = "";
	Errores[20] = "";
	Errores[21] = "El campo " + args[1] + " debe tener mínimo " + args[2] + " caracter(es).";
	Errores[22] = "El campo " + args[1] + " debe ser igual al campo " + args[2] + ".";
	Errores[23] = "El usuario se encuentra INACTVO. Por favor comunicarse con el CALL CENTER";
	Errores[24] = "El campo " + args[1] + " debe tener máximo " + args[2] + " caracter(es).";

	alert(Errores[error]);
}