import wollok.vm.*
//Escribir aqui los objetos

object galvan {

    var sueldo = 15000
    var dinero = 0
    var deuda = 0

    method cobrar(){
        if (sueldo >= deuda){
            dinero = dinero + sueldo - deuda
            deuda = 0
        }
        else{
            deuda = deuda - sueldo
        }
        return sueldo
    }

    method gastar(cuanto){
        if (dinero >= cuanto){
            dinero = dinero - cuanto
        }
        else{
            deuda = deuda + cuanto - dinero
            dinero = 0
        }
    }

    method deuda(){
        return deuda
    }

    method sueldo(){
        return sueldo
    }

    method dinero(){
        return dinero
    }

    method sueldo(nuevoSueldo){
        sueldo = nuevoSueldo
    }
}

object baigorria {
    
    const gananciaPorVenta = 15
    var ventas = 0
    var dinero = 0

    method cobrar(){
        const porCobrar = self.sueldo()
        dinero = dinero + porCobrar
        ventas = 0
        return porCobrar
    }

    method vender(cantidad){
        ventas = ventas + cantidad
    }

    method sueldo(){
        return ventas * gananciaPorVenta
    }

    method totalCobrado(){
        return dinero
    }
}

object gimenez {
    var fondo = 300000

    method pagarSueldo(empleado){
        const pago = empleado.cobrar()
        fondo = fondo - pago
        return pago
    }

    method fondo(){
        return fondo
    }

    method pagarAEmpleados(){
        const pago = self.pagarSueldo(baigorria) + self.pagarSueldo(galvan)
        return pago
    }
}